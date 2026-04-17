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
import 'package:godrej_home/services/preset_manager.dart';
import 'package:godrej_home/services/godrej_ac_api_service.dart';

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
import 'vertical_home/ac_control_screen.dart';

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

  // Firebase reference for presets (to fetch known users dynamically)
  final DatabaseReference _presetsRef = FirebaseDatabase.instance.ref(
    'presets',
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

  // Known users fetched dynamically from Firebase /presets
  Set<String> _knownUsers = {};

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
    1,
  ]; // AC starts as red (off), Firebase will update

  // Kitchen icons (6)
  // Index: 0=WindowSensor, 1=GasSensor, 2=Chimney, 3=Fan, 4=Light(grey), 5=Light
  late List<int> _kitchenStatus = [2, 1, 0, 1, 0, 2]; // Chimney greyed out

  // Bedroom icons (6)
  // Index: 0=WindowSensor, 1=FireSensor, 2=AC, 3=BedStorage, 4=Light(grey), 5=Wardrobe
  late List<int> _bedroomStatus = [
    1,
    2,
    1,
    2,
    0,
    0,
  ]; // AC starts as red (off), Firebase will update; Wardrobe greyed out

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
    {'icon': 'images/ac.png', 'label': 'Air Conditioner', 'dbKey': 'ac'},
  ];

  static const List<Map<String, dynamic>> kitchenControls = [
    {
      'icon': 'images/window_sensor.png',
      'label': 'Window Sensor',
      'dbKey': 'window-sensor',
    },
    {'icon': 'images/gas_sensor.png', 'label': 'Gas Sensor', 'dbKey': 'fire-sensor'},
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
    {'icon': 'images/ac.png', 'label': 'Air Conditioner', 'dbKey': 'ac'},
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
    PresetManager.initDefaults(); // Ensure scene presets exist in SharedPreferences
    _fetchKnownUsers(); // Fetch known users from /presets before profile listener
    _fetchFirebaseState();
    _setupFirebaseListener();
    _setupProfileListener();
    // Initialize Godrej AC API service (login + auto token refresh)
    GodrejAcApiService.instance.init();
    // NOTE: BLE is intentionally NOT initialized here
    // BLE initialization happens in BedStorageScreen when user navigates there
  }

  /// Fetch known user names dynamically from Firebase /presets (updates state)
  /// Each child key under /presets is treated as a known username
  Future<void> _fetchKnownUsers() async {
    print('[DEBUG] Fetching known users from /presets...');
    try {
      final snapshot = await _presetsRef.get();
      if (snapshot.exists && snapshot.value is Map) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        setState(() {
          _knownUsers = data.keys
              .map((k) => k.toString().toLowerCase())
              .toSet();
        });
        print('[DEBUG] Known users fetched from /presets: $_knownUsers');
      } else {
        print('[DEBUG] No presets found in Firebase');
      }
    } catch (e) {
      print('[ERROR] Failed to fetch known users from /presets: $e');
    }
  }

  /// Fetch and return the latest set of user keys from Firebase /presets.
  /// Called on-demand by the profile dropdown whenever it opens.
  Future<Set<String>> _refreshKnownUsers() async {
    print('[DEBUG] Refreshing known users from /presets (on-demand)...');
    try {
      final snapshot = await _presetsRef.get();
      if (snapshot.exists && snapshot.value is Map) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final fresh = data.keys.map((k) => k.toString().toLowerCase()).toSet();
        // Also update local state so the profile listener stays in sync
        if (mounted) {
          setState(() => _knownUsers = fresh);
        }
        print('[DEBUG] Known users refreshed: $fresh');
        return fresh;
      }
    } catch (e) {
      print('[ERROR] Failed to refresh known users: $e');
    }
    return _knownUsers; // fallback to cached
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
    GodrejAcApiService.instance.dispose();
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
                knownUsers: _knownUsers,
                onRefreshUsers: _refreshKnownUsers,
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

  // Cached user preset fetched from Firebase /presets/{user} on profile selection.
  // Used by _handleToggleWithSceneCheck to detect overrides.
  Map<String, dynamic>? _activeUserPreset;

  /// Reload the active user/scene preset from Firebase/SharedPreferences.
  /// Called after returning from any sub-screen so that the home screen's
  /// toggle override detection uses the latest preset values (including any
  /// modifications the user saved in the sub-screen).
  Future<void> _reloadActivePreset() async {
    if (_activeUserName != null) {
      // Reload user preset from Firebase /presets/{user}
      try {
        final presetSnapshot =
            await _presetsRef.child(_activeUserName!).get();
        if (presetSnapshot.exists && presetSnapshot.value is Map) {
          _activeUserPreset =
              Map<String, dynamic>.from(presetSnapshot.value as Map);
          print('[DEBUG] Reloaded user preset for $_activeUserName: '
              '$_activeUserPreset');
        }
      } catch (e) {
        print('[ERROR] Failed to reload user preset: $e');
      }
    } else if (_selectedHomeScene >= 0) {
      // Scene presets live in SharedPreferences — reload in case
      // the sub-screen updated them via PresetManager
      print('[DEBUG] Reloaded scene preset $_selectedHomeScene');
    }
  }

  /// Handle profile selection from dropdown.
  /// Fetches preset purely from Firebase /presets/{userName} and writes to
  /// /automation-flags. Caches the fetched preset in _activeUserPreset for
  /// override detection on subsequent manual toggles.
  Future<void> _handleProfileSelected(String userName) async {
    // Capitalize display name (title-case)
    final displayName = userName.isNotEmpty
        ? userName[0].toUpperCase() + userName.substring(1).toLowerCase()
        : userName;
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
      // Fetch preset data from Firebase /presets/{userName}
      Map<String, dynamic>? preset;
      try {
        final presetSnapshot = await _presetsRef.child(userName).get();
        if (presetSnapshot.exists && presetSnapshot.value is Map) {
          preset = Map<String, dynamic>.from(presetSnapshot.value as Map);
          print(
            '[DEBUG] Preset fetched from Firebase /presets/$userName: $preset',
          );
        }
      } catch (e) {
        print('[ERROR] Failed to fetch preset from /presets/$userName: $e');
      }

      if (preset != null) {
        // Cache the preset for override detection on manual toggles
        _activeUserPreset = Map<String, dynamic>.from(preset);

        // Write all preset values to Firebase automation-flags
        for (final entry in preset.entries) {
          await _dbRef.child(entry.key).set(entry.value);
        }
        print('[DEBUG] Profile preset written to Firebase for $userName');

        // Sync AC-specific params to the Godrej AC cloud API (runs in background)
        _syncAcPresetToApi(preset);
      } else {
        _activeUserPreset = null;
        print('[WARN] No preset found for $userName — nothing written');
      }

      // Update active user
      setState(() {
        _activeUserName = userName;
        _selectedHomeScene = -1; // Clear scene selection
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

  /// Map Firebase preset keys → Godrej AC API param names.
  /// Only sends params that exist in the preset map.
  static const Map<String, String> _firebaseToAcApiKey = {
    'ac': 'Power',
    'ac-temp': 'Temperature',
    'ac-mode': 'Mode',
    'ac-fan-speed': 'Fan Speed',
  };

  /// Sync AC-related preset values to the Godrej AC cloud API.
  /// Sends one PUT per parameter sequentially (API limitation).
  /// If ac == false in the preset, only sends Power=false and skips
  /// temperature/mode/fan-speed to avoid briefly turning the AC on.
  Future<void> _syncAcPresetToApi(Map<String, dynamic> preset) async {
    final api = GodrejAcApiService.instance;
    final acPower = preset['ac'];

    if (acPower == false) {
      // AC should be OFF — only send the power-off command, skip everything else
      print('[DEBUG] AC preset is OFF — sending Power=false only');
      await api.setAcParam('Power', false);
      print('[DEBUG] AC API sync complete (power off only)');
      return;
    }

    // AC is ON — send all AC params sequentially
    for (final entry in _firebaseToAcApiKey.entries) {
      final fbKey = entry.key;
      final apiKey = entry.value;
      if (preset.containsKey(fbKey)) {
        final value = preset[fbKey];
        print('[DEBUG] Syncing AC API: $apiKey = $value');
        await api.setAcParam(apiKey, value);
      }
    }
    print('[DEBUG] AC API sync complete');
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

  /// Handle home scene selection with loading and success alert.
  /// Loads preset values from SharedPreferences (via PresetManager) instead
  /// of hardcoded maps, so user customisations are preserved across sessions.
  void _handleSceneSelected(int index) async {
    print('[DEBUG] Scene $index selected');

    // Set loading state and selected scene
    setState(() {
      _selectedHomeScene = index;
      _isSceneLoading = true;
    });

    // Read preset from SharedPreferences
    try {
      final preset = await PresetManager.getPreset(index);
      for (final entry in preset.entries) {
        await _dbRef.child(entry.key).set(entry.value);
      }
      // Write scene name to /profile so that welcome screen shows "Mumbai Home"
      await _dbRef.child('profile').set(PresetManager.sceneNames[index]);

      // Sync AC-specific params to the Godrej AC cloud API (runs in background)
      _syncAcPresetToApi(preset);

      // Toggle survailanceModeEnabled in /dev_env/ based on scene
      final devEnvRef = FirebaseDatabase.instance.ref('dev_env');
      if (index == 3) {
        // Vacation mode → enable surveillance
        await devEnvRef.child('survailanceModeEnabled').set(true);
        print('[DEBUG] survailanceModeEnabled set to true (Vacation mode)');
      } else {
        // Any other scene → disable surveillance
        await devEnvRef.child('survailanceModeEnabled').set(false);
        print(
          '[DEBUG] survailanceModeEnabled set to false (non-Vacation mode)',
        );
      }

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
                '${PresetManager.sceneNames[index]} scene has been set successfully.',
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

  /// Handle a device toggle from a room control grid.
  /// Checks both scene presets (SharedPreferences) and user profile presets
  /// (Firebase /presets/{user}). Shows an override dialog when the new value
  /// differs from whichever preset is currently active.
  Future<void> _handleToggleWithSceneCheck(
    String dbKey,
    bool newValue,
    String deviceName,
  ) async {
    // ── Case 1: A scene preset is active ──
    if (_selectedHomeScene >= 0) {
      try {
        final preset = await PresetManager.getPreset(_selectedHomeScene);
        final presetValue = preset[dbKey];

        if (presetValue != null && presetValue != newValue) {
          // Value differs from scene preset — show dialog
          if (mounted) {
            _showPresetOverrideDialog(
              dbKey, newValue, deviceName,
              isUserProfile: false,
            );
          }
          return;
        }
      } catch (e) {
        print('[ERROR] Scene check failed: $e');
      }
      // Key not in preset or values match — toggle directly
      _updateFirebaseAndSync(dbKey, newValue);
      return;
    }

    // ── Case 2: A user profile preset is active ──
    if (_activeUserName != null && _activeUserPreset != null) {
      final presetValue = _activeUserPreset![dbKey];
      if (presetValue != null && presetValue != newValue) {
        if (mounted) {
          _showPresetOverrideDialog(
            dbKey, newValue, deviceName,
            isUserProfile: true,
          );
        }
        return;
      }
      // Key not in preset or values match — toggle directly
      _updateFirebaseAndSync(dbKey, newValue);
      return;
    }

    // ── No preset active — just toggle ──
    _updateFirebaseAndSync(dbKey, newValue);
  }

  /// Show dialog asking user whether to apply the toggle once or update
  /// the active preset permanently.
  ///
  /// [isUserProfile] — when true, "Update My Preset" writes to Firebase
  /// `/presets/{user}`. When false, it writes to SharedPreferences (scene).
  void _showPresetOverrideDialog(
    String dbKey,
    bool newValue,
    String deviceName, {
    required bool isUserProfile,
  }) {
    final presetLabel = isUserProfile
        ? (_activeUserName != null
            ? _activeUserName![0].toUpperCase() +
                _activeUserName!.substring(1).toLowerCase()
            : 'User')
        : PresetManager.sceneNames[_selectedHomeScene];

    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: const Text('Override Preset?'),
          content: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'You are changing "$deviceName" which differs from your '
              '"$presetLabel" preset.\n\n'
              'Would you like to apply this change once, or update your '
              '"$presetLabel" preset so it remembers this setting?',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                // Only update Firebase — preset stays unchanged
                _updateFirebaseAndSync(dbKey, newValue);
                print(
                  '[DEBUG] Override: once-only for $dbKey = $newValue',
                );
              },
              child: const Text('Set for Once'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                // Update Firebase /automation-flags
                _updateFirebaseAndSync(dbKey, newValue);

                if (isUserProfile && _activeUserName != null) {
                  // Update Firebase /presets/{user}
                  try {
                    await _presetsRef
                        .child(_activeUserName!)
                        .child(dbKey)
                        .set(newValue);
                    // Also update local cache
                    _activeUserPreset?[dbKey] = newValue;
                    print(
                      '[DEBUG] Override: user preset updated '
                      '/presets/$_activeUserName/$dbKey = $newValue',
                    );
                  } catch (e) {
                    print('[ERROR] Failed to update user preset: $e');
                  }
                } else {
                  // Update SharedPreferences (scene preset)
                  await PresetManager.updatePresetValue(
                    _selectedHomeScene,
                    dbKey,
                    newValue,
                  );
                  print(
                    '[DEBUG] Override: scene preset updated for $dbKey = $newValue',
                  );
                }

                if (mounted) {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                      title: const Text('Preset Updated'),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '"$presetLabel" preset has been updated with the '
                          'new $deviceName setting.',
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Update My Preset'),
            ),
          ],
        );
      },
    );
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
      final deviceName = livingRoomControls[index]['label'] as String;
      _handleToggleWithSceneCheck(dbKey, newValue, deviceName);
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
      final deviceName = kitchenControls[index]['label'] as String;
      _handleToggleWithSceneCheck(dbKey, newValue, deviceName);
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
      final deviceName = bedroomControls[index]['label'] as String;
      _handleToggleWithSceneCheck(dbKey, newValue, deviceName);
    } else {
      setState(() {
        _bedroomToggles[index] = !_bedroomToggles[index];
        _bedroomStatus[index] = _bedroomStatus[index] == 1 ? 2 : 1;
      });
    }
  }

  /// Handle living room control long press for navigation
  void _handleLivingRoomLongPress(int index) async {
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
      case 8: // Air Conditioner
        targetScreen = const AcControlScreen();
        break;
      default:
        print('[DEBUG] No long press navigation for living room index: $index');
        return;
    }

    await Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));

    // Reload preset after returning — sub-screen may have saved changes
    _reloadActivePreset();
  }

  /// Handle kitchen control long press for navigation
  void _handleKitchenLongPress(int index) async {
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

    await Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));

    // Reload preset after returning — sub-screen may have saved changes
    _reloadActivePreset();
  }

  /// Handle bedroom control long press for navigation
  void _handleBedroomLongPress(int index) async {
    print(
      '[DEBUG] Bedroom item $index long pressed - navigating to detail screen',
    );

    // Navigate to the appropriate screen based on index
    // Index mapping in bedroomControls:
    // 0=WindowSensor, 1=FireSensor, 2=AC, 3=BedStorage, 4=Light, 5=Wardrobe
    Widget? targetScreen;

    switch (index) {
      case 2: // Air Conditioner
        targetScreen = const AcControlScreen();
        break;
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

    await Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => targetScreen!));

    // Reload preset after returning — sub-screen may have saved changes
    _reloadActivePreset();
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
