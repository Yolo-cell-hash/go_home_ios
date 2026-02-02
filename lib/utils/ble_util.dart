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

  // Getters
  bool get isConnected => _isConnected;
  bool get isScanning => _isScanning;
  BleConnectionStatus get connectionStatus => _connectionStatus;

  void dispose() {
    _scanSubscription?.cancel();
    _connectionStateSubscription?.cancel();
    _statusController.close();
    _connectionStatusController.close();
    _isScanningController.close();
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

      // Listen for Bluetooth to be turned on
      FlutterBluePlus.adapterState.listen((state) {
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
    // The Info.plist already has the required usage descriptions
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

    // Start scanning - on iOS, the OS will prompt for permission automatically
    print('[BLE DEBUG] Starting BLE scan...');
    startScan();
  }

  /// Force reconnect - resets state and starts fresh scan
  /// Use this when navigating to BedStorageScreen to ensure fresh connection
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

    // Stop any ongoing scan
    try {
      await FlutterBluePlus.stopScan();
      print('[BLE DEBUG] Stopped ongoing scan');
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
    _connectionStatus = BleConnectionStatus.disconnected;

    _updateStatus("Ready to scan");
    _updateConnectionStatus(BleConnectionStatus.disconnected);
    _updateIsScanning(false);

    print('[BLE DEBUG] Controller reset complete');
  }

  /// Start scanning for the target BLE device
  void startScan() async {
    print(
      '[BLE DEBUG] startScan() called - isConnected: $_isConnected, isScanning: $_isScanning',
    );

    if (_isConnected) {
      print('[BLE DEBUG] Already connected - skipping scan');
      _updateStatus("Connected to EB");
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

    // Cancel any existing subscriptions
    await _scanSubscription?.cancel();

    _scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
      print('[BLE DEBUG] Scan results received: ${results.length} devices');
      for (ScanResult result in results) {
        final deviceName = result.device.platformName;
        print(
          '[BLE DEBUG] Found device: "$deviceName" (looking for "$TARGET_DEVICE_NAME")',
        );
        if (deviceName == TARGET_DEVICE_NAME) {
          print(
            '[BLE DEBUG] TARGET DEVICE FOUND! Stopping scan and connecting...',
          );
          FlutterBluePlus.stopScan();
          _updateIsScanning(false);
          _connectToDevice(result.device);
          _scanSubscription?.cancel();
          return;
        }
      }
    });

    try {
      print('[BLE DEBUG] Starting FlutterBluePlus scan with 15s timeout...');
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
        withNames: [TARGET_DEVICE_NAME],
      );
      print('[BLE DEBUG] Scan started successfully');
    } catch (e) {
      print('[BLE DEBUG] Scan error: $e');
      _updateStatus("Scan error: $e");
      _updateConnectionStatus(BleConnectionStatus.error);
      _updateIsScanning(false);
      return;
    }

    // Wait for scan to complete
    print('[BLE DEBUG] Waiting for scan timeout (16s)...');
    await Future.delayed(const Duration(seconds: 16));

    // If still scanning after timeout, device not found
    if (_isScanning && !_isConnected && _connectedDevice == null) {
      print(
        '[BLE DEBUG] Scan timeout - device "$TARGET_DEVICE_NAME" not found',
      );
      _updateIsScanning(false);
      _updateStatus("Device not found");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Connect to a discovered BLE device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    print(
      '[BLE DEBUG] _connectToDevice() - Attempting to connect to: ${device.platformName}',
    );
    _updateConnectionStatus(BleConnectionStatus.connecting);
    _updateStatus("Connecting to ${device.platformName}...");

    try {
      print('[BLE DEBUG] Calling device.connect() with 10s timeout...');
      await device.connect(
        autoConnect: false,
        timeout: const Duration(seconds: 10),
        license: License.free,
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
      List<BluetoothService> services = await device.discoverServices();
      print('[BLE DEBUG] Discovered ${services.length} services');

      BluetoothCharacteristic? foundChar;

      for (var service in services) {
        print('[BLE DEBUG] Service UUID: ${service.uuid}');
        if (service.uuid.toString().toLowerCase() ==
            SERVICE_UUID.toLowerCase()) {
          print(
            '[BLE DEBUG] TARGET SERVICE FOUND! Looking for characteristic...',
          );
          for (var c in service.characteristics) {
            print('[BLE DEBUG] Characteristic UUID: ${c.uuid}');
            if (c.uuid.toString().toLowerCase() ==
                CHARACTERISTIC_UUID.toLowerCase()) {
              print('[BLE DEBUG] TARGET CHARACTERISTIC FOUND!');
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
        _updateConnectionStatus(BleConnectionStatus.connected);
        _updateStatus("Connected to EB");
        print('[BLE DEBUG] SUCCESS - Connected and ready to send commands');
      } else {
        print('[BLE DEBUG] ERROR - Target service/characteristic not found');
        _updateStatus("Service not found");
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
      await _writeCharacteristic!.write(bytes);
      print('[BLE DEBUG] SUCCESS - Command "$command" sent successfully');
      _updateStatus("Sent: $command");
      return true;
    } catch (e) {
      print('[BLE DEBUG] FAILED to send command "$command": $e');
      _updateStatus("Send failed: $e");
      return false;
    }
  }

  /// Disconnect from the current device
  Future<void> disconnect() async {
    await _scanSubscription?.cancel();
    await _connectionStateSubscription?.cancel();
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
