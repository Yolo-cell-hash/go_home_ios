import 'dart:async';
import 'dart:convert';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

// ---------------------------------------------------------------------------
// 1. CONFIGURATION & CONSTANTS
// ---------------------------------------------------------------------------

const String TARGET_DEVICE_NAME = "EB";
const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

class BleController {
  // Singleton instance
  static final BleController _instance = BleController._internal();
  factory BleController() => _instance;
  BleController._internal();

  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _writeCharacteristic;
  StreamSubscription? _scanSubscription;

  // Status Streams
  final _statusController = StreamController<String>.broadcast();
  Stream<String> get statusStream => _statusController.stream;

  final _connectionStateController = StreamController<bool>.broadcast();
  Stream<bool> get isConnectedStream => _connectionStateController.stream;

  bool _isConnected = false;

  void dispose() {
    _scanSubscription?.cancel();
    _statusController.close();
    _connectionStateController.close();
  }

  Future<void> initBle() async {
    // Request permissions
    // Note: For iOS, permissions are handled by Info.plist and requested automatically by OS on use.
    // However, explicitly requesting them is good practice for cross-platform consistency.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    if (statuses.values.every((status) => status.isGranted)) {
      startScan();
    } else {
      _updateStatus("Permissions Denied");
    }
  }

  void startScan() async {
    if (_isConnected) return;

    _updateStatus("Scanning for '$TARGET_DEVICE_NAME'...");

    _scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.platformName == TARGET_DEVICE_NAME) {
          FlutterBluePlus.stopScan();
          _connectToDevice(result.device);
          _scanSubscription?.cancel();
          break;
        }
      }
    });

    try {
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
        androidUsesFineLocation: true,
        withNames: ["$TARGET_DEVICE_NAME"],
      );
    } catch (e) {
      _updateStatus("Scan Error: $e");
    }

    if (!_isConnected && _connectedDevice == null) {
      _updateStatus("Device not found. Retry?");
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    _updateStatus("Connecting...");

    try {
      await device.connect(license: License.free);

      device.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          _isConnected = false;
          _connectedDevice = null;
          _writeCharacteristic = null;
          _updateConnectionState(false);
          _updateStatus("Disconnected");
        } else if (state == BluetoothConnectionState.connected) {
          _isConnected = true;
          _updateConnectionState(true);
        }
      });

      await _discoverServices(device);
    } catch (e) {
      print("Error connecting: $e");
      _updateStatus("Connection Error");
    }
  }

  Future<void> _discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    BluetoothCharacteristic? foundChar;

    for (var service in services) {
      if (service.uuid.toString() == SERVICE_UUID) {
        for (var c in service.characteristics) {
          if (c.uuid.toString() == CHARACTERISTIC_UUID) {
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
      _updateConnectionState(true);
      _updateStatus("Connected to EB");
    } else {
      _updateStatus("Service Not Found");
      await device.disconnect();
    }
  }

  Future<void> sendCommand(String command) async {
    if (_writeCharacteristic == null) {
      _updateStatus("Not Connected");
      return;
    }
    try {
      await _writeCharacteristic!.write(utf8.encode(command));
    } catch (e) {
      _updateStatus("Failed to send: $e");
    }
  }

  void _updateStatus(String status) {
    if (!_statusController.isClosed) {
      _statusController.add(status);
    }
  }

  void _updateConnectionState(bool isConnected) {
    if (!_connectionStateController.isClosed) {
      _connectionStateController.add(isConnected);
    }
  }
}
