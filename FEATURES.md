# Godrej Home - Features Documentation

Complete feature breakdown with usage instructions, technical details, and tips.

## Table of Contents

1. [Home Automation Scenes](#home-automation-scenes)
2. [Smart Door Lock](#smart-door-lock)
3. [Video Door Bell (VDB)](#video-door-bell-vdb)
4. [CCTV Camera](#cctv-camera)
5. [Smart Lighting](#smart-lighting)
6. [Smart Fan Control](#smart-fan-control)
7. [Bed Storage](#bed-storage)
8. [Wardrobe Control](#wardrobe-control)
9. [Safety Sensors](#safety-sensors)
10. [Room Controls](#room-controls)
11. [Notifications & Alerts](#notifications--alerts)

---

## Home Automation Scenes

### Overview
Pre-configured automation scenarios that control multiple devices simultaneously with a single tap.

### Available Scenes

#### 1. Good Morning Scene
**Purpose**: Optimize your home for the start of the day

**Activates**:
- 🔓 Unlocks main door
- 💡 Turns on lights at 75% brightness
- 🌀 Starts fan at medium speed
- 🪟 Checks window sensors
- 🔥 Activates safety sensors

**Best For**: 
- Morning routine automation
- Waking up with optimized home settings

**How to Use**:
1. Navigate to Home Scenes page
2. Tap "Good Morning" card
3. Wait for loading indicator
4. All devices activate automatically

**Technical Details**:
- Updates Firebase: `automation-flags/scene` → `morning`
- Triggers listeners in all connected devices
- Sync time: ~2-3 seconds
- Persists state across app restarts

#### 2. Good Night Scene
**Purpose**: Secure and prepare home for bedtime

**Activates**:
- 🔒 Locks all doors
- 💡 Turns off all lights
- 🌀 Stops all fans
- 🔥 Activates fire sensors
- 🪟 Monitors window sensors
- 📹 Enables security cameras

**Best For**:
- Bedtime routine
- Leaving home
- Enhanced security mode

**How to Use**:
1. Tap "Good Night" from Home Scenes
2. Confirm activation if prompted
3. All devices secure automatically

**Safety Features**:
- Verifies door lock status
- Sends confirmation notification
- Vibration feedback on completion

#### 3. House Party Scene
**Purpose**: Create entertaining atmosphere

**Activates**:
- 💡 Party mode lighting (color cycling)
- 🚪 Passage mode on door (no lock)
- 🌀 Fan at low speed
- 🔊 Adjusts ambiance settings

**Best For**:
- Entertaining guests
- Social gatherings
- Creating party atmosphere

**How to Use**:
1. Before guests arrive, activate scene
2. Door remains unlocked for easy entry
3. Lights create dynamic ambiance
4. Deactivate when party ends

**Pro Tip**: 
- Set up before guests arrive
- Remember to deactivate for security

#### 4. Vacation Mode
**Purpose**: Maximum security while away

**Activates**:
- 🔒 Locks all entry points
- 📹 Enables all cameras
- 🔥 Activates all sensors
- 🪟 Monitors all windows
- 🚨 Enables intrusion alerts
- 💡 Simulates presence (random light activity)

**Best For**:
- Extended time away
- Travel
- Maximum home security

**How to Use**:
1. Before leaving, activate Vacation mode
2. Receive confirmation notification
3. Get alerts for any sensor triggers
4. Deactivate when returning home

**Security Benefits**:
- 24/7 monitoring
- Immediate alerts for anomalies
- Simulated presence deters intruders

---

## Smart Door Lock

### Overview
IoT-enabled door lock with remote control, multiple modes, and battery monitoring.

### Features

#### Lock/Unlock Control
- **Remote Operation**: Control from anywhere with internet
- **Visual Feedback**: Green (locked) / Red (unlocked)
- **Haptic Feedback**: Vibration on toggle
- **Real-time Sync**: State syncs across all devices
- **Battery Monitor**: Shows current battery level

**How to Use**:
1. Tap door lock icon
2. Tap large circular lock button
3. Wait for animation and confirmation
4. Verify new state

**Firebase Path**: `automation-flags/door-lock`

#### Privacy Mode
**Purpose**: Enhanced security - prevents external unlocking

**When to Use**:
- Night time security
- When home alone
- Enhanced privacy needed

**Behavior**:
- Door cannot be unlocked from outside
- Only controllable from app
- Overrides all other modes

**How to Activate**:
1. Open door lock screen
2. Toggle "Privacy Mode" switch
3. Lock icon shows privacy indicator

#### Passage Mode
**Purpose**: Free access without locking

**When to Use**:
- Expecting frequent visitors
- Party mode
- Moving items in/out
- Quick errands

**Behavior**:
- Door remains unlocked
- No auto-lock
- Can be locked manually anytime

**How to Activate**:
1. Open door lock screen
2. Toggle "Passage Mode" switch
3. Door unlocks automatically

**Safety Note**: Remember to disable when not needed

### Battery Monitoring

**Display**: Shows percentage at bottom of screen

**Battery Levels**:
- 🟢 75-100%: Good
- 🟡 25-75%: Fair
- 🔴 0-25%: Replace soon

**Replacement**: Use 4x AA batteries

---

## Video Door Bell (VDB)

### Overview
Smart doorbell with live video streaming, capture, and recording capabilities.

### Features

#### Live Video Streaming
**Technology**: WebRTC-based real-time streaming

**Specifications**:
- Resolution: 720p
- Frame rate: 30 fps
- Latency: < 1 second
- Protocol: WebRTC + WebSocket signaling

**How to Use**:
1. Tap VDB icon from any screen
2. Wait for "Connecting..." (2-5 seconds)
3. Live feed appears automatically
4. Tap disconnect when done

**Connection States**:
- 🔴 Disconnected
- 🟡 Connecting...
- 🟢 Connected
- 🔴 Error/Timeout

**Troubleshooting**:
- Check internet connection
- Verify VDB device is powered
- Restart app if persistent issues
- Check WebSocket server status

#### Photo Capture
**Purpose**: Capture still images from live feed

**How to Use**:
1. While video is streaming
2. Tap camera icon button
3. Image captures instantly
4. Saved to photo gallery automatically

**Features**:
- High resolution capture
- Gallery integration
- Timestamp embedded
- Instant save

**Storage**: Saved to iOS Photos app

#### Video Recording
**Implementation**: Frame-by-frame capture (iOS compatible)

**How to Record**:
1. While streaming, tap record button (red circle)
2. Recording duration displays
3. Tap stop to end recording
4. Video saved to gallery

**Technical Details**:
- Captures frames at 10 fps
- Converts to video format
- iOS-compatible encoding
- Auto-saves on completion

**Duration**: Up to 60 seconds per recording

**Storage Location**: iOS Photos app → Videos

### Best Practices
- Good lighting improves video quality
- Strong WiFi connection essential
- Clean camera lens regularly
- Test before important events

---

## CCTV Camera

### Overview
Professional CCTV camera integration with PTZ controls and live streaming.

### Features

#### Live Streaming
**Technology**: JA Camera SDK (native iOS)

**Specifications**:
- Resolution: 1080p
- Channel: Multi-channel support
- Device ID: Hardcoded for demo (6659244802)
- Pre-initialization: SDK loads at app startup

**How to Use**:
1. Tap camera icon
2. Camera initializes (pre-loaded)
3. Live stream appears in seconds
4. Use PTZ controls for viewing angle

**Performance Tip**: Wait 30 seconds after app launch for optimal loading

#### PTZ Controls
**PTZ**: Pan-Tilt-Zoom

**Controls**:
- 🔄 Pan: Rotate camera left/right
- ↕️ Tilt: Angle camera up/down
- 🔍 Zoom: Zoom in/out
- 🏠 Home: Return to default position

**How to Use**:
- Controls appear on screen overlay
- Touch and hold for continuous movement
- Single tap for incremental adjustment
- Smooth movement for optimal viewing

#### Camera Management
**Current Setup**: Demo camera (ID: 6659244802)

**To Add New Camera**:
1. Modify `CameraScreen.dart`
2. Update device ID, username, password
3. Set channel count
4. Save configuration

**Multiple Cameras**: Extend implementation to support multiple devices

### Technical Details
- Native iOS SDK integration
- Platform channel communication
- Hardware-accelerated decoding
- Low latency streaming

---

## Smart Lighting

### Overview
Full-featured smart lighting with color control, brightness, and party mode.

### Features

#### Basic Control
**Power Toggle**:
- Tap power button to turn on/off
- Visual feedback shows state
- Firebase real-time sync

**Status Colors**:
- 🟢 Green: On
- 🔴 Red: Off
- ⚪ Grey: Offline

#### Brightness Control
**Range**: 0% (off) to 100% (maximum)

**How to Adjust**:
1. Open light control screen
2. Use slider to adjust
3. Real-time brightness changes
4. Release to set

**Firebase Path**: `automation-flags/living-light-intensity`

**Technical**: 
- Throttled writes (200ms)
- Smooth transitions
- State persistence

#### Color Selection

**Color Wheel**:
- Full spectrum selection
- Drag indicator to choose color
- Real-time preview
- Hex color stored in Firebase

**How to Use**:
1. Drag indicator on color wheel
2. Color changes in real-time
3. Release to set final color

**Preset Colors**:
1. 🟡 Warm Yellow
2. 🟡 Light Yellow  
3. ⚪ Pure White

Tap any preset for instant color change

**Firebase Path**: `automation-flags/living-light-hex`

#### Party Mode
**Purpose**: Dynamic lighting effects

**Behavior**:
- Automatic color cycling
- Smooth transitions
- Random patterns
- Creates party atmosphere

**How to Activate**:
1. Toggle "Party Mode" switch
2. Lights begin cycling
3. Toggle off to stop

**Firebase Path**: `automation-flags/living-light-party`

**Cycle Speed**: ~3 seconds per color

### Use Cases
- **Reading**: 100% brightness, white color
- **Relaxing**: 40% brightness, warm yellow
- **Movie Night**: 20% brightness, dimmed
- **Party**: Party mode enabled
- **Sleep**: Lights off

---

## Smart Fan Control

### Overview
Variable speed fan control with real-time adjustment.

### Features

#### Power Control
- Toggle on/off
- Visual state indicator
- Firebase sync across devices

#### Speed Control
**Levels**: 0 (off) to 5 (maximum)

**Speed Settings**:
- 0: Off
- 1: Low (25%)
- 2: Medium-Low (40%)
- 3: Medium (60%)
- 4: Medium-High (80%)
- 5: Maximum (100%)

**How to Adjust**:
1. Open fan control screen
2. Use speed slider
3. Adjust to desired level
4. Changes apply immediately

**Firebase Path**: `automation-flags/living-fan-speed`

### Best Practices
- Start at low speed
- Gradually increase as needed
- Use medium speeds for energy efficiency
- Maximum speed for hot days

---

## Bed Storage

### Overview
Motorized bed storage with Bluetooth Low Energy (BLE) control.

### Features

#### BLE Connection
**Device Name**: "EB" (Electronic Bed)

**Connection Process**:
1. Open bed storage screen
2. App scans for "EB" device
3. Auto-connects when found
4. "Connected" status displays

**Range**: ~10 meters

**Troubleshooting**:
- Ensure Bluetooth is on
- Move closer to bed
- Check device battery
- Restart app if needed

#### Control Commands

**UP (Open)**:
- Opens storage compartment
- Motor runs until fully open
- Auto-stops at limit

**STOP**:
- Emergency stop
- Halts motor immediately
- Use if obstruction detected

**DOWN (Close)**:
- Closes storage compartment
- Motor runs until fully closed
- Auto-stops at limit

**How to Use**:
1. Wait for "Connected" status
2. Tap desired button (UP/STOP/DOWN)
3. Monitor movement
4. Button highlights when active
5. Stops automatically when complete

### Safety Features
- Obstruction detection
- Emergency stop
- Motor timeout
- Status monitoring

**Safety Tips**:
- Keep area clear during operation
- Don't force if stuck
- Use STOP if unusual sounds
- Keep children away during operation

---

## Wardrobe Control

### Overview
Automated wardrobe with motorized door control.

### Features

#### Control Commands

**OPEN**:
- Slides doors open
- Smooth motor operation
- Auto-stops when fully open

**CLOSE**:
- Slides doors closed
- Smooth closure
- Auto-stops when fully closed

**STOP**:
- Emergency stop
- Immediate halt
- Safety feature

**How to Use**:
1. Tap desired button
2. Doors move automatically
3. Wait for completion
4. Use STOP if needed

### Use Cases
- Morning routine automation
- Voice command integration (future)
- Accessibility assistance

---

## Safety Sensors

### Fire Sensor

**Monitoring**: Continuous background monitoring

**Alert Behavior**:
- 🚨 Push notification
- 📳 Continuous vibration
- 🔴 Red icon indicator
- 📢 Alert dialog

**Response Actions**:
1. Acknowledge alert
2. Verify fire sensor location
3. Evacuate if necessary
4. Call emergency services

**Firebase Path**: `automation-flags/fire-alert`

**Reset**: Automatically resets when danger cleared

### Window Sensor

**Monitoring**: Open/close state detection

**States**:
- 🟢 Closed (secure)
- 🔴 Open

**Alerts**:
- Notification if opened unexpectedly
- Vacation mode triggers alert
- Security monitoring

**Firebase Path**: `automation-flags/window-open`

**Use Cases**:
- Security monitoring
- Ventilation tracking
- Energy efficiency

### Gas Sensor (Kitchen)

**Monitoring**: Gas leak detection

**Alert**:
- 🚨 Immediate notification
- 🔴 Red indicator
- ⚠️ Warning message

**Response Actions**:
1. Ventilate area immediately
2. Turn off gas supply
3. Evacuate if needed
4. Call gas company/emergency

**Location**: Kitchen only

**Safety Critical**: Respond immediately

---

## Room Controls

### Living Room
**Devices** (9 total):
1. Door Lock
2. Video Door Bell
3. CCTV Camera
4. Smart Lights (x2)
5. Smart Fan
6. Window Sensor
7. Fire Sensor
8. AC (placeholder)

### Kitchen  
**Devices** (6 total):
1. Window Sensor
2. Gas Sensor
3. Chimney (placeholder)
4. Fan
5. Lights (x2)

### Bedroom
**Devices** (6 total):
1. Window Sensor
2. Fire Sensor
3. AC (placeholder)
4. Bed Storage
5. Smart Lights
6. Wardrobe

**Navigation**: 
- Swipe up to desired room page
- Or tap room from Home Spaces

---

## Notifications & Alerts

### Types

#### Critical Alerts
- 🔥 Fire detection
- 💨 Gas leak
- 🚪 Unauthorized entry

**Behavior**:
- Immediate push notification
- Continuous vibration
- Audio alert
- Full-screen dialog

#### Status Updates
- ✅ Device state changes
- 🔋 Low battery warnings
- 🔌 Device offline alerts

**Behavior**:
- Push notification
- In-app badge
- Notification center entry

#### Scene Confirmations
- ✨ Scene activated
- 🔒 Security mode enabled
- ✅ Operation completed

**Behavior**:
- Brief notification
- Toast message
- Haptic feedback

### Settings
Configure in iOS Settings → Godrej Home:
- Enable/disable notifications
- Alert sounds
- Badge app icon
- Show previews

---

## Tips & Tricks

### 1. Quick Access
Favorite devices on welcome screen for one-tap access

### 2. Scene Scheduling
Use with iOS Shortcuts for time-based automation

### 3. Multi-Device Sync
Changes sync instantly across all logged-in devices

### 4. Offline Mode
Most controls require internet; plan accordingly

### 5. Battery Life
Background location and Bluetooth impact battery

---

**Document Version**: 1.0  
**Last Updated**: February 2026  
**Total Features**: 40+
