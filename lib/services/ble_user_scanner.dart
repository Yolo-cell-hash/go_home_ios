// services/ble_user_scanner.dart
// Background BLE scanner that detects digital lock advertisement payloads
// and auto-identifies users based on the last 8 hex characters of
// manufacturer data. Runs silently — no UI shown to the user.
//
// Lock MAC: FD:D6:FE:3A:9D:9B
// Scan cycle: 6s scan → 4s pause (repeating)
// Cooldown after detection: 10s
// iOS-focused implementation

import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// ---------------------------------------------------------------------------
// CONFIGURATION
// ---------------------------------------------------------------------------

/// The MAC address (remoteId) of the digital lock to monitor.
/// On iOS, CoreBluetooth may use a random UUID instead of the real MAC.
/// If the real MAC is not visible, match by manufacturer data prefix instead.
const String _lockMacAddress = 'C8:72:0C:8F:27:1A';

/// Scan window duration (seconds)
const int _scanDurationSec = 6;

/// Pause between scans (seconds)
const int _pauseDurationSec = 4;

/// Cooldown after a successful user detection before another detection
/// is allowed to trigger a preset change (seconds).
const int _detectionCooldownSec = 10;

// ---------------------------------------------------------------------------
// USER ID MAPPINGS
// ---------------------------------------------------------------------------

/// Maps BLE person_id (last 8 hex chars from manufacturer data) to the
/// preset user name stored under Firebase /presets/{user}.
///
/// To add new users, simply append an entry:
///   {'personId': 'AABBCCDD', 'presetUser': 'jinay'},
///
/// Unknown person IDs (not in this list) are silently ignored.
const List<Map<String, String>> userIdMappings = [
  {'personId': '1DCD691B', 'presetUser': 'jay'},
  // Future users — uncomment and fill when IDs are known:
  {'personId': '1DCD691C', 'presetUser': 'sayali'},
  {'personId': '1DCD691D', 'presetUser': 'Keyoor'},
  {'personId': '1DCD691E', 'presetUser': 'saili'},
];

// ---------------------------------------------------------------------------
// BLE USER SCANNER
// ---------------------------------------------------------------------------

/// Singleton service that continuously scans for a specific digital lock's
/// BLE advertisement, parses the manufacturer data, and notifies when a
/// known user is detected.
class BleUserScanner {
  // Singleton
  static final BleUserScanner instance = BleUserScanner._internal();
  factory BleUserScanner() => instance;
  BleUserScanner._internal();

  /// Callback invoked when a known user is detected via BLE.
  /// The caller (VerticalHomeScreen) sets this to apply the user's preset.
  void Function(String userName)? onUserDetected;

  // Internal state
  bool _isRunning = false;
  bool _disposed = false;
  Timer? _cycleTimer;
  StreamSubscription? _scanSubscription;
  StreamSubscription? _adapterSubscription;
  DateTime? _lastDetectionTime;

  /// Pre-built lookup map: personId (uppercase) → presetUser
  static final Map<String, String> _idToUser = {
    for (final m in userIdMappings)
      m['personId']!.toUpperCase(): m['presetUser']!,
  };

  // ── Public API ──────────────────────────────────────────────────────────

  /// Start the background scan loop.
  /// Safe to call multiple times — subsequent calls are no-ops.
  Future<void> start() async {
    if (_isRunning) {
      print('[BLE USER SCANNER] Already running — skipping start()');
      return;
    }
    _disposed = false;
    _isRunning = true;
    print(
      '[BLE USER SCANNER] Starting background scan loop '
      '(scan ${_scanDurationSec}s / pause ${_pauseDurationSec}s)',
    );

    // Listen for adapter state changes (BT on/off)
    _adapterSubscription?.cancel();
    _adapterSubscription = FlutterBluePlus.adapterState.listen((state) {
      print('[BLE USER SCANNER] Adapter state: $state');
      if (state == BluetoothAdapterState.on && _isRunning && !_disposed) {
        // BT turned on — kick off a scan cycle if not already running
        _scheduleCycle();
      }
    });

    // Check if BT is currently on
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState == BluetoothAdapterState.on) {
      _runScanCycle();
    } else {
      print('[BLE USER SCANNER] Bluetooth is OFF — waiting for it to turn on');
    }
  }

  /// Stop the background scan loop and clean up resources.
  void stop() {
    print('[BLE USER SCANNER] Stopping background scan loop');
    _isRunning = false;
    _disposed = true;
    _cycleTimer?.cancel();
    _cycleTimer = null;
    _scanSubscription?.cancel();
    _scanSubscription = null;
    _adapterSubscription?.cancel();
    _adapterSubscription = null;
    // Stop any in-progress scan
    if (FlutterBluePlus.isScanningNow) {
      FlutterBluePlus.stopScan();
    }
  }

  // ── Scan Cycle ──────────────────────────────────────────────────────────

  void _scheduleCycle() {
    if (!_isRunning || _disposed) return;
    // Avoid scheduling multiple timers
    _cycleTimer?.cancel();
    _cycleTimer = Timer(Duration.zero, () => _runScanCycle());
  }

  Future<void> _runScanCycle() async {
    if (!_isRunning || _disposed) return;

    // Stop any leftover scan
    try {
      if (FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.stopScan();
      }
    } catch (_) {}

    print('[BLE USER SCANNER] ── Scan cycle start ──');

    // Set up listener for scan results
    _scanSubscription?.cancel();
    _scanSubscription = FlutterBluePlus.onScanResults.listen(
      _onScanResults,
      onError: (e) {
        print('[BLE USER SCANNER] Scan result stream error: $e');
      },
    );

    // Start scan
    try {
      await FlutterBluePlus.startScan(
        timeout: Duration(seconds: _scanDurationSec),
        androidUsesFineLocation: false, // iOS only — irrelevant but harmless
      );
    } catch (e) {
      print('[BLE USER SCANNER] Scan error: $e');
    }

    // Wait for scan to finish
    await Future.delayed(Duration(seconds: _scanDurationSec + 1));

    // Clean up this scan's listener
    _scanSubscription?.cancel();
    _scanSubscription = null;

    print(
      '[BLE USER SCANNER] ── Scan cycle end ── pausing ${_pauseDurationSec}s',
    );

    if (!_isRunning || _disposed) return;

    // Pause then schedule next cycle
    _cycleTimer?.cancel();
    _cycleTimer = Timer(Duration(seconds: _pauseDurationSec), () {
      _runScanCycle();
    });
  }

  // ── Scan Result Processing ──────────────────────────────────────────────

  void _onScanResults(List<ScanResult> results) {
    for (final result in results) {
      final remoteId = result.device.remoteId.str.toUpperCase();

      // ── Strategy 1: Match by MAC address ──
      if (remoteId == _lockMacAddress.toUpperCase()) {
        _processLockAdvertisement(result);
        return;
      }

      // ── Strategy 2: iOS often uses random UUIDs instead of real MACs.
      //    Fallback — check ALL devices for manufacturer data that looks
      //    like our lock's payload (length ≥ 8 hex chars / 4 bytes).
      //    We only act if we find a known person ID in the last 8 chars.
      //    This is safe because unknown IDs are ignored. ──
      if (result.advertisementData.manufacturerData.isNotEmpty) {
        _processLockAdvertisement(result);
      }
    }
  }

  void _processLockAdvertisement(ScanResult result) {
    final mfData = result.advertisementData.manufacturerData;
    if (mfData.isEmpty) {
      return;
    }

    // manufacturerData is Map<int, List<int>> where key = company ID,
    // value = raw bytes. Concatenate all bytes into a single hex string.
    final StringBuffer hexBuf = StringBuffer();
    for (final entry in mfData.entries) {
      // Include company ID as 4-char hex (little-endian 2 bytes)
      hexBuf.write(entry.key.toRadixString(16).padLeft(4, '0').toUpperCase());
      // Append data bytes
      for (final byte in entry.value) {
        hexBuf.write(byte.toRadixString(16).padLeft(2, '0').toUpperCase());
      }
    }

    final fullHex = hexBuf.toString();

    if (fullHex.length < 8) {
      return; // Too short to contain a person ID
    }

    final last8 = fullHex.substring(fullHex.length - 8).toUpperCase();
    print(
      '[BLE USER SCANNER] Device ${result.device.remoteId.str} '
      'mfr data: $fullHex → last8: $last8',
    );

    // Look up person ID
    final presetUser = _idToUser[last8];
    if (presetUser == null) {
      // Unknown ID — silently ignore
      return;
    }

    // Cooldown check
    if (_lastDetectionTime != null) {
      final elapsed = DateTime.now().difference(_lastDetectionTime!).inSeconds;
      if (elapsed < _detectionCooldownSec) {
        print(
          '[BLE USER SCANNER] Cooldown active (${_detectionCooldownSec - elapsed}s remaining) '
          '— skipping detection for "$presetUser"',
        );
        return;
      }
    }

    print('[BLE USER SCANNER] ✅ Detected user "$presetUser" (ID: $last8)');
    _lastDetectionTime = DateTime.now();

    // Notify the caller
    onUserDetected?.call(presetUser);
  }
}
