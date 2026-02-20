// vertical_home_screen.dart
// Main controller for the vertical home screen with snap scrolling
// Coordinates all screen components and manages state
// Integrates with Firebase Realtime Database for automation flags

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vibration/vibration.dart';
import 'package:godrej_home/services/notification_service.dart';

// Import modular screen components
import 'vertical_home/welcome_screen.dart';
import 'vertical_home/home_scenes_screen.dart';
import 'vertical_home/room_control_screen.dart';
import 'vertical_home/door_lock_screen.dart';
import 'vertical_home/vdb_screen.dart';
import 'vertical_home/camera_screen.dart';
import 'vertical_home/bed_storage_screen.dart';
import 'vertical_home/wardrobe_screen.dart';
import 'vertical_home/light_control_screen.dart';
import 'vertical_home/fan_control_screen.dart';

/// Main vertical home screen with snap scrolling pages
class VerticalHomeScreen extends StatefulWidget {
  const VerticalHomeScreen({super.key});

  @override
  State<VerticalHomeScreen> createState() => _VerticalHomeScreenState();
}

class _VerticalHomeScreenState extends State<VerticalHomeScreen> {
  // Page controller for snap scrolling
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Firebase Realtime Database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  // Firebase reference for automation-flags/profile monitoring
  StreamSubscription<DatabaseEvent>? _profileSubscription;

  // Stream subscription for real-time Firebase updates
  StreamSubscription<DatabaseEvent>? _firebaseSubscription;
  StreamSubscription<DatabaseEvent>? _fireAlertSubscription;
  StreamSubscription<DatabaseEvent>? _windowAlertSubscription;

  // Flag to track if initial data has been loaded
  bool _isLoading = true;

  // Active user name parsed from /dev_env/ack
  String? _activeUserName;

  // Known users with avatar images
  static const Set<String> _knownUsers = {'deodatta', 'parag', 'sd', 'jinay'};

  // Fire and window alert states
  bool _isFireAlert = false;
  bool _isWindowOpen = false;
  Timer? _vibrationTimer;

  // Toggle states for living room controls (3x3 = 9 buttons)
  List<bool> _livingRoomToggles = List.generate(9, (index) => false);

  // Toggle states for kitchen controls (3x2 = 6 buttons)
  List<bool> _kitchenToggles = List.generate(6, (index) => false);

  // Toggle states for bedroom controls (3x2 = 6 buttons)
  List<bool> _bedroomToggles = List.generate(6, (index) => false);

  // Toggle states for welcome screen icons
  List<bool> _welcomeIconToggles = List.generate(3, (index) => false);

  // Selected home scene preset (0-3 for the 4 options, -1 for none)
  int _selectedHomeScene = -1;

  // Loading state for scene selection
  bool _isSceneLoading = false;

  // Status colors for icons: 0=grey (inactive/no sync), 1=red (false), 2=green (true)
  // Welcome screen icons (3) - synced with Firebase (door-lock, vdb, camera)
  late List<int> _welcomeIconStatus = [2, 1, 2]; // green, red, green

  // Welcome icon DB keys mapping (index 0=door-lock, 1=vdb, 2=camera)
  static const List<String> welcomeIconDbKeys = ['door-lock', 'vdb', 'camera'];

  // Living room icons (9)
  // Index: 0=DoorLock, 1=VDB, 2=Camera, 3=Light, 4=Light(grey), 5=Fan, 6=WindowSensor, 7=FireSensor, 8=AC
  late List<int> _livingRoomStatus = [
    2,
    1,
    2,
    1,
    0,
    2,
    1,
    2,
    0,
  ]; // AC greyed out

  // Kitchen icons (6)
  // Index: 0=WindowSensor, 1=GasSensor, 2=Chimney, 3=Fan, 4=Light(grey), 5=Light
  late List<int> _kitchenStatus = [2, 1, 0, 1, 0, 2]; // Chimney greyed out

  // Bedroom icons (6)
  // Index: 0=WindowSensor, 1=FireSensor, 2=AC, 3=BedStorage, 4=Light(grey), 5=Wardrobe
  late List<int> _bedroomStatus = [
    1,
    2,
    0,
    2,
    0,
    0,
  ]; // AC and Wardrobe greyed out

  // Control items data for each room (with dbKey for Firebase mapping)
  static const List<Map<String, dynamic>> livingRoomControls = [
    {
      'icon': 'images/door_lock.png',
      'label': 'Door Lock',
      'dbKey': 'door-lock',
    },
    {'icon': 'images/vdb.svg', 'label': 'VDB', 'dbKey': 'vdb'},
    {'icon': 'images/camera.png', 'label': 'Camera', 'dbKey': 'camera'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': 'light'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': null}, // grey
    {'icon': 'images/fan.png', 'label': 'Fan', 'dbKey': 'fan'},
    {
      'icon': 'images/window_sensor.png',
      'label': 'Window Sensor',
      'dbKey': 'window-sensor',
    },
    {
      'icon': 'images/fire_sensor.png',
      'label': 'Fire Sensor',
      'dbKey': 'fire-sensor',
    },
    {
      'icon': 'images/ac.png',
      'label': 'Air Conditioner',
      'dbKey': null, // Disabled/greyed out
    },
  ];

  static const List<Map<String, dynamic>> kitchenControls = [
    {
      'icon': 'images/window_sensor.png',
      'label': 'Window Sensor',
      'dbKey': 'window-sensor',
    },
    {'icon': 'images/gas_sensor.png', 'label': 'Gas Sensor', 'dbKey': null},
    {
      'icon': 'images/chimney.png',
      'label': 'Chimney',
      'dbKey': null,
    }, // Disabled/greyed out
    {'icon': 'images/fan.png', 'label': 'Fan', 'dbKey': 'fan'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': null}, // grey
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': 'light'},
  ];

  static const List<Map<String, dynamic>> bedroomControls = [
    {
      'icon': 'images/window_sensor.png',
      'label': 'Window Sensor',
      'dbKey': 'window-sensor',
    },
    {
      'icon': 'images/fire_sensor.png',
      'label': 'Fire Sensor',
      'dbKey': 'fire-sensor',
    },
    {
      'icon': 'images/ac.png',
      'label': 'Air Conditioner',
      'dbKey': null, // Disabled/greyed out
    },
    {
      'icon': 'images/bed_storage.png',
      'label': 'Bed Storage',
      'dbKey': 'bed-storage',
    },
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': null}, // grey
    {
      'icon': 'images/wardrobe.png',
      'label': 'Wardrobe',
      'dbKey': null,
    }, // Disabled/greyed out
  ];

  @override
  void initState() {
    super.initState();
    print('[DEBUG] VerticalHomeScreen initState - fetching Firebase data');
    _fetchFirebaseState();
    _setupFirebaseListener();
    _setupProfileListener();
    // NOTE: BLE is intentionally NOT initialized here
    // BLE initialization happens in BedStorageScreen when user navigates there
  }

  // Map scene names (lowercase) to their indices for restoring selection
  static const Map<String, int> _sceneNameToIndex = {
    'good morning': 0,
    'good night': 1,
    'house party': 2,
    'vaccation': 3,
  };

  /// Setup real-time listener for /automation-flags/profile
  /// Known user names → show user; scene names → show "Mumbai Home" + highlight scene
  void _setupProfileListener() {
    _profileSubscription = _dbRef.child('profile').onValue.listen((event) {
      if (event.snapshot.exists && mounted) {
        final value = event.snapshot.value?.toString().toLowerCase() ?? '';
        print('[DEBUG] Profile value from Firebase: $value');
        if (_knownUsers.contains(value)) {
          setState(() {
            _activeUserName = value;
            _selectedHomeScene = -1; // Clear scene selection for user profiles
          });
          print('[DEBUG] Active user set to: $value');
        } else {
          // Scene name or unknown → show Mumbai Home
          final sceneIndex = _sceneNameToIndex[value] ?? -1;
          setState(() {
            _activeUserName = null;
            _selectedHomeScene = sceneIndex;
          });
          print(
            '[DEBUG] Profile is scene/unknown ($value), showing Mumbai Home, scene=$sceneIndex',
          );
        }
      } else if (mounted) {
        setState(() {
          _activeUserName = null;
          _selectedHomeScene = -1;
        });
      }
    });
  }

  /// Setup real-time Firebase listener for automation flags
  void _setupFirebaseListener() {
    _firebaseSubscription = _dbRef.onValue.listen((event) {
      if (event.snapshot.exists && mounted) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        print('[DEBUG] Firebase real-time update received');
        setState(() {
          _updateStatusFromFirebase(data);
        });
      }
    });

    // Listen to fire alert
    _fireAlertSubscription = _dbRef.child('is-fire').onValue.listen((event) {
      if (event.snapshot.exists && mounted) {
        final value = event.snapshot.value as bool? ?? false;
        if (value != _isFireAlert) {
          setState(() {
            _isFireAlert = value;
          });
          if (value) {
            _triggerAlertVibration();
            NotificationService().showFireAlertNotification();
            _showSensorAlert(
              'Fire Detected!',
              'Fire sensor has been triggered. Please evacuate immediately and contact emergency services.',
              isFireAlert: true,
            );
          } else {
            // Only stop vibration if window alert is also not active
            if (!_isWindowOpen) {
              _stopAlertVibration();
            }
          }
          print('[DEBUG] Fire alert updated: $value');
        }
      }
    });

    // Listen to window open alert
    _windowAlertSubscription = _dbRef.child('is-window-open').onValue.listen((
      event,
    ) {
      if (event.snapshot.exists && mounted) {
        final value = event.snapshot.value as bool? ?? false;
        if (value != _isWindowOpen) {
          setState(() {
            _isWindowOpen = value;
          });
          if (value) {
            _triggerAlertVibration();
            NotificationService().showWindowOpenNotification();
            _showSensorAlert(
              'Window Open!',
              'Window sensor detected that a window is open. Please check if this is intentional.',
              isFireAlert: false,
            );
          } else {
            // Only stop vibration if fire alert is also not active
            if (!_isFireAlert) {
              _stopAlertVibration();
            }
          }
          print('[DEBUG] Window open alert updated: $value');
        }
      }
    });
  }

  @override
  void dispose() {
    _firebaseSubscription?.cancel();
    _fireAlertSubscription?.cancel();
    _windowAlertSubscription?.cancel();
    _profileSubscription?.cancel();
    _vibrationTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// Trigger repeating vibration for alerts - continuous until acknowledged
  void _triggerAlertVibration() async {
    final hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator == true) {
      // More aggressive pattern: vibrate 800ms, pause 400ms, repeat
      _vibrationTimer?.cancel();
      _vibrationTimer = Timer.periodic(const Duration(milliseconds: 1200), (
        timer,
      ) async {
        // Check if any alert is still active before vibrating
        if (_isFireAlert || _isWindowOpen) {
          final canVibrate = await Vibration.hasVibrator();
          if (canVibrate == true) {
            Vibration.vibrate(duration: 800);
          }
        } else {
          // Stop timer if no alerts are active
          timer.cancel();
          _vibrationTimer = null;
        }
      });
      // Initial strong vibration
      Vibration.vibrate(duration: 800);
    }
  }

  /// Stop alert vibration
  void _stopAlertVibration() {
    _vibrationTimer?.cancel();
    _vibrationTimer = null;
    Vibration.cancel();
  }

  /// Show sensor alert dialog with elegant styling
  void _showSensorAlert(
    String title,
    String message, {
    required bool isFireAlert,
  }) {
    final alertColor = isFireAlert
        ? const Color(0xFFE53935)
        : const Color(0xFFFF9800);

    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: alertColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFireAlert
                      ? CupertinoIcons.flame_fill
                      : CupertinoIcons.rectangle_3_offgrid,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: alertColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(message, style: const TextStyle(fontSize: 14)),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                _stopAlertVibration();
                Navigator.of(dialogContext).pop();
              },
              child: Text('Acknowledge', style: TextStyle(color: alertColor)),
            ),
          ],
        );
      },
    );
  }

  /// Fetch initial state from Firebase Realtime Database
  Future<void> _fetchFirebaseState() async {
    print('[DEBUG] Fetching automation flags from Firebase...');
    try {
      final snapshot = await _dbRef.get();
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        print('[DEBUG] Firebase data received: $data');

        setState(() {
          // Update all status lists based on Firebase values
          _updateStatusFromFirebase(data);
          _isLoading = false;
        });
      } else {
        print('[DEBUG] No data found in Firebase');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('[ERROR] Failed to fetch Firebase data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Update all status lists based on Firebase data
  /// true in DB -> green (2), false in DB -> red (1), grey items (0) unchanged
  void _updateStatusFromFirebase(Map<String, dynamic> data) {
    print('[DEBUG] Updating status from Firebase data');

    // Helper to get status from DB value
    int getStatus(bool? value, int currentStatus) {
      if (currentStatus == 0) return 0; // Keep grey items unchanged
      return value == true ? 2 : 1; // true -> green, false -> red
    }

    // Update Living Room status
    for (int i = 0; i < livingRoomControls.length; i++) {
      final dbKey = livingRoomControls[i]['dbKey'] as String?;
      if (dbKey != null && _livingRoomStatus[i] != 0) {
        final value = data[dbKey] as bool?;
        _livingRoomStatus[i] = getStatus(value, _livingRoomStatus[i]);
        print(
          '[DEBUG] Living room[$i] ($dbKey) = $value -> status ${_livingRoomStatus[i]}',
        );
      }
    }

    // Update Kitchen status
    for (int i = 0; i < kitchenControls.length; i++) {
      final dbKey = kitchenControls[i]['dbKey'] as String?;
      if (dbKey != null && _kitchenStatus[i] != 0) {
        final value = data[dbKey] as bool?;
        _kitchenStatus[i] = getStatus(value, _kitchenStatus[i]);
        print(
          '[DEBUG] Kitchen[$i] ($dbKey) = $value -> status ${_kitchenStatus[i]}',
        );
      }
    }

    // Update Bedroom status
    for (int i = 0; i < bedroomControls.length; i++) {
      final dbKey = bedroomControls[i]['dbKey'] as String?;
      if (dbKey != null && _bedroomStatus[i] != 0) {
        final value = data[dbKey] as bool?;
        _bedroomStatus[i] = getStatus(value, _bedroomStatus[i]);
        print(
          '[DEBUG] Bedroom[$i] ($dbKey) = $value -> status ${_bedroomStatus[i]}',
        );
      }
    }

    // Update Welcome screen icons (door-lock, vdb, camera)
    for (int i = 0; i < welcomeIconDbKeys.length; i++) {
      final dbKey = welcomeIconDbKeys[i];
      final value = data[dbKey] as bool?;
      _welcomeIconStatus[i] = getStatus(value, _welcomeIconStatus[i]);
      print(
        '[DEBUG] Welcome icon[$i] ($dbKey) = $value -> status ${_welcomeIconStatus[i]}',
      );
    }
  }

  /// Update Firebase flag and sync all rooms with same dbKey
  Future<void> _updateFirebaseAndSync(String dbKey, bool newValue) async {
    print('[DEBUG] Updating Firebase: $dbKey = $newValue');

    try {
      // Update Firebase
      await _dbRef.child(dbKey).set(newValue);
      print('[DEBUG] Firebase updated successfully');

      // Sync all rooms that use this dbKey
      final newStatus = newValue ? 2 : 1; // true -> green, false -> red

      setState(() {
        // Sync Living Room
        for (int i = 0; i < livingRoomControls.length; i++) {
          if (livingRoomControls[i]['dbKey'] == dbKey &&
              _livingRoomStatus[i] != 0) {
            _livingRoomStatus[i] = newStatus;
            print('[DEBUG] Synced Living room[$i] to $newStatus');
          }
        }

        // Sync Kitchen
        for (int i = 0; i < kitchenControls.length; i++) {
          if (kitchenControls[i]['dbKey'] == dbKey && _kitchenStatus[i] != 0) {
            _kitchenStatus[i] = newStatus;
            print('[DEBUG] Synced Kitchen[$i] to $newStatus');
          }
        }

        // Sync Bedroom
        for (int i = 0; i < bedroomControls.length; i++) {
          if (bedroomControls[i]['dbKey'] == dbKey && _bedroomStatus[i] != 0) {
            _bedroomStatus[i] = newStatus;
            print('[DEBUG] Synced Bedroom[$i] to $newStatus');
          }
        }

        // Sync Welcome screen icons (door-lock, vdb, camera)
        for (int i = 0; i < welcomeIconDbKeys.length; i++) {
          if (welcomeIconDbKeys[i] == dbKey) {
            _welcomeIconStatus[i] = newStatus;
            print('[DEBUG] Synced Welcome icon[$i] to $newStatus');
          }
        }
      });
    } catch (e) {
      print('[ERROR] Failed to update Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
      '[DEBUG] VerticalHomeScreen build called - currentPage: $_currentPage, isLoading: $_isLoading',
    );

    // Show loading indicator while fetching Firebase data
    if (_isLoading) {
      return CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
            color: CupertinoTheme.of(context).primaryColor,
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          // Main page view
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              print('[DEBUG] Page changed to: $page');
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              // Screen 1: Welcome
              WelcomeScreenWidget(
                iconStatus: _welcomeIconStatus,
                onIconTap: _handleWelcomeIconTap,
                onIconLongPress: _handleWelcomeIconLongPress,
                activeUserName: _activeUserName,
                onProfileSelected: _handleProfileSelected,
              ),
              // Screen 2: Home Scenes & Spaces
              HomeScenesScreenWidget(
                selectedScene: _selectedHomeScene,
                isLoading: _isSceneLoading,
                onSceneSelected: _handleSceneSelected,
                onSpaceNavigate: _handleSpaceNavigate,
                onWashroomTap: _showWashroomAlert,
              ),
              // Screen 3: Living Room
              RoomControlScreenWidget(
                roomName: 'Living Room',
                roomImagePath: 'images/living_room_model.png',
                controlItems: livingRoomControls,
                statusList: _livingRoomStatus,
                onItemTap: _handleLivingRoomTap,
                onItemLongPress: _handleLivingRoomLongPress,
                onBackTap: () => _navigateToPage(1),
                gridItemCount: 9,
                isFireAlert: _isFireAlert,
                isWindowOpen: _isWindowOpen,
                fireSensorIndex: 7,
                windowSensorIndex: 6,
              ),
              // Screen 4: Kitchen
              RoomControlScreenWidget(
                roomName: 'Kitchen',
                roomImagePath: 'images/kitchen_model.png',
                controlItems: kitchenControls,
                statusList: _kitchenStatus,
                onItemTap: _handleKitchenTap,
                onItemLongPress: _handleKitchenLongPress,
                onBackTap: () => _navigateToPage(1),
                gridItemCount: 6,
                isFireAlert: _isFireAlert,
                isWindowOpen: _isWindowOpen,
                windowSensorIndex: 0,
              ),
              // Screen 5: Bedroom
              RoomControlScreenWidget(
                roomName: 'Bedroom',
                roomImagePath: 'images/bedroom_model.png',
                controlItems: bedroomControls,
                statusList: _bedroomStatus,
                onItemTap: _handleBedroomTap,
                onItemLongPress: _handleBedroomLongPress,
                onBackTap: () => _navigateToPage(1),
                gridItemCount: 6,
                showHomeButton: true,
                onHomeTap: () => _navigateToPage(0),
                isFireAlert: _isFireAlert,
                isWindowOpen: _isWindowOpen,
                fireSensorIndex: 1,
                windowSensorIndex: 0,
              ),
            ],
          ),
          // Page indicator
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: _buildPageIndicator(),
          ),
        ],
      ),
    );
  }

  /// Navigate to a specific page with animation
  void _navigateToPage(int page) {
    print('[DEBUG] Navigating to page: $page');
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // User profile presets for automation-flags
  static const Map<String, Map<String, dynamic>> _profilePresets = {
    'sd': {'light': true, 'party': true, 'fan': true, 'fan speed': 5},
    'deodatta': {
      'light': true,
      'light intensity': 255,
      'light-hex-value': '255, 0, 0',
      'party': false,
      'fan': true,
      'fan-speed': 1,
    },
    'parag': {
      'light': true,
      'light intensity': 255,
      'light-hex-value': '0, 255, 0',
      'party': false,
      'fan': false,
    },
    'jinay': {
      'light': true,
      'light intensity': 255,
      'light-hex-value': '0,0,255',
      'party': false,
      'fan': true,
      'fan-speed': 3,
    },
  };

  // Display names for profiles
  static const Map<String, String> _profileDisplayNames = {
    'sd': 'Sayali',
    'deodatta': 'Deodatta',
    'parag': 'Parag',
    'jinay': 'Jinay',
  };

  /// Handle profile selection from dropdown
  Future<void> _handleProfileSelected(String userName) async {
    final preset = _profilePresets[userName];
    if (preset == null) return;

    final displayName = _profileDisplayNames[userName] ?? userName;
    print('[DEBUG] Profile selected: $userName ($displayName)');

    // Show loader overlay
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (loaderContext) {
        return CupertinoAlertDialog(
          title: const Text('Setting Profile'),
          content: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(radius: 16),
                const SizedBox(height: 12),
                Text('Applying $displayName\'s preferences...'),
              ],
            ),
          ),
        );
      },
    );

    try {
      // Write all preset values to Firebase
      for (final entry in preset.entries) {
        await _dbRef.child(entry.key).set(entry.value);
      }
      print('[DEBUG] Profile preset written to Firebase for $userName');

      // Update active user
      setState(() {
        _activeUserName = userName;
      });

      // Write user profile name to Firebase /automation-flags/profile
      await _dbRef.child('profile').set(userName);

      // Ensure minimum 2 second delay
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      print('[ERROR] Failed to write profile preset: $e');
    }

    // Dismiss loader
    if (mounted) {
      Navigator.of(context).pop();
    }

    // Show success popup
    if (mounted) {
      showCupertinoDialog(
        context: context,
        builder: (successContext) {
          return CupertinoAlertDialog(
            title: const Text('Success'),
            content: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('$displayName\'s profile has been set successfully.'),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(successContext).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  /// Handle welcome screen icon tap with Firebase sync
  void _handleWelcomeIconTap(int index) {
    print('[DEBUG] Welcome icon $index tapped');

    // Skip grey items
    if (_welcomeIconStatus[index] == 0) return;

    final dbKey = welcomeIconDbKeys[index];
    // Current status: red(1) -> set to true, green(2) -> set to false
    final newValue = _welcomeIconStatus[index] == 1;
    _updateFirebaseAndSync(dbKey, newValue);
  }

  /// Handle welcome screen icon long press for navigation
  void _handleWelcomeIconLongPress(int index) {
    print(
      '[DEBUG] Welcome icon $index long pressed - navigating to detail screen',
    );

    // Navigate to the appropriate screen based on index
    // 0 = Door Lock, 1 = VDB, 2 = Camera
    Widget targetScreen;

    switch (index) {
      case 0:
        targetScreen = const DoorLockScreen();
        break;
      case 1:
        targetScreen = const VDBScreen();
        break;
      case 2:
        targetScreen = const CameraScreen();
        break;
      default:
        print('[ERROR] Invalid icon index for long press: $index');
        return;
    }

    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen));
  }

  /// Handle home scene selection with loading and success alert
  void _handleSceneSelected(int index) async {
    print('[DEBUG] Scene $index selected');

    // Scene names for the alert
    const sceneNames = [
      'Good Morning',
      'Good Night',
      'House Party',
      'Vaccation',
    ];

    // Preset values for each scene
    final List<Map<String, dynamic>> scenePresets = [
      // Good Morning
      {
        'light intensity': 150,
        'light-hex-value': '0,103,255',
        'camera': true,
        'door-lock': true,
        'bed-storage': true,
        'vdb': true,
        'light': true,
        'fan': true,
        'fan-speed': 3,
        'isFire': true,
        'is-window-open': true,
        'window-sensor': true,
        'party': false,
      },
      // Good Night
      {
        'light intensity': 50,
        'light-hex-value': '255,0,193',
        'camera': true,
        'door-lock': true,
        'bed-storage': false,
        'vdb': true,
        'light': true,
        'fan': true,
        'fan-speed': 4,
        'isFire': true,
        'is-window-open': true,
        'window-sensor': true,
        'party': false,
      },
      // House Party
      {
        'light intensity': 220,
        'light-hex-value': '255,0,193',
        'camera': true,
        'door-lock': false,
        'bed-storage': false,
        'vdb': false,
        'light': true,
        'fan': true,
        'fan-speed': 4,
        'isFire': true,
        'is-window-open': true,
        'window-sensor': true,
        'party': true,
      },
      // Vaccation
      {
        'light intensity': 0,
        'light-hex-value': '255,0,193',
        'camera': true,
        'door-lock': true,
        'bed-storage': false,
        'vdb': true,
        'light': false,
        'fan': false,
        'fan-speed': 1,
        'isFire': true,
        'is-window-open': true,
        'window-sensor': true,
        'party': false,
      },
    ];

    // Set loading state and selected scene
    setState(() {
      _selectedHomeScene = index;
      _isSceneLoading = true;
    });

    // Write preset values to Firebase
    try {
      final preset = scenePresets[index];
      for (final entry in preset.entries) {
        await _dbRef.child(entry.key).set(entry.value);
      }
      // Write scene name to /profile so that welcome screen shows "Mumbai Home"
      await _dbRef.child('profile').set(sceneNames[index]);
      print('[DEBUG] Scene $index preset values + profile written to Firebase');
    } catch (e) {
      print('[ERROR] Failed to write scene preset to Firebase: $e');
    }

    // Ensure minimum 2 seconds loading
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSceneLoading = false;
    });

    // Show success alert
    if (mounted) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return CupertinoAlertDialog(
            title: const Text('Success'),
            content: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${sceneNames[index]} scene has been set successfully.',
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  /// Handle home space navigation
  void _handleSpaceNavigate(int pageIndex) {
    print('[DEBUG] Space navigation to page: $pageIndex');
    _navigateToPage(pageIndex);
  }

  /// Show washroom not implemented alert
  void _showWashroomAlert() {
    print('[DEBUG] Showing washroom alert');
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Coming Soon'),
          content: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'The Washroom section has not been added yet. Stay tuned for future updates!',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show device offline alert for grey items
  void _showDeviceOfflineAlert(String deviceName) {
    print('[DEBUG] Showing offline alert for: $deviceName');
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Device Offline'),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '$deviceName is currently offline and cannot be controlled.',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Handle living room control tap with Firebase sync
  void _handleLivingRoomTap(int index) {
    print('[DEBUG] Living room item $index tapped');

    // Show alert for grey (offline) items
    if (_livingRoomStatus[index] == 0) {
      final deviceName = livingRoomControls[index]['label'] as String;
      _showDeviceOfflineAlert(deviceName);
      return;
    }

    final dbKey = livingRoomControls[index]['dbKey'] as String?;

    if (dbKey != null) {
      // Current status: red(1) -> set to true, green(2) -> set to false
      final newValue = _livingRoomStatus[index] == 1;
      _updateFirebaseAndSync(dbKey, newValue);
    } else {
      // No dbKey - just toggle locally
      setState(() {
        _livingRoomToggles[index] = !_livingRoomToggles[index];
        _livingRoomStatus[index] = _livingRoomStatus[index] == 1 ? 2 : 1;
      });
    }
  }

  /// Handle kitchen control tap with Firebase sync
  void _handleKitchenTap(int index) {
    print('[DEBUG] Kitchen item $index tapped');

    // Show alert for grey (offline) items
    if (_kitchenStatus[index] == 0) {
      final deviceName = kitchenControls[index]['label'] as String;
      _showDeviceOfflineAlert(deviceName);
      return;
    }

    final dbKey = kitchenControls[index]['dbKey'] as String?;

    if (dbKey != null) {
      final newValue = _kitchenStatus[index] == 1;
      _updateFirebaseAndSync(dbKey, newValue);
    } else {
      setState(() {
        _kitchenToggles[index] = !_kitchenToggles[index];
        _kitchenStatus[index] = _kitchenStatus[index] == 1 ? 2 : 1;
      });
    }
  }

  /// Handle bedroom control tap with Firebase sync
  void _handleBedroomTap(int index) {
    print('[DEBUG] Bedroom item $index tapped');

    // Show alert for grey (offline) items
    if (_bedroomStatus[index] == 0) {
      final deviceName = bedroomControls[index]['label'] as String;
      _showDeviceOfflineAlert(deviceName);
      return;
    }

    final dbKey = bedroomControls[index]['dbKey'] as String?;

    if (dbKey != null) {
      final newValue = _bedroomStatus[index] == 1;
      _updateFirebaseAndSync(dbKey, newValue);
    } else {
      setState(() {
        _bedroomToggles[index] = !_bedroomToggles[index];
        _bedroomStatus[index] = _bedroomStatus[index] == 1 ? 2 : 1;
      });
    }
  }

  /// Handle living room control long press for navigation
  void _handleLivingRoomLongPress(int index) {
    print(
      '[DEBUG] Living room item $index long pressed - navigating to detail screen',
    );

    // Navigate to the appropriate screen based on index
    // Index mapping in livingRoomControls:
    // 0=DoorLock, 1=VDB, 2=Camera, 3=Light, 4=Light(grey), 5=Fan, 6=WindowSensor, 7=FireSensor, 8=AC
    Widget? targetScreen;

    switch (index) {
      case 0: // Door Lock
        targetScreen = const DoorLockScreen();
        break;
      case 1: // VDB
        targetScreen = const VDBScreen();
        break;
      case 2: // Camera
        targetScreen = const CameraScreen();
        break;
      case 3: // Light (active)
        targetScreen = const LightControlScreen();
        break;
      case 5: // Fan
        targetScreen = const FanControlScreen();
        break;
      default:
        print('[DEBUG] No long press navigation for living room index: $index');
        return;
    }

    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));
  }

  /// Handle kitchen control long press for navigation
  void _handleKitchenLongPress(int index) {
    print(
      '[DEBUG] Kitchen item $index long pressed - navigating to detail screen',
    );

    // Navigate to the appropriate screen based on index
    // Index mapping in kitchenControls:
    // 0=WindowSensor, 1=GasSensor, 2=Chimney, 3=Fan, 4=Light(grey), 5=Light
    Widget? targetScreen;

    switch (index) {
      case 3: // Fan
        targetScreen = const FanControlScreen();
        break;
      case 5: // Light (active)
        targetScreen = const LightControlScreen();
        break;
      default:
        print('[DEBUG] No long press navigation for kitchen index: $index');
        return;
    }

    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));
  }

  /// Handle bedroom control long press for navigation
  void _handleBedroomLongPress(int index) {
    print(
      '[DEBUG] Bedroom item $index long pressed - navigating to detail screen',
    );

    // Navigate to the appropriate screen based on index
    // Index mapping in bedroomControls:
    // 0=WindowSensor, 1=FireSensor, 2=AC, 3=BedStorage, 4=Light, 5=Wardrobe
    Widget? targetScreen;

    switch (index) {
      case 3: // Bed Storage
        targetScreen = const BedStorageScreen();
        break;
      case 5: // Wardrobe
        targetScreen = const WardrobeScreen();
        break;
      default:
        print('[DEBUG] No long press navigation for bedroom index: $index');
        return;
    }

    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));
  }

  /// Build page indicator dots
  Widget _buildPageIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          final isActive = _currentPage == index;
          return GestureDetector(
            onTap: () => _navigateToPage(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 8,
                height: isActive ? 24 : 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? CupertinoTheme.of(context).primaryColor
                      : CupertinoColors.systemGrey3,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
