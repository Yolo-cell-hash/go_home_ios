# Godrej Home - Smart Home Control App

A comprehensive iOS smart home control application built with Flutter that enables users to control and monitor various IoT devices and home automation systems. Designed for Godrej smart home ecosystems, this app provides seamless control over door locks, cameras, lights, fans, sensors, and more.

> 📚 **New to the documentation?** Check out the [Documentation Index](DOCS_INDEX.md) for a complete guide to all available documentation.
> 
> ⚡ **Want to get started quickly?** Jump to the [Quick Start Guide](QUICKSTART.md) for a 5-minute setup.

## 📱 App Overview

Godrej Home is a feature-rich smart home automation app that brings complete control of your home at your fingertips. The app integrates with Firebase for real-time data synchronization and supports multiple IoT protocols including Bluetooth Low Energy (BLE) for device communication.

## ✨ Key Features

### 🏠 Home Control & Automation
- **Home Scenes**: Pre-configured automation scenes for different scenarios
  - Good Morning - Optimizes home for morning routine
  - Good Night - Prepares home for bedtime
  - House Party - Sets ambiance for entertaining
  - Vacation Mode - Secures home while away

### 🚪 Smart Door Lock Control
- Lock/unlock door remotely
- Privacy mode for enhanced security
- Passage mode for convenient access
- Battery level monitoring
- Firebase real-time synchronization

### 📹 Video Security Systems
- **CCTV Camera**: Live video streaming with PTZ (Pan-Tilt-Zoom) controls
- **Video Door Bell (VDB)**: 
  - Live video feed from door bell
  - Video capture and recording capabilities
  - Frame-by-frame recording for iOS compatibility
  - Image gallery integration for saved captures

### 💡 Smart Lighting Control
- On/off toggle for individual lights
- Brightness adjustment slider
- Color selection with color wheel picker
- Party mode for dynamic lighting effects
- Preset color options
- Real-time Firebase sync across devices

### 🌀 Climate Control
- **Smart Fan Control**:
  - On/off toggle
  - Speed adjustment (0-5 levels)
  - Real-time status updates
- **Air Conditioning** (Placeholder for future integration)

### 🛏️ Smart Furniture
- **Bed Storage Control**:
  - BLE-based motorized control
  - Up/down movement
  - Emergency stop function
- **Wardrobe Control**:
  - Automated open/close
  - Stop control for safety

### 🔔 Safety & Security
- **Fire Sensor Monitoring**: Real-time fire detection alerts
- **Window Sensor**: Open/close status monitoring
- **Gas Sensor**: Gas leak detection (Kitchen)
- Push notifications for critical alerts
- Vibration feedback for emergency situations

### 📍 Room-Based Control
Navigate and control devices by room:
- **Living Room**: Door lock, VDB, camera, lights, fan, window sensor, fire sensor
- **Kitchen**: Window sensor, gas sensor, chimney, fan, lights
- **Bedroom**: Window sensor, fire sensor, AC, bed storage, lights, wardrobe

## 🛠️ Technology Stack

### Frontend
- **Framework**: Flutter (Dart)
- **UI Design**: Cupertino (iOS-style) widgets
- **State Management**: Provider pattern
- **Animations**: animate_do package

### Backend & Services
- **Firebase Core**: App initialization and configuration
- **Firebase Realtime Database**: Real-time device state synchronization
- **Cloud Firestore**: Document-based data storage
- **Firebase Messaging**: Push notifications

### Device Communication
- **flutter_blue_plus**: Bluetooth Low Energy (BLE) communication
- **flutter_webrtc**: WebRTC for video streaming
- **web_socket_channel**: WebSocket connections

### Media & Storage
- **image_gallery_saver_plus**: Save captured images
- **path_provider**: File system access
- **shared_preferences**: Local data persistence

### Location & Permissions
- **geolocator**: Location services
- **permission_handler**: Runtime permission management

### UI Components
- **flutter_svg**: SVG image rendering
- **carousel_slider**: Image carousels
- **modal_progress_hud_nsn**: Loading indicators
- **quickalert**: Alert dialogs
- **fluttertoast**: Toast notifications

### Utilities
- **vibration**: Haptic feedback
- **flutter_local_notifications**: Local notification system

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **macOS**: Required for iOS development
- **Xcode**: Latest version (14.0+)
- **Flutter SDK**: Version 3.9.0 or higher
- **Dart SDK**: Included with Flutter
- **CocoaPods**: For iOS dependencies
- **Firebase Account**: For backend services
- **iOS Device or Simulator**: iOS 12.0+

## 🚀 Installation & Setup

### Step 1: Clone the Repository
```bash
git clone https://github.com/Yolo-cell-hash/go_home_ios.git
cd go_home_ios
```

### Step 2: Install Flutter Dependencies
```bash
flutter pub get
```

### Step 3: Install iOS Dependencies
```bash
cd ios
pod install
cd ..
```

### Step 4: Firebase Configuration
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add an iOS app to your Firebase project
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory
5. Enable the following Firebase services:
   - Realtime Database
   - Cloud Firestore
   - Cloud Messaging
   - Authentication (if needed)

### Step 5: Configure Permissions
The app requires the following permissions (already configured in Info.plist):
- Camera access
- Microphone access
- Bluetooth
- Location services
- Notifications
- Photo library access

### Step 6: Build and Run
```bash
# For iOS Simulator
flutter run

# For iOS Device (requires Apple Developer account)
flutter run --release
```

## 📖 How to Use the App

### Initial Setup

1. **Launch the App**
   - Open the Godrej Home app on your iOS device
   - The splash screen will appear with the Godrej branding
   - Permissions will be requested automatically

2. **Grant Permissions**
   - Allow all requested permissions for full functionality:
     - Bluetooth: For BLE device control
     - Camera & Microphone: For video features
     - Location: For geofencing features
     - Notifications: For alerts and updates

3. **Navigate to Home Screen**
   - After splash screens, you'll arrive at the main home screen
   - This displays the property name "Willow Edge"

### Using Home Scenes

1. **Access Home Scenes**
   - Swipe up from the welcome screen or navigate to the scenes page
   - Four preset scenes are available

2. **Activate a Scene**
   - **Good Morning**: Tap to activate morning routine
     - Unlocks door
     - Turns on lights at optimal brightness
     - Adjusts temperature
   
   - **Good Night**: Tap for bedtime settings
     - Locks all doors
     - Turns off lights
     - Activates security sensors
   
   - **House Party**: Tap for entertainment mode
     - Activates party lighting mode
     - Adjusts ambiance
   
   - **Vacation**: Tap when leaving home
     - Locks all entry points
     - Activates all sensors
     - Enables security mode

3. **Scene Activation Feedback**
   - Loading indicator appears during activation
   - Selected scene is highlighted
   - Changes sync across all devices

### Controlling Room Devices

#### Living Room Control

1. **Navigate to Living Room**
   - From Home Scenes page, tap "Living Room" under Home Spaces
   - Or swipe up to reach the living room control page

2. **Control Individual Devices**
   - Tap device icons to view status:
     - Green: Device active/on
     - Red: Device inactive/off
     - Grey: Device offline/unavailable

3. **Device Actions**
   - Tap on a device icon to open detailed control screen
   - Available devices:
     - Door Lock
     - Video Door Bell (VDB)
     - CCTV Camera
     - Smart Lights
     - Fan
     - Window Sensor (monitoring only)
     - Fire Sensor (monitoring only)

#### Kitchen Control

1. **Navigate to Kitchen**
   - Tap "Kitchen" from Home Spaces section
   - Kitchen control panel displays

2. **Monitor & Control**
   - Window Sensor: View open/close status
   - Gas Sensor: Real-time gas leak monitoring
   - Chimney: Control (placeholder)
   - Fan: Speed control
   - Lights: On/off and brightness

#### Bedroom Control

1. **Navigate to Bedroom**
   - Tap "Bedroom" from Home Spaces
   - Bedroom devices appear

2. **Device Control**
   - Window Sensor: Monitor status
   - Fire Sensor: Safety monitoring
   - Air Conditioner: Temperature control (placeholder)
   - Bed Storage: Motorized control
   - Lights: Full lighting control
   - Wardrobe: Automated access

### Smart Door Lock Usage

1. **Access Door Lock Screen**
   - Tap door lock icon from any room view
   - Or tap door lock from welcome screen icons

2. **Lock/Unlock Door**
   - Tap the large circular lock button
   - Visual feedback shows locked (green) or unlocked (red) state
   - Firebase syncs state across all devices

3. **Special Modes**
   - **Privacy Mode**: Toggle for enhanced security
     - Prevents unlocking from outside
     - Ideal for night time or when home alone
   
   - **Passage Mode**: Toggle for free access
     - Door remains unlocked
     - Useful during parties or when expecting guests

4. **Battery Monitoring**
   - Battery level displayed at bottom
   - Replace batteries when level is low

### Video Door Bell (VDB)

1. **Access VDB Screen**
   - Tap VDB icon (video camera with person)
   - Live feed connects automatically

2. **View Live Feed**
   - Wait for connection (typically 2-5 seconds)
   - Live video stream appears in center frame
   - Connection status displayed at top

3. **Capture Photo**
   - Tap the camera icon button
   - Image is captured and saved to gallery
   - Toast notification confirms save

4. **Record Video**
   - Tap the record button (red circle)
   - Recording duration displays
   - Frames are captured for iOS compatibility
   - Tap stop to end recording
   - Video saved to photo gallery

5. **Troubleshooting VDB**
   - If "Connecting..." persists, check internet connection
   - Tap disconnect and reconnect
   - Ensure VDB device is powered on

### CCTV Camera Control

1. **Access Camera Screen**
   - Tap camera icon from living room or welcome screen
   - App connects to hardcoded demo camera

2. **View Live Feed**
   - Camera initializes (SDK pre-loaded at app start)
   - Live stream appears in dedicated view area
   - Built-in controls appear on screen

3. **PTZ Controls**
   - Pan/Tilt/Zoom controls provided by SDK
   - Use on-screen controls to adjust view
   - Smooth movement for optimal monitoring

4. **Camera Status**
   - Connection status shown at top
   - Device info: Main Camera (ID: 6659244802)

### Smart Light Control

1. **Access Light Control**
   - Tap light bulb icon
   - Light control screen opens

2. **Toggle Light**
   - Tap power button to turn on/off
   - State syncs immediately to Firebase
   - Visual feedback shows current state

3. **Adjust Brightness**
   - Use slider to control intensity
   - Range: 0% (off) to 100% (full)
   - Changes apply in real-time

4. **Select Color**
   - Drag indicator on color wheel
   - Choose from full spectrum
   - Or tap preset colors:
     - Warm Yellow
     - Light Yellow
     - Pure White

5. **Party Mode**
   - Toggle party mode switch
   - Lights cycle through colors
   - Creates dynamic atmosphere

### Smart Fan Control

1. **Access Fan Control**
   - Tap fan icon from any room
   - Fan control interface loads

2. **Turn On/Off**
   - Tap power button
   - Fan status updates in Firebase

3. **Adjust Speed**
   - Use speed slider (0-5)
   - Level 0: Off
   - Level 5: Maximum speed
   - Real-time adjustment

### Bed Storage Control

1. **Access Bed Storage**
   - Navigate to bedroom
   - Tap bed storage icon

2. **Connect via Bluetooth**
   - App scans for "EB" BLE device
   - Connection status displayed
   - Wait for "Connected" status

3. **Control Storage**
   - **UP (Open)**: Tap up arrow
     - Storage compartment opens
     - Monitor movement
   
   - **STOP**: Tap middle button
     - Emergency stop
     - Use if obstruction detected
   
   - **DOWN (Close)**: Tap down arrow
     - Closes storage compartment
     - Automatic stop at fully closed

4. **Safety Notes**
   - Always ensure path is clear
   - Use STOP if movement sounds unusual
   - Keep away from children during operation

### Wardrobe Control

1. **Access Wardrobe Screen**
   - Tap wardrobe icon in bedroom
   - Control panel opens

2. **Open/Close Wardrobe**
   - **OPEN**: Tap open button
     - Wardrobe doors slide open
   
   - **CLOSE**: Tap close button
     - Doors close automatically
   
   - **STOP**: Emergency stop
     - Halts movement immediately

### Safety Sensors & Alerts

#### Fire Sensor
- **Real-time Monitoring**: Continuous background monitoring
- **Alert Behavior**:
  - Push notification sent immediately
  - Device vibrates continuously
  - Alert dialog displayed
  - Icon turns red on all screens
- **Response**:
  - Acknowledge alert
  - Evacuate if necessary
  - Check fire sensor status

#### Window Sensor
- **Status Display**: Shows open/closed state
- **Alert**:
  - Notification if window opened unexpectedly
  - Icon color indicates state
- **Usage**:
  - Monitor security
  - Track ventilation

#### Gas Sensor (Kitchen)
- **Leak Detection**: Monitors for gas leaks
- **Alert System**:
  - Immediate notification
  - Visual warning on screen
- **Action**:
  - Ventilate area
  - Turn off gas supply
  - Contact emergency services if needed

## 🏗️ App Architecture

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── vertical_home_screen.dart
│   ├── setup_main_screen.dart
│   └── vertical_home/        # Room control screens
│       ├── welcome_screen.dart
│       ├── home_scenes_screen.dart
│       ├── room_control_screen.dart
│       ├── door_lock_screen.dart
│       ├── vdb_screen.dart
│       ├── camera_screen.dart
│       ├── light_control_screen.dart
│       ├── fan_control_screen.dart
│       ├── bed_storage_screen.dart
│       └── wardrobe_screen.dart
├── services/                 # Business logic
│   ├── ja_camera_service.dart
│   ├── janus_webrtc_client.dart
│   ├── notification_service.dart
│   ├── vdb_service.dart
│   └── vdb_firebase_service.dart
├── widgets/                  # Reusable components
│   ├── navbar_home_screen.dart
│   ├── navbar_setup.dart
│   ├── onboarding_card.dart
│   ├── presets_panel.dart
│   └── ja_camera_view.dart
└── utils/                    # Utilities
    ├── app_state.dart
    └── ble_util.dart

ios/Runner/                   # iOS-specific code
├── AppDelegate.swift
├── JACameraPlugin.swift      # Camera SDK integration
└── JACameraViewFactory.swift
```

### Design Patterns
- **Provider Pattern**: State management across screens
- **Service Layer**: Separates business logic from UI
- **Stream-based Updates**: Real-time data synchronization
- **Singleton Pattern**: BLE controller, camera service

### Firebase Database Structure
```
automation-flags/
├── door-lock: boolean        # Door lock state
├── vdb: boolean              # VDB active state
├── camera: boolean           # Camera active state
├── living-light: boolean     # Living room light state
├── living-light-hex: string  # Light color (hex)
├── living-light-intensity: number  # Brightness (0-100)
├── living-light-party: boolean     # Party mode
├── living-fan: boolean       # Fan on/off
├── living-fan-speed: number  # Fan speed (0-5)
├── fire-alert: boolean       # Fire detection
└── window-open: boolean      # Window status
```

## 🔧 Configuration

### Firebase Setup Details

1. **Realtime Database Rules**
```json
{
  "rules": {
    "automation-flags": {
      ".read": true,
      ".write": true
    }
  }
}
```

2. **Firestore Rules** (if using Firestore)
```
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

### Bluetooth Configuration
- **Target Device**: "EB" (Electronic Bed)
- **Services**: Custom BLE services for motor control
- **Characteristics**: Read/Write for command transmission

### Camera SDK Configuration
- **SDK**: JA Camera SDK (iOS native)
- **Demo Device ID**: 6659244802
- **Default Channel**: 1
- **Pre-initialization**: Occurs at app startup for faster loading

## 🐛 Troubleshooting

### Common Issues

**Issue**: App crashes on launch
- **Solution**: Ensure all pods are installed (`cd ios && pod install`)
- Check Firebase configuration file is present

**Issue**: Bluetooth not connecting
- **Solution**: 
  - Verify Bluetooth is enabled on device
  - Check permissions are granted
  - Restart app
  - Move closer to BLE device

**Issue**: Camera not loading
- **Solution**:
  - Camera SDK initializes at startup
  - Wait 30 seconds after app launch
  - Check network connection
  - Verify device ID is correct

**Issue**: VDB video not streaming
- **Solution**:
  - Check internet connection
  - Tap disconnect and reconnect
  - Restart app
  - Verify WebRTC signaling server is accessible

**Issue**: Firebase not syncing
- **Solution**:
  - Check internet connection
  - Verify Firebase configuration
  - Check database rules allow read/write
  - Look at Firebase console for errors

**Issue**: Notifications not working
- **Solution**:
  - Grant notification permission in Settings
  - Check FCM token is generated
  - Verify Firebase Messaging is configured

### Debug Mode
Enable debug logging by checking console output:
```bash
flutter run --verbose
```

Look for log prefixes:
- `[NotificationService]`: Notification events
- `[JACameraService]`: Camera operations
- `[VDB DEBUG]`: Video doorbell operations
- `[BED STORAGE DEBUG]`: BLE communication

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow [Flutter style guide](https://flutter.dev/docs/development/tools/formatting)
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

## 📄 License

This project is private and proprietary. All rights reserved.

## 📞 Support

For issues, questions, or feature requests:
- Open an issue on GitHub
- Contact: [Project Maintainer]

## 🙏 Acknowledgments

- **Godrej**: For smart home device ecosystem
- **Flutter Team**: For the amazing framework
- **Firebase**: For real-time backend services
- **JA Camera SDK**: For camera integration
- **Open Source Community**: For various packages used

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [iOS Development Guide](https://developer.apple.com/ios/)

---

**Version**: 1.0.0  
**Last Updated**: February 2026  
**Minimum iOS Version**: 12.0  
**Flutter Version**: 3.9.0+
