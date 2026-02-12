# Godrej Home - Architecture Documentation

## Overview

This document provides a detailed technical overview of the Godrej Home smart home control application architecture, design patterns, and implementation details.

## Table of Contents

1. [System Architecture](#system-architecture)
2. [Application Layers](#application-layers)
3. [State Management](#state-management)
4. [Firebase Integration](#firebase-integration)
5. [Bluetooth Communication](#bluetooth-communication)
6. [Video Streaming](#video-streaming)
7. [Native Platform Integration](#native-platform-integration)
8. [Screen Navigation Flow](#screen-navigation-flow)
9. [Data Models](#data-models)
10. [Security Considerations](#security-considerations)

## System Architecture

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Flutter UI Layer                      │
│  (Cupertino Widgets, Screens, Custom Components)        │
└─────────────────────────────────────────────────────────┘
                          │
                          ↓
┌─────────────────────────────────────────────────────────┐
│                  Application Layer                       │
│  (Screens, ViewModels, State Management)                │
└─────────────────────────────────────────────────────────┘
                          │
                          ↓
┌─────────────────────────────────────────────────────────┐
│                   Service Layer                          │
│  (Business Logic, API Clients, Controllers)             │
└─────────────────────────────────────────────────────────┘
                          │
        ┌─────────────────┼──────────────────┐
        ↓                 ↓                   ↓
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   Firebase   │  │     BLE      │  │  Native SDK  │
│   Services   │  │  Controller  │  │  (iOS Camera)│
└──────────────┘  └──────────────┘  └──────────────┘
        │                 │                   │
        ↓                 ↓                   ↓
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   Firebase   │  │  IoT Device  │  │    CCTV      │
│   Backend    │  │   (Bed/BLE)  │  │   Camera     │
└──────────────┘  └──────────────┘  └──────────────┘
```

## Application Layers

### 1. Presentation Layer (UI)

**Location**: `lib/screens/`, `lib/widgets/`

**Responsibilities**:
- Render UI components using Flutter/Cupertino widgets
- Handle user interactions
- Display data from state management
- Navigate between screens

**Key Components**:
- `VerticalHomeScreen`: Main controller with page-based navigation
- Room-specific screens (door lock, lights, fan, etc.)
- Reusable widgets (navbar, cards, buttons)

**Design Pattern**: 
- Stateful widgets for interactive screens
- Stateless widgets for static components
- Consumer widgets for reactive updates

### 2. Business Logic Layer (Services)

**Location**: `lib/services/`

**Responsibilities**:
- Encapsulate business rules
- Manage external API/SDK communication
- Handle complex operations
- Provide clean interfaces to UI layer

**Key Services**:

#### JACameraService
```dart
// Singleton service for camera SDK integration
class JACameraService {
  static Future<bool> initializeSDK()
  static Future<bool> saveCamera(...)
  static Future<Map<String, dynamic>?> connectCamera(String cameraId)
  static Future<void> startPlay(String cameraId, int channel)
  static Future<void> stopPlay()
}
```

#### VdbService  
```dart
// WebRTC-based video doorbell service
class VdbService {
  Stream<ConnectionState> get connectionState
  Stream<MediaStream?> get videoStream
  Future<void> connect()
  Future<void> disconnect()
  void pause()
  void resume()
}
```

#### NotificationService
```dart
// Firebase Cloud Messaging integration
class NotificationService {
  Future<void> initialize()
  Future<void> requestPermissions()
  Future<void> showNotification(String title, String body)
}
```

### 3. Data Layer (Models & State)

**Location**: `lib/utils/`, `lib/models/`

**Responsibilities**:
- Define data structures
- Manage application state
- Handle persistence
- Provide reactive streams

**Key Components**:

#### AppState (Provider)
```dart
class AppState extends ChangeNotifier {
  // Global application state
  // Notifies listeners on changes
}
```

#### BleController (Singleton)
```dart
class BleController {
  Stream<String> get statusStream
  Stream<BleConnectionStatus> get connectionStatusStream
  Stream<bool> get scanningStream
  
  Future<void> scanAndConnect()
  Future<void> sendCommand(String command)
  Future<void> forceReconnect()
}
```

## State Management

### Provider Pattern Implementation

The app uses the Provider package for state management:

```dart
// App initialization
ChangeNotifierProvider(
  create: (context) => AppState(),
  child: const MyApp(),
)

// Consuming state in widgets
Consumer<AppState>(
  builder: (context, appState, child) {
    return Widget(...);
  },
)
```

### Local State Management

Individual screens maintain local state for:
- Toggle buttons
- Slider values
- Loading indicators
- Temporary UI state

Example from `VerticalHomeScreen`:
```dart
class _VerticalHomeScreenState extends State<VerticalHomeScreen> {
  // Page navigation
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Toggle states for room controls
  List<bool> _livingRoomToggles = List.generate(9, (index) => false);
  List<bool> _kitchenToggles = List.generate(6, (index) => false);
  List<bool> _bedroomToggles = List.generate(6, (index) => false);
  
  // Status indicators
  List<int> _livingRoomStatus = [...];
  List<int> _kitchenStatus = [...];
  List<int> _bedroomStatus = [...];
}
```

### State Persistence

Uses `shared_preferences` for persisting:
- User preferences
- Last selected scene
- Device connection history

## Firebase Integration

### Architecture

```
Flutter App
    │
    ├── Firebase Core (Initialization)
    │
    ├── Realtime Database (Device States)
    │   └── automation-flags/
    │       ├── door-lock: bool
    │       ├── vdb: bool
    │       ├── camera: bool
    │       ├── living-light: bool
    │       ├── living-light-hex: string
    │       ├── living-light-intensity: number
    │       ├── living-light-party: bool
    │       ├── living-fan: bool
    │       ├── living-fan-speed: number
    │       ├── fire-alert: bool
    │       └── window-open: bool
    │
    ├── Cloud Firestore (User Data)
    │   └── users/{userId}/
    │       ├── profile: {}
    │       └── devices: []
    │
    └── Cloud Messaging (Notifications)
        └── FCM Token Management
```

### Real-time Synchronization

Example from `DoorLockScreen`:

```dart
StreamSubscription<DatabaseEvent>? _lockSubscription;

void _setupFirebaseListeners() {
  _lockSubscription = _dbRef.child('door-lock').onValue.listen((event) {
    if (event.snapshot.value != null) {
      setState(() {
        isLocked = event.snapshot.value as bool;
      });
    }
  });
}

Future<void> _toggleLock() async {
  setState(() => isUnlocking = true);
  await _dbRef.child('door-lock').set(!isLocked);
  setState(() => isUnlocking = false);
}
```

### Firebase Database Patterns

**Read Pattern**:
```dart
// One-time read
final snapshot = await _dbRef.child('key').get();
final value = snapshot.value;

// Real-time listener
_dbRef.child('key').onValue.listen((event) {
  final value = event.snapshot.value;
});
```

**Write Pattern**:
```dart
// Set value
await _dbRef.child('key').set(value);

// Update multiple values
await _dbRef.update({
  'key1': value1,
  'key2': value2,
});
```

## Bluetooth Communication

### BLE Architecture

```
Flutter App (Dart)
    │
    └── BleController (Singleton)
        │
        ├── flutter_blue_plus (Package)
        │   └── Platform Channel
        │       │
        │       └── iOS CoreBluetooth
        │           │
        │           └── BLE Device (e.g., "EB")
```

### BLE Controller Design

The `BleController` manages all Bluetooth operations:

```dart
class BleController {
  // Singleton instance
  static final BleController _instance = BleController._internal();
  factory BleController() => _instance;
  BleController._internal();
  
  // State streams
  final _statusController = StreamController<String>.broadcast();
  final _connectionStatusController = 
      StreamController<BleConnectionStatus>.broadcast();
  final _scanningController = StreamController<bool>.broadcast();
  
  // Device connection
  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _writeCharacteristic;
  
  // Operations
  Future<void> scanAndConnect();
  Future<void> sendCommand(String command);
  Future<void> disconnect();
}
```

### Command Protocol

Commands sent to BLE devices (e.g., bed storage):

```dart
// Command structure
final commands = {
  'up': 'UP_COMMAND_HEX',
  'down': 'DOWN_COMMAND_HEX',
  'stop': 'STOP_COMMAND_HEX',
};

// Sending command
await _bleController.sendCommand(commands['up']!);
```

### Connection State Management

```dart
enum BleConnectionStatus {
  disconnected,
  scanning,
  connecting,
  connected,
  error,
}

// Usage in UI
StreamBuilder<BleConnectionStatus>(
  stream: _bleController.connectionStatusStream,
  builder: (context, snapshot) {
    final status = snapshot.data ?? BleConnectionStatus.disconnected;
    return StatusWidget(status: status);
  },
)
```

## Video Streaming

### VDB (Video Door Bell) Architecture

```
Flutter UI
    │
    └── VDBScreen
        │
        └── VdbService
            │
            ├── flutter_webrtc (Package)
            │   └── Platform Channel
            │       └── iOS WebRTC Framework
            │
            └── WebSocket Client
                │
                └── Janus Gateway (Signaling Server)
                    │
                    └── VDB Device (Camera Stream)
```

### WebRTC Flow

1. **Initialization**:
```dart
final _renderer = RTCVideoRenderer();
await _renderer.initialize();
```

2. **Connection**:
```dart
// VdbService handles WebRTC negotiation
await _vdbService.connect();
```

3. **Stream Reception**:
```dart
_videoStreamSubscription = _vdbService.videoStream.listen((stream) {
  if (stream != null) {
    _renderer.srcObject = stream;
  }
});
```

4. **Frame Capture** (iOS workaround):
```dart
// Capture via RepaintBoundary for iOS compatibility
Future<void> _captureFrame() async {
  RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
      .findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  final bytes = byteData!.buffer.asUint8List();
  _capturedFrames.add(bytes);
}
```

### CCTV Camera Architecture

```
Flutter UI
    │
    └── CameraScreen
        │
        └── JACameraView (PlatformView)
            │
            └── Platform Channel
                │
                └── JACameraPlugin (Swift)
                    │
                    └── JA Camera SDK
                        │
                        └── Camera Device (via device ID)
```

### Platform View Integration

```dart
// Dart side - registering view factory
class JACameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: 'ja-camera-view',
      creationParams: {...},
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
```

```swift
// Swift side - view factory
class JACameraViewFactory: NSObject, FlutterPlatformViewFactory {
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return JACameraView(frame: frame, viewId: viewId, args: args)
    }
}
```

## Native Platform Integration

### iOS-Specific Code

Location: `ios/Runner/`

#### AppDelegate.swift
```swift
// Register platform channels and view factories
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Register camera view factory
    let registrar = self.registrar(forPlugin: "JACameraPlugin")!
    let factory = JACameraViewFactory()
    registrar.register(factory, withId: "ja-camera-view")
    
    // Register method channel
    JACameraPlugin.register(with: registrar)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

#### JACameraPlugin.swift
```swift
// Platform channel for camera SDK operations
public class JACameraPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "ja_camera_plugin",
      binaryMessenger: registrar.messenger()
    )
    let instance = JACameraPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initializeSDK":
      // Initialize camera SDK
    case "saveCamera":
      // Save camera configuration
    case "connectCamera":
      // Connect to camera
    // ... more methods
    }
  }
}
```

### Method Channel Communication

```dart
// Dart side
class JACameraService {
  static const _channel = MethodChannel('ja_camera_plugin');
  
  static Future<bool> initializeSDK() async {
    try {
      final result = await _channel.invokeMethod('initializeSDK');
      return result == true;
    } catch (e) {
      return false;
    }
  }
}
```

## Screen Navigation Flow

### Navigation Architecture

```
Splash Screen (/)
    │
    ↓
Splash Screen 2 (/ss2)
    │
    ↓
Home Screen (/home)
    │
    ├── Setup Flows (/setup_main)
    │
    └── Vertical Home Screen (/vertical_home)
        │
        ├── Page 0: Welcome Screen
        │   └── Quick access icons (door, vdb, camera)
        │
        ├── Page 1: Home Scenes & Spaces
        │   ├── Scenes (morning, night, party, vacation)
        │   └── Spaces (living, kitchen, bedroom)
        │
        ├── Page 2: Living Room Control
        │   └── Device icons (9 devices)
        │
        ├── Page 3: Kitchen Control
        │   └── Device icons (6 devices)
        │
        └── Page 4: Bedroom Control
            └── Device icons (6 devices)
```

### Page Controller Implementation

```dart
final PageController _pageController = PageController();

PageView(
  controller: _pageController,
  scrollDirection: Axis.vertical,
  children: [
    WelcomeScreenWidget(...),
    HomeScenesScreenWidget(...),
    RoomControlScreenWidget(roomType: 'living'),
    RoomControlScreenWidget(roomType: 'kitchen'),
    RoomControlScreenWidget(roomType: 'bedroom'),
  ],
)

// Navigate to specific page
_pageController.animateToPage(
  pageIndex,
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut,
);
```

### Deep Link Navigation

Device control screens are pushed as full-screen modals:

```dart
void _navigateToDeviceScreen(String device) {
  Widget screen;
  switch (device) {
    case 'door-lock':
      screen = DoorLockScreen();
      break;
    case 'vdb':
      screen = VDBScreen();
      break;
    case 'camera':
      screen = CameraScreen();
      break;
    // ... more cases
  }
  
  Navigator.of(context).push(
    CupertinoPageRoute(builder: (context) => screen),
  );
}
```

## Data Models

### Device State Model

```dart
class DeviceState {
  final String deviceId;
  final bool isActive;
  final int statusCode; // 0=grey, 1=red, 2=green
  final DateTime lastUpdated;
  
  DeviceState({
    required this.deviceId,
    required this.isActive,
    required this.statusCode,
    required this.lastUpdated,
  });
}
```

### Firebase Data Schema

```dart
// automation-flags structure
class AutomationFlags {
  bool doorLock;
  bool vdb;
  bool camera;
  bool livingLight;
  String livingLightHex;
  int livingLightIntensity;
  bool livingLightParty;
  bool livingFan;
  int livingFanSpeed;
  bool fireAlert;
  bool windowOpen;
  
  // Serialization
  Map<String, dynamic> toMap() { ... }
  factory AutomationFlags.fromMap(Map<String, dynamic> map) { ... }
}
```

## Security Considerations

### 1. Firebase Security Rules

Current setup uses open rules for development. Production should use:

```json
{
  "rules": {
    "automation-flags": {
      ".read": "auth != null",
      ".write": "auth != null"
    },
    "users": {
      "$uid": {
        ".read": "auth.uid == $uid",
        ".write": "auth.uid == $uid"
      }
    }
  }
}
```

### 2. BLE Security

- Device authentication via device name filtering
- Service UUID validation
- Encrypted characteristic communication (to be implemented)

### 3. Camera Stream Security

- Device-specific credentials (username/password)
- Local network communication only
- WebRTC DTLS encryption

### 4. Data Privacy

- Local storage using `shared_preferences` for non-sensitive data
- Secure keychain storage for credentials (to be implemented)
- No sensitive data logged in production

### 5. Permissions

Runtime permission checks for:
```dart
final permissions = [
  Permission.bluetooth,
  Permission.bluetoothScan,
  Permission.bluetoothConnect,
  Permission.location,
  Permission.notification,
  Permission.storage,
  Permission.camera,
  Permission.microphone,
];
```

## Performance Optimizations

### 1. Camera SDK Pre-initialization

```dart
// At app startup
if (Platform.isIOS) {
  JACameraService.initializeSDK().then((success) {
    print('SDK pre-initialized: $success');
  });
}
```

### 2. Stream Debouncing

```dart
// Throttle color picker updates
Timer? _colorWriteThrottle;

void _onColorChanged(Color color) {
  _colorWriteThrottle?.cancel();
  _colorWriteThrottle = Timer(Duration(milliseconds: 200), () {
    _writeColorToFirebase(color);
  });
}
```

### 3. Lazy Loading

Screens are built on-demand as user navigates:
```dart
PageView(
  children: [
    // Screens created lazily
  ],
)
```

### 4. Resource Cleanup

```dart
@override
void dispose() {
  _pageController.dispose();
  _firebaseSubscription?.cancel();
  _bleController.disconnect();
  _renderer.dispose();
  super.dispose();
}
```

## Testing Strategies

### Unit Tests
- Service layer logic
- Data model serialization
- Utility functions

### Widget Tests
- Individual widget rendering
- User interaction handling
- State changes

### Integration Tests
- End-to-end user flows
- Firebase integration
- BLE communication

### Platform Tests
- iOS-specific camera functionality
- Native plugin integration

## Future Enhancements

### Planned Features
1. User authentication and multi-user support
2. Device management (add/remove devices)
3. Scheduling and automation rules
4. Energy monitoring and analytics
5. Voice control integration
6. Geofencing automation
7. Scene customization
8. Activity logs and history

### Technical Improvements
1. Implement proper authentication
2. Add comprehensive error handling
3. Implement retry mechanisms
4. Add offline mode support
5. Optimize Firebase queries
6. Add analytics tracking
7. Implement automated testing
8. Add CI/CD pipeline

---

**Document Version**: 1.0  
**Last Updated**: February 2026  
**Maintainer**: Development Team
