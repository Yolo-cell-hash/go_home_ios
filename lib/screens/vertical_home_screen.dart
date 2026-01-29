// vertical_home_screen.dart
// Main controller for the vertical home screen with snap scrolling
// Coordinates all screen components and manages state
// Integrates with Firebase Realtime Database for automation flags

import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

// Import modular screen components
import 'vertical_home/welcome_screen.dart';
import 'vertical_home/home_scenes_screen.dart';
import 'vertical_home/room_control_screen.dart';
import 'vertical_home/door_lock_screen.dart';
import 'vertical_home/vdb_screen.dart';
import 'vertical_home/camera_screen.dart';
import 'vertical_home/bed_storage_screen.dart';
import 'vertical_home/wardrobe_screen.dart';

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

  // Flag to track if initial data has been loaded
  bool _isLoading = true;

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
  late List<int> _livingRoomStatus = [2, 1, 2, 1, 0, 2, 1, 2, 1];

  // Kitchen icons (6)
  // Index: 0=WindowSensor, 1=GasSensor, 2=Chimney, 3=Fan, 4=Light(grey), 5=Light
  late List<int> _kitchenStatus = [2, 1, 2, 1, 0, 2];

  // Bedroom icons (6)
  // Index: 0=WindowSensor, 1=FireSensor, 2=AC, 3=BedStorage, 4=Light(grey), 5=Wardrobe
  late List<int> _bedroomStatus = [1, 2, 1, 2, 0, 1];

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
      'dbKey': 'air-conditioner',
    },
  ];

  static const List<Map<String, dynamic>> kitchenControls = [
    {
      'icon': 'images/window_sensor.png',
      'label': 'Window Sensor',
      'dbKey': 'window-sensor',
    },
    {'icon': 'images/gas_sensor.png', 'label': 'Gas Sensor', 'dbKey': null},
    {'icon': 'images/chimney.png', 'label': 'Chimney', 'dbKey': 'chimney'},
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
      'dbKey': 'air-conditioner',
    },
    {
      'icon': 'images/bed_storage.png',
      'label': 'Bed Storage',
      'dbKey': 'bed-storage',
    },
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light', 'dbKey': null}, // grey
    {'icon': 'images/wardrobe.png', 'label': 'Wardrobe', 'dbKey': 'wardrobe'},
  ];

  @override
  void initState() {
    super.initState();
    print('[DEBUG] VerticalHomeScreen initState - fetching Firebase data');
    _fetchFirebaseState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                onBackTap: () => _navigateToPage(1),
                gridItemCount: 9,
              ),
              // Screen 4: Kitchen
              RoomControlScreenWidget(
                roomName: 'Kitchen',
                roomImagePath: 'images/kitchen_model.png',
                controlItems: kitchenControls,
                statusList: _kitchenStatus,
                onItemTap: _handleKitchenTap,
                onBackTap: () => _navigateToPage(1),
                gridItemCount: 6,
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

    // Set loading state and selected scene
    setState(() {
      _selectedHomeScene = index;
      _isSceneLoading = true;
    });

    // Show loading for 2 seconds
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
