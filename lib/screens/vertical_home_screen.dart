import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerticalHomeScreen extends StatefulWidget {
  const VerticalHomeScreen({super.key});

  @override
  State<VerticalHomeScreen> createState() => _VerticalHomeScreenState();
}

class _VerticalHomeScreenState extends State<VerticalHomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Toggle states for living room controls (3x3 = 9 buttons)
  List<bool> _livingRoomToggles = List.generate(9, (index) => false);

  // Toggle states for kitchen controls (3x2 = 6 buttons)
  List<bool> _kitchenToggles = List.generate(6, (index) => false);

  // Toggle states for bedroom controls (3x2 = 6 buttons)
  List<bool> _bedroomToggles = List.generate(6, (index) => false);

  // Toggle states for welcome screen icons (Door Lock, VDB, Camera)
  List<bool> _welcomeIconToggles = List.generate(3, (index) => false);

  // Status colors for icons: 0=grey, 1=red, 2=green
  // Welcome screen icons (3)
  late List<int> _welcomeIconStatus = [2, 1, 2]; // green, red, green
  // Living room icons (9)
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
  ]; // mostly red/green, one grey
  // Kitchen icons (6)
  late List<int> _kitchenStatus = [
    2,
    1,
    2,
    1,
    2,
    0,
  ]; // mostly red/green, one grey
  // Bedroom icons (6)
  late List<int> _bedroomStatus = [1, 2, 1, 2, 1, 2]; // alternating red/green
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Stack(
        children: [
          // Vertical PageView with snap behavior
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,

            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildWelcomeScreen(context),
              _buildFeaturesScreen(context),
              _buildGalleryScreen(context),
              _buildAboutScreen(context),
              _buildContactScreen(context),
            ],
          ),
          // Page indicator
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(child: _buildPageIndicator()),
          ),
        ],
      ),
    );
  }

  // Page indicator showing current screen
  Widget _buildPageIndicator() {
    return Builder(
      builder: (context) {
        final primaryColor = CupertinoTheme.of(context).primaryColor;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: 8,
              height: _currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? primaryColor
                    : CupertinoColors.systemGrey3,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }

  // Screen 1: Welcome Screen
  Widget _buildWelcomeScreen(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Navbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/new_main_logo.png', height: 75),
                  Row(
                    children: [
                      Text(
                        'Mumbai Home',
                        style: TextStyle(
                          fontFamily: 'GEG',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1.5),
                        ),
                        child: Icon(
                          CupertinoIcons.chevron_down,
                          size: 14,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Content - Backdrop image with fade blur and status text
            Expanded(
              child: Stack(
                children: [
                  // Background image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/backdrop.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 550,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            CupertinoColors.systemBackground.withOpacity(0.0),
                            CupertinoColors.systemBackground.withOpacity(0.2),
                            CupertinoColors.systemBackground.withOpacity(0.9),
                            CupertinoColors.systemBackground.withOpacity(1.0),
                            CupertinoColors.systemBackground.withOpacity(1.0),
                          ],
                          stops: const [0.0, 0.3, 0.6, 0.75, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Status text with icons
                  Positioned(
                    bottom: 70,
                    left: 70,
                    right: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Status text on the left
                        Expanded(
                          child: Text(
                            'Security System is Armed Away.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'GEG',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: primaryColor,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        // Three icons with borders on the right
                        Row(
                          children: [
                            // Door Lock icon
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _welcomeIconToggles[0] =
                                      !_welcomeIconToggles[0];
                                  // Toggle status between red(1) and green(2), keep grey(0) as is
                                  if (_welcomeIconStatus[0] != 0) {
                                    _welcomeIconStatus[0] =
                                        _welcomeIconStatus[0] == 1 ? 2 : 1;
                                  }
                                });
                              },
                              child: Container(
                                width: 102,
                                height: 102,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _getStatusColor(
                                      _welcomeIconStatus[0],
                                    ),
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _welcomeIconStatus[0] == 2
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: _welcomeIconStatus[0] == 2
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'images/door_lock.png',
                                      width: 38,
                                      height: 38,
                                      color: primaryColor,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            // VDB icon
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _welcomeIconToggles[1] =
                                      !_welcomeIconToggles[1];
                                  // Toggle status between red(1) and green(2), keep grey(0) as is
                                  if (_welcomeIconStatus[1] != 0) {
                                    _welcomeIconStatus[1] =
                                        _welcomeIconStatus[1] == 1 ? 2 : 1;
                                  }
                                });
                              },
                              child: Container(
                                width: 102,
                                height: 102,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _getStatusColor(
                                      _welcomeIconStatus[1],
                                    ),
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _welcomeIconStatus[1] == 2
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: _welcomeIconStatus[1] == 2
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'images/vdb.svg',
                                      width: 28,
                                      height: 28,
                                      fit: BoxFit.contain,
                                      allowDrawingOutsideViewBox: true,
                                      colorFilter: ColorFilter.mode(
                                        primaryColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            // Camera icon
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _welcomeIconToggles[2] =
                                      !_welcomeIconToggles[2];
                                  // Toggle status between red(1) and green(2), keep grey(0) as is
                                  if (_welcomeIconStatus[2] != 0) {
                                    _welcomeIconStatus[2] =
                                        _welcomeIconStatus[2] == 1 ? 2 : 1;
                                  }
                                });
                              },
                              child: Container(
                                width: 102,
                                height: 102,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _getStatusColor(
                                      _welcomeIconStatus[2],
                                    ),
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _welcomeIconStatus[2] == 2
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: _welcomeIconStatus[2] == 2
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'images/camera.png',
                                      width: 38,
                                      height: 38,
                                      color: primaryColor,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Screen 2: Features Screen
  Widget _buildFeaturesScreen(BuildContext context) {
    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Features',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildFeatureCard(
                      CupertinoIcons.device_phone_portrait,
                      'Responsive',
                      'Optimized for iPad',
                      CupertinoColors.systemBlue,
                    ),
                    _buildFeatureCard(
                      CupertinoIcons.square_stack_3d_down_right,
                      'Snap Scrolling',
                      'Smooth page transitions',
                      CupertinoColors.systemGreen,
                    ),
                    _buildFeatureCard(
                      CupertinoIcons.speedometer,
                      'Performance',
                      'Native iOS components',
                      CupertinoColors.systemOrange,
                    ),
                    _buildFeatureCard(
                      CupertinoIcons.paintbrush,
                      'Beautiful Design',
                      'Modern UI aesthetics',
                      CupertinoColors.systemPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Screen 3: Living Room Screen
  Widget _buildGalleryScreen(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    // Control items for the 3x3 grid with labels
    // Each item is a Map with 'icon' (IconData or String path) and 'label' (String)
    final List<Map<String, dynamic>> controlItems = [
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

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Back button - navigates to second slide (Features)
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor, width: 1.5),
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Text(
                    'Living Room',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                      fontFamily: 'GEG',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Row(
                  children: [
                    // Left zone - Centered image with blast background
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Blast background image
                            Image.asset(
                              'images/blast.png',
                              fit: BoxFit.contain,
                            ),
                            // Living room model on top
                            Image.asset(
                              'images/living_room_model.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Right zone - 3x3 grid of toggle buttons
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          width: 442,
                          height: 600,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              final isGreen = _livingRoomStatus[index] == 2;
                              final item = controlItems[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _livingRoomToggles[index] =
                                        !_livingRoomToggles[index];
                                    // Toggle status between red(1) and green(2), keep grey(0) as is
                                    if (_livingRoomStatus[index] != 0) {
                                      _livingRoomStatus[index] =
                                          _livingRoomStatus[index] == 1 ? 2 : 1;
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: _getStatusColor(
                                              _livingRoomStatus[index],
                                            ),
                                            width: 2,
                                          ),
                                        ),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isGreen
                                                ? primaryColor.withOpacity(0.15)
                                                : CupertinoColors.systemGrey5,
                                            border: Border.all(
                                              color: isGreen
                                                  ? primaryColor
                                                  : CupertinoColors.systemGrey3,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: _buildControlItem(
                                              item['icon'],
                                              isGreen,
                                              primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        item['label'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isGreen
                                              ? primaryColor
                                              : CupertinoColors.systemGrey,
                                          fontFamily: 'GEG',
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to render either icon or custom image (PNG/SVG)
  Widget _buildControlItem(dynamic item, bool isEnabled, Color primaryColor) {
    if (item is IconData) {
      // Render as icon
      return Icon(
        item,
        size: 28,
        color: isEnabled ? primaryColor : CupertinoColors.systemGrey,
      );
    } else if (item is String) {
      // Check if it's an SVG file
      if (item.toLowerCase().endsWith('.svg')) {
        // Render as SVG
        return SvgPicture.asset(
          item,
          width: 28,
          height: 28,
          fit: BoxFit.contain,
          allowDrawingOutsideViewBox: true,
          colorFilter: ColorFilter.mode(
            isEnabled ? primaryColor : CupertinoColors.systemGrey,
            BlendMode.srcIn,
          ),
        );
      } else {
        // Render as regular image (PNG, JPG, etc.)
        return Image.asset(
          item,
          width: 38,
          height: 38,
          color: isEnabled ? primaryColor : CupertinoColors.systemGrey,
          fit: BoxFit.contain,
        );
      }
    }
    // Fallback to empty container if type is unknown
    return const SizedBox.shrink();
  }

  // Helper method to get status color
  // 0 = grey, 1 = red, 2 = green
  Color _getStatusColor(int status) {
    switch (status) {
      case 0:
        return CupertinoColors.systemGrey;
      case 1:
        return CupertinoColors.systemRed;
      case 2:
        return CupertinoColors.systemGreen;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  // Screen 4: Kitchen Screen
  Widget _buildAboutScreen(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    // Control items for the 3x2 grid with labels
    final List<Map<String, dynamic>> kitchenControlItems = [
      {'icon': 'images/window_sensor.png', 'label': 'Window'},
      {'icon': 'images/gas_sensor.png', 'label': 'Gas Sensor'},
      {'icon': 'images/chimney.png', 'label': 'Chimney'},
      {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
      {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
      {'icon': 'images/fan.png', 'label': 'Fan'},
    ];

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Back button - navigates to Living Room (page 2)
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor, width: 1.5),
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Text(
                    'Kitchen',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                      fontFamily: 'GEG',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Row(
                  children: [
                    // Left zone - Centered image with blast background
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'images/blast.png',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'images/kitchen_model.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Right zone - 3x2 grid of toggle buttons
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          width: 442,
                          height: 380,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final isGreen = _kitchenStatus[index] == 2;
                              final item = kitchenControlItems[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _kitchenToggles[index] =
                                        !_kitchenToggles[index];
                                    // Toggle status between red(1) and green(2), keep grey(0) as is
                                    if (_kitchenStatus[index] != 0) {
                                      _kitchenStatus[index] =
                                          _kitchenStatus[index] == 1 ? 2 : 1;
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: _getStatusColor(
                                              _kitchenStatus[index],
                                            ),
                                            width: 2,
                                          ),
                                        ),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isGreen
                                                ? primaryColor.withOpacity(0.15)
                                                : CupertinoColors.systemGrey5,
                                            border: Border.all(
                                              color: isGreen
                                                  ? primaryColor
                                                  : CupertinoColors.systemGrey3,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: _buildControlItem(
                                              item['icon'],
                                              isGreen,
                                              primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        item['label'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isGreen
                                              ? primaryColor
                                              : CupertinoColors.systemGrey,
                                          fontFamily: 'GEG',
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Screen 5: Bedroom Screen
  Widget _buildContactScreen(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    // Control items for the 3x2 grid with labels
    final List<Map<String, dynamic>> bedroomControlItems = [
      {'icon': 'images/window_sensor.png', 'label': 'Window'},
      {'icon': 'images/fire_sensor.png', 'label': 'Fire'},
      {'icon': 'images/ac.png', 'label': 'AC'},
      {'icon': CupertinoIcons.bed_double, 'label': 'Bed'},
      {'icon': 'images/window_sensor.png', 'label': 'Window'},
      {'icon': CupertinoIcons.lightbulb, 'label': 'Light'},
    ];

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Back button - navigates to Living Room (page 2)
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor, width: 1.5),
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Text(
                    'Bedroom',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                      fontFamily: 'GEG',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Row(
                  children: [
                    // Left zone - Centered image with blast background
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'images/blast.png',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'images/bedroom_model.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Right zone - 3x2 grid of toggle buttons
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          width: 442,
                          height: 380,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final isGreen = _bedroomStatus[index] == 2;
                              final item = bedroomControlItems[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _bedroomToggles[index] =
                                        !_bedroomToggles[index];
                                    // Toggle status between red(1) and green(2), keep grey(0) as is
                                    if (_bedroomStatus[index] != 0) {
                                      _bedroomStatus[index] =
                                          _bedroomStatus[index] == 1 ? 2 : 1;
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: _getStatusColor(
                                              _bedroomStatus[index],
                                            ),
                                            width: 2,
                                          ),
                                        ),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isGreen
                                                ? primaryColor.withOpacity(0.15)
                                                : CupertinoColors.systemGrey5,
                                            border: Border.all(
                                              color: isGreen
                                                  ? primaryColor
                                                  : CupertinoColors.systemGrey3,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: _buildControlItem(
                                              item['icon'],
                                              isGreen,
                                              primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        item['label'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isGreen
                                              ? primaryColor
                                              : CupertinoColors.systemGrey,
                                          fontFamily: 'GEG',
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Home button at the bottom center
              Center(
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor, width: 1.5),
                    ),
                    child: Icon(
                      CupertinoIcons.home,
                      size: 24,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
