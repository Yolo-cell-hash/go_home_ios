# Quick Start Guide - Godrej Home

Get up and running with Godrej Home in minutes!

## ⚡ Quick Setup (5 Minutes)

### Step 1: Install Prerequisites
```bash
# Verify Flutter is installed
flutter --version

# Should show: Flutter 3.9.0 or higher
```

### Step 2: Clone and Setup
```bash
# Clone the repository
git clone https://github.com/Yolo-cell-hash/go_home_ios.git
cd go_home_ios

# Get Flutter dependencies
flutter pub get

# Install iOS dependencies
cd ios && pod install && cd ..
```

### Step 3: Configure Firebase (Required)
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use existing
3. Add iOS app with bundle ID: `com.godrej.home`
4. Download `GoogleService-Info.plist`
5. Place it in `ios/Runner/` directory

### Step 4: Run the App
```bash
# For iOS Simulator
flutter run

# For iOS Device
flutter run --release
```

## 🎯 First Use

### 1. Grant Permissions
When the app launches, grant these permissions:
- ✅ Bluetooth (for smart devices)
- ✅ Camera & Microphone (for video features)
- ✅ Location (for automation)
- ✅ Notifications (for alerts)

### 2. Navigate the App
The app uses vertical swipe navigation:
- **Page 1**: Welcome screen with quick access icons
- **Page 2**: Home Scenes & Room selection
- **Page 3**: Living Room controls
- **Page 4**: Kitchen controls
- **Page 5**: Bedroom controls

### 3. Try These Features First

#### Control Smart Door Lock
1. Swipe up to Home Scenes page
2. Tap "Living Room" 
3. Tap the door lock icon (first icon)
4. Tap the big lock button to lock/unlock

#### Set a Home Scene
1. On Home Scenes page (swipe up from welcome)
2. Tap "Good Morning" or "Good Night"
3. Watch devices activate automatically!

#### Control Smart Lights
1. Navigate to Living Room (swipe up twice)
2. Tap the light bulb icon
3. Toggle on/off
4. Adjust brightness and color

## 🔧 Common First-Time Issues

### Issue: "GoogleService-Info.plist not found"
**Fix**: Download from Firebase Console and place in `ios/Runner/`

### Issue: "CocoaPods not installed"
**Fix**: 
```bash
sudo gem install cocoapods
cd ios && pod install && cd ..
```

### Issue: App crashes on launch
**Fix**: Ensure you've run `flutter pub get` and `pod install`

### Issue: Permissions not appearing
**Fix**: Delete app from simulator/device and reinstall

## 📱 Test on Real Device

### Requirements
- Apple Developer Account
- iOS device (iOS 12.0+)
- Lightning cable

### Steps
1. Connect iPhone to Mac
2. Open `ios/Runner.xcworkspace` in Xcode
3. Select your device from device menu
4. Click Run button
5. Trust developer certificate on device (Settings → General → Device Management)

## 🎓 Learn More

After getting started, explore:
- 📖 [README.md](README.md) - Complete feature documentation
- 🏗️ [ARCHITECTURE.md](ARCHITECTURE.md) - Technical deep dive
- 🤝 [CONTRIBUTING.md](CONTRIBUTING.md) - Development guidelines

## 💡 Pro Tips

1. **Faster Camera Loading**: The camera SDK pre-initializes at app startup. Wait 30 seconds after first launch for best performance.

2. **Firebase Real-Time Sync**: All device states sync across multiple devices automatically via Firebase.

3. **Bluetooth Range**: Stay within 10 meters of BLE devices (bed storage, wardrobe) for reliable connection.

4. **VDB Video**: Requires good internet connection. If video doesn't load, check your WiFi.

5. **Save Battery**: The app uses location services in background. Disable in Settings if not needed.

## 🚀 Next Steps

Once you're comfortable with basics:
1. Explore all room controls (Living, Kitchen, Bedroom)
2. Try the camera and video doorbell features
3. Set up automation scenes for your daily routine
4. Configure Firebase security rules for production use
5. Customize the app for your specific smart home setup

## 📞 Need Help?

- 🐛 **Found a bug?** → [Open an issue](https://github.com/Yolo-cell-hash/go_home_ios/issues)
- 💬 **Have questions?** → Check [README.md](README.md) Troubleshooting section
- 🤝 **Want to contribute?** → Read [CONTRIBUTING.md](CONTRIBUTING.md)

---

Happy smart home controlling! 🏠✨
