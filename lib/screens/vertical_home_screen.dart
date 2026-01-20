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
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            CupertinoColors.systemBackground.withOpacity(0.0),
                            CupertinoColors.systemBackground.withOpacity(0.85),
                            CupertinoColors.systemBackground.withOpacity(1.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Status text
                  Positioned(
                    bottom: 70,
                    left: 70,
                    right: 20,
                    child: Text(
                      'Security System is armed away. All Doors Are Locked. All Gates Are Locked',
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

    // Control items for the 3x3 grid - can be icons or image paths
    // To use an icon: provide IconData
    // To use a custom image: provide the path as a String (e.g., 'images/my_icon.png')
    // Note: SVGs with embedded bitmaps don't work with flutter_svg, use PNG instead
    final List<dynamic> controlItems = [
      'images/door_lock.png', // Door lock - needs vector SVG or PNG
      'images/vdb.svg', // VDB (vector SVG - works)
      'images/camera.png', // Camera (PNG version)
      CupertinoIcons.lightbulb, // Icon
      CupertinoIcons.lightbulb, // Icon
      'images/fan.png', // Fan - needs vector SVG or PNG
      'images/window_sensor.png', // Icon
      'images/fire_sensor.png', // Icon
      'images/ac.png', // AC (PNG version)
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
                          height: 442,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 80,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 1,
                                ),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              final isEnabled = _livingRoomToggles[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _livingRoomToggles[index] =
                                        !_livingRoomToggles[index];
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isEnabled
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: isEnabled
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: _buildControlItem(
                                      controlItems[index],
                                      isEnabled,
                                      primaryColor,
                                    ),
                                  ),
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

  // Screen 4: Kitchen Screen
  Widget _buildAboutScreen(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    // Control items for the 3x2 grid
    final List<dynamic> kitchenControlItems = [
      'images/window_sensor.png',
      'images/gas_sensor.png',
      'images/chimney.png',
      CupertinoIcons.lightbulb,
      CupertinoIcons.lightbulb,
      'images/fan.png',
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
                        2,
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
                          height: 268, // 2 rows: (94 * 2) + 80
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 80,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 1,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final isEnabled = _kitchenToggles[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _kitchenToggles[index] =
                                        !_kitchenToggles[index];
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isEnabled
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: isEnabled
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: _buildControlItem(
                                      kitchenControlItems[index],
                                      isEnabled,
                                      primaryColor,
                                    ),
                                  ),
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

    // Control items for the 3x2 grid
    final List<dynamic> bedroomControlItems = [
      'images/window_sensor.png',
      'images/fire_sensor.png',
      'images/ac.png',
      CupertinoIcons.bed_double,
      'images/window_sensor.png',
      CupertinoIcons.lightbulb,
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
                  // Back button - navigates to Kitchen (page 3)
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        3,
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
                          height: 268, // 2 rows: (94 * 2) + 80
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 80,
                                  crossAxisSpacing: 80,
                                  childAspectRatio: 1,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final isEnabled = _bedroomToggles[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _bedroomToggles[index] =
                                        !_bedroomToggles[index];
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isEnabled
                                        ? primaryColor.withOpacity(0.15)
                                        : CupertinoColors.systemGrey5,
                                    border: Border.all(
                                      color: isEnabled
                                          ? primaryColor
                                          : CupertinoColors.systemGrey3,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: _buildControlItem(
                                      bedroomControlItems[index],
                                      isEnabled,
                                      primaryColor,
                                    ),
                                  ),
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
}
