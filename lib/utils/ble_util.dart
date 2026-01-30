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
    // Check if Bluetooth is supported
    if (!await FlutterBluePlus.isSupported) {
      _updateStatus("Bluetooth not supported");
      _updateConnectionStatus(BleConnectionStatus.error);
      return;
    }

    // Check Bluetooth adapter state
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      _updateStatus("Bluetooth is off");
      _updateConnectionStatus(BleConnectionStatus.bluetoothOff);

      // Listen for Bluetooth to be turned on
      FlutterBluePlus.adapterState.listen((state) {
        if (state == BluetoothAdapterState.on &&
            !_isConnected &&
            !_isScanning) {
          startScan();
        }
      });
      return;
    }

    // On iOS, permissions are handled automatically by the OS when we try to scan
    // The Info.plist already has the required usage descriptions
    // On Android, we need to request permissions explicitly
    if (!Platform.isIOS) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
      ].request();

      if (!statuses.values.every((status) => status.isGranted)) {
        _updateStatus("Permissions denied");
        _updateConnectionStatus(BleConnectionStatus.permissionDenied);
        return;
      }
    }

    // Start scanning - on iOS, the OS will prompt for permission automatically
    startScan();
  }

  /// Start scanning for the target BLE device
  void startScan() async {
    if (_isConnected) {
      _updateStatus("Already connected");
      return;
    }

    if (_isScanning) {
      _updateStatus("Already scanning...");
      return;
    }

    _updateIsScanning(true);
    _updateConnectionStatus(BleConnectionStatus.scanning);
    _updateStatus("Scanning for '$TARGET_DEVICE_NAME'...");

    // Cancel any existing subscriptions
    await _scanSubscription?.cancel();

    _scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
      for (ScanResult result in results) {
        final deviceName = result.device.platformName;
        if (deviceName == TARGET_DEVICE_NAME) {
          FlutterBluePlus.stopScan();
          _updateIsScanning(false);
          _connectToDevice(result.device);
          _scanSubscription?.cancel();
          return;
        }
      }
    });

    try {
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
        withNames: [TARGET_DEVICE_NAME],
      );
    } catch (e) {
      _updateStatus("Scan error: $e");
      _updateConnectionStatus(BleConnectionStatus.error);
      _updateIsScanning(false);
      return;
    }

    // Wait for scan to complete
    await Future.delayed(const Duration(seconds: 16));

    // If still scanning after timeout, device not found
    if (_isScanning && !_isConnected && _connectedDevice == null) {
      _updateIsScanning(false);
      _updateStatus("Device not found");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Connect to a discovered BLE device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    _updateConnectionStatus(BleConnectionStatus.connecting);
    _updateStatus("Connecting...");

    try {
      await device.connect(
        autoConnect: false,
        timeout: const Duration(seconds: 10),
        license: License.free,
      );

      // Listen for connection state changes
      _connectionStateSubscription?.cancel();
      _connectionStateSubscription = device.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          _isConnected = false;
          _connectedDevice = null;
          _writeCharacteristic = null;
          _updateConnectionStatus(BleConnectionStatus.disconnected);
          _updateStatus("Disconnected");
        } else if (state == BluetoothConnectionState.connected) {
          _isConnected = true;
          _updateConnectionStatus(BleConnectionStatus.connected);
        }
      });

      await _discoverServices(device);
    } catch (e) {
      print("Error connecting: $e");
      _updateStatus("Connection failed");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Discover services and find the target characteristic
  Future<void> _discoverServices(BluetoothDevice device) async {
    try {
      List<BluetoothService> services = await device.discoverServices();
      BluetoothCharacteristic? foundChar;

      for (var service in services) {
        if (service.uuid.toString().toLowerCase() ==
            SERVICE_UUID.toLowerCase()) {
          for (var c in service.characteristics) {
            if (c.uuid.toString().toLowerCase() ==
                CHARACTERISTIC_UUID.toLowerCase()) {
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
      } else {
        _updateStatus("Service not found");
        _updateConnectionStatus(BleConnectionStatus.error);
        await device.disconnect();
      }
    } catch (e) {
      print("Error discovering services: $e");
      _updateStatus("Service discovery failed");
      _updateConnectionStatus(BleConnectionStatus.error);
    }
  }

  /// Send a command to the BLE device
  /// Commands: "UP", "DOWN", "STOP"
  Future<bool> sendCommand(String command) async {
    if (_writeCharacteristic == null || !_isConnected) {
      _updateStatus("Not connected");
      return false;
    }
    try {
      await _writeCharacteristic!.write(utf8.encode(command));
      print("[BLE] Sent command: $command");
      return true;
    } catch (e) {
      _updateStatus("Send failed: $e");
      print("[BLE] Failed to send command: $e");
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
