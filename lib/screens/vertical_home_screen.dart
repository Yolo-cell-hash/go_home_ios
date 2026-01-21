// vertical_home_screen.dart
// Main controller for the vertical home screen with snap scrolling
// Coordinates all screen components and manages state

import 'package:flutter/cupertino.dart';

// Import modular screen components
import 'vertical_home/welcome_screen.dart';
import 'vertical_home/home_scenes_screen.dart';
import 'vertical_home/room_control_screen.dart';

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

  // Status colors for icons: 0=grey, 1=red, 2=green
  // Welcome screen icons (3)
  late List<int> _welcomeIconStatus = [2, 1, 2]; // green, red, green
  // Living room icons (9)
  late List<int> _livingRoomStatus = [2, 1, 2, 1, 0, 2, 1, 2, 1];
  // Kitchen icons (6)
  late List<int> _kitchenStatus = [2, 1, 2, 1, 0, 2];
  // Bedroom icons (6)
  late List<int> _bedroomStatus = [1, 2, 1, 2, 0, 1];

  // Control items data for each room
  static const List<Map<String, dynamic>> livingRoomControls = [
    {'icon': 'images/door_lock.png', 'label': 'Door Lock'},
    {'icon': 'images/vdb.svg', 'label': 'VDB'},
    {'icon': 'images/camera.png', 'label': 'Camera'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
    {'icon': 'images/fan.png', 'label': 'Fan'},
    {'icon': 'images/window_sensor.png', 'label': 'Window'},
    {'icon': 'images/fire_sensor.png', 'label': 'Fire'},
    {'icon': 'images/ac.png', 'label': 'AC'},
  ];

  static const List<Map<String, dynamic>> kitchenControls = [
    {'icon': 'images/window_sensor.png', 'label': 'Window Sensor'},
    {'icon': 'images/gas_sensor.png', 'label': 'Gas Sensor'},
    {'icon': 'images/chimney.png', 'label': 'Chimney'},
    {'icon': 'images/fan.png', 'label': 'Fan'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
  ];

  static const List<Map<String, dynamic>> bedroomControls = [
    {'icon': 'images/window_sensor.png', 'label': 'Window Sensor'},
    {'icon': 'images/fire_sensor.png', 'label': 'Fire Sensor'},
    {'icon': 'images/ac.png', 'label': 'Air Conditioner'},
    {'icon': 'images/bed_storage.png', 'label': 'Bed Storage'},
    {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
    {'icon': 'images/wardrobe.png', 'label': 'Wardrobe'},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
      '[DEBUG] VerticalHomeScreen build called - currentPage: $_currentPage',
    );

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
              ),
              // Screen 2: Home Scenes & Spaces
              HomeScenesScreenWidget(
                selectedScene: _selectedHomeScene,
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

  /// Handle welcome screen icon tap
  void _handleWelcomeIconTap(int index) {
    print('[DEBUG] Welcome icon $index tapped');
    setState(() {
      _welcomeIconToggles[index] = !_welcomeIconToggles[index];
      // Toggle status between red(1) and green(2), keep grey(0) as is
      if (_welcomeIconStatus[index] != 0) {
        _welcomeIconStatus[index] = _welcomeIconStatus[index] == 1 ? 2 : 1;
      }
    });
  }

  /// Handle home scene selection
  void _handleSceneSelected(int index) {
    print('[DEBUG] Scene $index selected');
    setState(() {
      _selectedHomeScene = index;
    });
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

  /// Handle living room control tap
  void _handleLivingRoomTap(int index) {
    print('[DEBUG] Living room item $index tapped');
    setState(() {
      _livingRoomToggles[index] = !_livingRoomToggles[index];
      if (_livingRoomStatus[index] != 0) {
        _livingRoomStatus[index] = _livingRoomStatus[index] == 1 ? 2 : 1;
      }
    });
  }

  /// Handle kitchen control tap
  void _handleKitchenTap(int index) {
    print('[DEBUG] Kitchen item $index tapped');
    setState(() {
      _kitchenToggles[index] = !_kitchenToggles[index];
      if (_kitchenStatus[index] != 0) {
        _kitchenStatus[index] = _kitchenStatus[index] == 1 ? 2 : 1;
      }
    });
  }

  /// Handle bedroom control tap
  void _handleBedroomTap(int index) {
    print('[DEBUG] Bedroom item $index tapped');
    setState(() {
      _bedroomToggles[index] = !_bedroomToggles[index];
      if (_bedroomStatus[index] != 0) {
        _bedroomStatus[index] = _bedroomStatus[index] == 1 ? 2 : 1;
      }
    });
  }

  /// Build page indicator dots
  Widget _buildPageIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          final isActive = _currentPage == index;
          return Padding(
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
          );
        }),
      ),
    );
  }
}
