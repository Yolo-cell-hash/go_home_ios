import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

// ---------------------------------------------------------------------------
// BLE CONFIGURATION & CONSTANTS
// ---------------------------------------------------------------------------

const String TARGET_DEVICE_NAME = "EB";
const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

/// BLE connection status enum for clear state tracking
enum BleConnectionStatus {
  disconnected,
  scanning,
  connecting,
  connected,
  error,
  permissionDenied,
  bluetoothOff,
}

/// Singleton BLE Controller optimized for iOS
/// Manages BLE scanning, connection, and command sending
class BleController {
  // Singleton instance
  static final BleController _instance = BleController._internal();
  factory BleController() => _instance;
  BleController._internal();

  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _writeCharacteristic;
  StreamSubscription? _scanSubscription;
  StreamSubscription? _connectionStateSubscription;
  StreamSubscription? _adapterStateSubscription;

  // Status Streams
  final _statusController = StreamController<String>.broadcast();
  Stream<String> get statusStream => _statusController.stream;

  final _connectionStatusController =
      StreamController<BleConnectionStatus>.broadcast();
  Stream<BleConnectionStatus> get connectionStatusStream =>
      _connectionStatusController.stream;

  final _isScanningController = StreamController<bool>.broadcast();
  Stream<bool> get isScanningStream => _isScanningController.stream;

  // State tracking
  BleConnectionStatus _connectionStatus = BleConnectionStatus.disconnected;
  bool _isScanning = false;
  bool _isConnected = false;
  int _scanAttempt = 0;
  static const int _maxScanAttempts = 3;

  // Getters
  bool get isConnected => _isConnected;
  bool get isScanning => _isScanning;
  BleConnectionStatus get connectionStatus => _connectionStatus;

  void dispose() {
    _scanSubscription?.cancel();
    _connectionStateSubscription?.cancel();
    _adapterStateSubscription?.cancel();
    _statusController.close();
    _connectionStatusController.close();
    _isScanningController.close();
  }

  /// Check if a device name matches the target.
  /// Uses case-insensitive comparison and also checks if the name
  /// starts with or contains the target, to handle BLE name variations.
  bool _isTargetDevice(ScanResult result) {
    final platformName = result.device.platformName.trim();
    final advName = result.advertisementData.advName.trim();
    final target = TARGET_DEVICE_NAME.toLowerCase();

    // Check platformName (cached/system name)
    if (platformName.isNotEmpty) {
      final lower = platformName.toLowerCase();
      if (lower == target || lower.startsWith(target)) {
        return true;
      }
    }

    // Check advertisement name (live broadcast name)
    if (advName.isNotEmpty) {
      final lower = advName.toLowerCase();
      if (lower == target || lower.startsWith(target)) {
        return true;
      }
    }

    // Also check manufacturer/service data advertised service UUIDs
    // Some devices advertise the service UUID before connection
    final serviceUuids = result.advertisementData.serviceUuids;
    for (final uuid in serviceUuids) {
      if (uuid.toString().toLowerCase() == SERVICE_UUID.toLowerCase()) {
        print(
          '[BLE DEBUG] Device matched by service UUID: platformName="$platformName" advName="$advName"',
        );
        return true;
      }
    }

    return false;
  }

  /// Initialize BLE - request permissions and start scanning
  Future<void> initBle() async {
    print(
      '[BLE DEBUG] initBle() called - isConnected: $_isConnected, isScanning: $_isScanning',
    );

    // Check if Bluetooth is supported
    if (!await FlutterBluePlus.isSupported) {
      print('[BLE DEBUG] Bluetooth not supported on this device');
      _updateStatus("Bluetooth not supported");
      _updateConnectionStatus(BleConnectionStatus.error);
      return;
    }
    print('[BLE DEBUG] Bluetooth is supported');

    // Check Bluetooth adapter state
    final adapterState = await FlutterBluePlus.adapterState.first;
    print('[BLE DEBUG] Bluetooth adapter state: $adapterState');

    if (adapterState != BluetoothAdapterState.on) {
      print('[BLE DEBUG] Bluetooth is OFF - waiting for it to turn on');
      _updateStatus("Bluetooth is off");
      _updateConnectionStatus(BleConnectionStatus.bluetoothOff);

      // Listen for Bluetooth to be turned on (cancel previous listener)
      _adapterStateSubscription?.cancel();
      _adapterStateSubscription = FlutterBluePlus.adapterState.listen((state) {
        print('[BLE DEBUG] Bluetooth adapter state changed: $state');
        if (state == BluetoothAdapterState.on &&
            !_isConnected &&
            !_isScanning) {
          print('[BLE DEBUG] Bluetooth turned ON - starting scan');
          startScan();
        }
      });
      return;
    }

    // On iOS, permissions are handled automatically by the OS when we try to scan
    // On Android, we need to request permissions explicitly
    if (!Platform.isIOS) {
      print('[BLE DEBUG] Android platform - requesting permissions');
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
      ].request();

      print('[BLE DEBUG] Permission statuses: $statuses');
      if (!statuses.values.every((status) => status.isGranted)) {
        print('[BLE DEBUG] Permissions denied');
        _updateStatus("Permissions denied");
        _updateConnectionStatus(BleConnectionStatus.permissionDenied);
        return;
      }
    } else {
      print('[BLE DEBUG] iOS platform - permissions handled by OS');
    }

    // Reset scan attempt counter and start scanning
    _scanAttempt = 0;
    print('[BLE DEBUG] Starting BLE scan...');
    startScan();
  }

  /// Force reconnect - resets state and starts fresh scan
  Future<void> forceReconnect() async {
    print('[BLE DEBUG] forceReconnect() called - resetting and scanning fresh');
    await resetController();
    await initBle();
  }

  /// Reset controller state for fresh connection attempt
  Future<void> resetController() async {
    print('[BLE DEBUG] resetController() - clearing all state');

    // Cancel subscriptions
    await _scanSubscription?.cancel();
    await _connectionStateSubscription?.cancel();
    _scanSubscription = null;
    _connectionStateSubscription = null;

    // Stop any ongoing scan
    try {
      if (FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.stopScan();
        print('[BLE DEBUG] Stopped ongoing scan');
      }
    } catch (e) {
      print('[BLE DEBUG] Error stopping scan: $e');
    }

    // Disconnect if connected
    if (_connectedDevice != null) {
      try {
        await _connectedDevice!.disconnect();
        print('[BLE DEBUG] Disconnected from previous device');
      } catch (e) {
        print('[BLE DEBUG] Error disconnecting: $e');
      }
    }

    // Reset all state
    _connectedDevice = null;
    _writeCharacteristic = null;
    _isConnected = false;
    _isScanning = false;
    _scanAttempt = 0;
    _connectionStatus = BleConnectionStatus.disconnected;

    _updateStatus("Ready to scan");
    _updateConnectionStatus(BleConnectionStatus.disconnected);
    _updateIsScanning(false);

    print('[BLE DEBUG] Controller reset complete');
  }

  /// Start scanning for the target BLE device
  void startScan() async {
    print(
      '[BLE DEBUG] startScan() called - isConnected: $_isConnected, isScanning: $_isScanning, attempt: ${_scanAttempt + 1}/$_maxScanAttempts',
    );

    if (_isConnected) {
      print('[BLE DEBUG] Already connected - skipping scan');
      _updateStatus("Connected to $TARGET_DEVICE_NAME");
      _updateConnectionStatus(BleConnectionStatus.connected);
      return;
    }

    if (_isScanning) {
      print('[BLE DEBUG] Already scanning - skipping');
      _updateStatus("Scanning...");
      return;
    }

    _updateIsScanning(true);
    _updateConnectionStatus(BleConnectionStatus.scanning);
    _updateStatus("Scanning for '$TARGET_DEVICE_NAME'...");
    print('[BLE DEBUG] Started scanning for device: $TARGET_DEVICE_NAME');

    // Cancel any existing scan subscription
    await _scanSubscription?.cancel();
    _scanSubscription = null;

    // Stop any lingering scan
    try {
      if (FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.stopScan();
      }
    } catch (e) {
      print('[BLE DEBUG] Error stopping previous scan: $e');
    }

    bool deviceFound = false;

    // Listen to scan results - NO name filter, we do our own matching
    _scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
      if (deviceFound) return;

      print('[BLE DEBUG] Scan results batch: ${results.length} devices');
      for (ScanResult result in results) {
        final platformName = result.device.platformName;
        final advName = result.advertisementData.advName;
        final rssi = result.rssi;

        // Log every device found for debugging
        if (platformName.isNotEmpty || advName.isNotEmpty) {
          print(
            '[BLE DEBUG] Found device: platformName="$platformName" advName="$advName" rssi=$rssi (looking for "$TARGET_DEVICE_NAME")',
          );
        }

        if (_isTargetDevice(result)) {
          deviceFound = true;
          final matchedName = platformName.isNotEmpty ? platformName : advName;
          print(
            '[BLE DEBUG] ✅ TARGET DEVICE FOUND! name="$matchedName" rssi=$rssi — Stopping scan and connecting...',
          );
          FlutterBluePlus.stopScan();
          _updateIsScanning(false);
          _connectToDevice(result.device);
          _scanSubscription?.cancel();
          _scanSubscription = null;
          return;
        }
      }
    });

    try {
      print(
        '[BLE DEBUG] Starting FlutterBluePlus scan (no name filter, 15s timeout)...',
      );

      // Scan WITHOUT withNames filter so we see ALL nearby devices.
      // We filter in the listener above using _isTargetDevice().
      // Also scan with the known service UUID as an additional strategy.
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
        androidUsesFineLocation: true,
      );
      print('[BLE DEBUG] Scan started successfully');
    } catch (e) {
      print('[BLE DEBUG] Scan error: $e');
      _updateStatus("Scan error: $e");
      _updateConnectionStatus(BleConnectionStatus.error);
      _updateIsScanning(false);
      return;
    }

    // Wait for scan to wrap up (timeout + 1s buffer)
    await Future.delayed(const Duration(seconds: 16));

    // If device wasn't found during this scan attempt
    if (!deviceFound && !_isConnected && _connectedDevice == null) {
      _scanAttempt++;
      print(
        '[BLE DEBUG] Scan attempt $_scanAttempt/$_maxScanAttempts - device "$TARGET_DEVICE_NAME" not found',
      );

      if (_scanAttempt < _maxScanAttempts) {
        // Auto-retry with a small delay
        print('[BLE DEBUG] Auto-retrying scan in 2 seconds...');
        _updateStatus(
          "Retrying scan (${_scanAttempt + 1}/$_maxScanAttempts)...",
        );
        _updateIsScanning(false);
        await Future.delayed(const Duration(seconds: 2));
        if (!_isConnected) {
          startScan();
        }
      } else {
        print(
          '[BLE DEBUG] All $_maxScanAttempts scan attempts exhausted — device not found',
        );
        _updateIsScanning(false);
        _updateStatus("Device '$TARGET_DEVICE_NAME' not found");
        _updateConnectionStatus(BleConnectionStatus.error);
      }
    }
  }

  /// Connect to a discovered BLE device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    final deviceName = device.platformName.isNotEmpty
        ? device.platformName
        : device.remoteId.str;
    print(
      '[BLE DEBUG] _connectToDevice() - Attempting to connect to: $deviceName',
    );
    _updateConnectionStatus(BleConnectionStatus.connecting);
    _updateStatus("Connecting to $deviceName...");

    try {
      print('[BLE DEBUG] Calling device.connect() with 10s timeout...');
      await device.connect(
        autoConnect: false,
        license: License.free,
        timeout: const Duration(seconds: 10),
        mtu: null,
      );
      print('[BLE DEBUG] device.connect() completed successfully');

      // Listen for connection state changes
      _connectionStateSubscription?.cancel();
      _connectionStateSubscription = device.connectionState.listen((state) {
        print('[BLE DEBUG] Connection state changed: $state');
        if (state == BluetoothConnectionState.disconnected) {
          print('[BLE DEBUG] Device disconnected');
          _isConnected = false;
          _connectedDevice = null;
          _writeCharacteristic = null;
          _updateConnectionStatus(BleConnectionStatus.disconnected);
          _updateStatus("Disconnected");
        } else if (state == BluetoothConnectionState.connected) {
          print('[BLE DEBUG] Device connected');
          _isConnected = true;
          _updateConnectionStatus(BleConnectionStatus.connected);
        }
      });

      await _discoverServices(device);
    } catch (e) {
      print('[BLE DEBUG] Error connecting to device: $e');
      _updateStatus("Connection failed");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Discover services and find the target characteristic
  Future<void> _discoverServices(BluetoothDevice device) async {
    print('[BLE DEBUG] _discoverServices() - Starting service discovery...');
    try {
      // On iOS, request a smaller MTU first for reliability
      if (Platform.isIOS) {
        try {
          await device.requestMtu(512);
          print('[BLE DEBUG] MTU requested on iOS');
        } catch (e) {
          print('[BLE DEBUG] MTU request failed (non-critical): $e');
        }
      }

      List<BluetoothService> services = await device.discoverServices();
      print('[BLE DEBUG] Discovered ${services.length} services');

      BluetoothCharacteristic? foundChar;

      for (var service in services) {
        print('[BLE DEBUG] Service UUID: ${service.uuid}');
        if (service.uuid.toString().toLowerCase() ==
            SERVICE_UUID.toLowerCase()) {
          print(
            '[BLE DEBUG] ✅ TARGET SERVICE FOUND! Looking for characteristic...',
          );
          for (var c in service.characteristics) {
            print(
              '[BLE DEBUG]   Characteristic UUID: ${c.uuid}, properties: ${c.properties}',
            );
            if (c.uuid.toString().toLowerCase() ==
                CHARACTERISTIC_UUID.toLowerCase()) {
              print('[BLE DEBUG] ✅ TARGET CHARACTERISTIC FOUND!');
              foundChar = c;
              break;
            }
          }
        }
      }

      if (foundChar != null) {
        _connectedDevice = device;
        _writeCharacteristic = foundChar;
        _isConnected = true;
        _scanAttempt = 0; // Reset on successful connection
        _updateConnectionStatus(BleConnectionStatus.connected);
        _updateStatus("Connected to $TARGET_DEVICE_NAME");
        print('[BLE DEBUG] ✅ SUCCESS - Connected and ready to send commands');
      } else {
        print('[BLE DEBUG] ❌ ERROR - Target service/characteristic not found');
        print('[BLE DEBUG] Available services:');
        for (var service in services) {
          print('[BLE DEBUG]   Service: ${service.uuid}');
          for (var c in service.characteristics) {
            print('[BLE DEBUG]     Char: ${c.uuid}');
          }
        }
        _updateStatus("Service not found on device");
        _updateConnectionStatus(BleConnectionStatus.error);
        await device.disconnect();
      }
    } catch (e) {
      print('[BLE DEBUG] Error discovering services: $e');
      _updateStatus("Service discovery failed");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Send a command to the BLE device
  /// Commands: "open", "stop", "close" (case-sensitive, lowercase)
  Future<bool> sendCommand(String command) async {
    print('[BLE DEBUG] sendCommand() called with command: "$command"');
    print(
      '[BLE DEBUG] State - isConnected: $_isConnected, writeCharacteristic: ${_writeCharacteristic != null}',
    );

    if (_writeCharacteristic == null || !_isConnected) {
      print('[BLE DEBUG] Cannot send - not connected or no characteristic');
      _updateStatus("Not connected");
      return false;
    }
    try {
      final bytes = utf8.encode(command);
      print('[BLE DEBUG] Writing bytes: $bytes ("$command")');
      await _writeCharacteristic!.write(bytes, withoutResponse: false);
      print('[BLE DEBUG] ✅ SUCCESS - Command "$command" sent successfully');
      _updateStatus("Sent: $command");
      return true;
    } catch (e) {
      print('[BLE DEBUG] ❌ FAILED to send command "$command": $e');

      // If write fails, the connection may be stale — try withoutResponse
      try {
        print('[BLE DEBUG] Retrying write withoutResponse...');
        final bytes = utf8.encode(command);
        await _writeCharacteristic!.write(bytes, withoutResponse: true);
        print(
          '[BLE DEBUG] ✅ SUCCESS (withoutResponse) - Command "$command" sent',
        );
        _updateStatus("Sent: $command");
        return true;
      } catch (e2) {
        print('[BLE DEBUG] ❌ FAILED second attempt: $e2');
        _updateStatus("Send failed");
        return false;
      }
    }
  }

  /// Disconnect from the current device
  Future<void> disconnect() async {
    await _scanSubscription?.cancel();
    await _connectionStateSubscription?.cancel();
    _scanSubscription = null;
    _connectionStateSubscription = null;
    if (_connectedDevice != null) {
      await _connectedDevice!.disconnect();
    }
    _connectedDevice = null;
    _writeCharacteristic = null;
    _isConnected = false;
    _updateConnectionStatus(BleConnectionStatus.disconnected);
    _updateStatus("Disconnected");
  }

  /// Retry scanning for the device
  void retryScan() {
    if (!_isScanning) {
      _scanAttempt = 0; // Reset attempts on manual retry
      startScan();
    }
  }

  // Private helper methods for updating streams
  void _updateStatus(String status) {
    if (!_statusController.isClosed) {
      _statusController.add(status);
    }
  }

  void _updateConnectionStatus(BleConnectionStatus status) {
    _connectionStatus = status;
    if (!_connectionStatusController.isClosed) {
      _connectionStatusController.add(status);
    }
  }

  void _updateIsScanning(bool isScanning) {
    _isScanning = isScanning;
    if (!_isScanningController.isClosed) {
      _isScanningController.add(isScanning);
    }
  }
}
