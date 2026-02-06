// vertical_home/welcome_screen.dart
// Welcome screen with security status icons and backdrop image
// Made responsive for iPhone testing while optimized for iPad production

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'utils.dart';

/// Welcome screen widget displaying security status and quick access icons
class WelcomeScreenWidget extends StatelessWidget {
  final List<int>
  iconStatus; // [doorLock, vdb, camera] status (0=grey, 1=red, 2=green)
  final Function(int index) onIconTap; // Callback when icon is tapped
  final Function(int index)?
  onIconLongPress; // Callback when icon is long pressed

  const WelcomeScreenWidget({
    super.key,
    required this.iconStatus,
    required this.onIconTap,
    this.onIconLongPress,
  });

  // Check if this is a small screen (iPhone in portrait)
  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.shortestSide < 600;
  }

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] WelcomeScreenWidget build called');
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final isSmallScreen = _isSmallScreen(context);

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Navbar
            _buildNavbar(primaryColor, isSmallScreen),
            // Content - Backdrop image with fade blur and status text
            Expanded(
              child: Stack(
                children: [
                  // Background image
                  _buildBackgroundImage(),
                  // Gradient overlay
                  _buildGradientOverlay(isSmallScreen),
                  // Status text with icons
                  isSmallScreen
                      ? _buildMobileStatusSection(primaryColor)
                      : _buildStatusSection(primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the top navbar with logo and location
  Widget _buildNavbar(Color primaryColor, bool isSmallScreen) {
    print('[DEBUG] WelcomeScreen: Building navbar');
    final hPadding = isSmallScreen ? 20.0 : 40.0;
    final vPadding = isSmallScreen ? 15.0 : 30.0;
    final logoHeight = isSmallScreen ? 50.0 : 75.0;
    final fontSize = isSmallScreen ? 16.0 : 22.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/new_main_logo.png', height: logoHeight),
          Row(
            children: [
              Text(
                'Mumbai Home',
                style: TextStyle(
                  fontFamily: 'GEG',
                  fontSize: fontSize,
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
    );
  }

  /// Builds the background image container
  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/backdrop.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  /// Builds the gradient overlay at the bottom
  Widget _buildGradientOverlay(bool isSmallScreen) {
    final height = isSmallScreen ? 350.0 : 550.0;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height,
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
    );
  }

  /// Mobile-friendly status section - stacked vertically
  Widget _buildMobileStatusSection(Color primaryColor) {
    print('[DEBUG] WelcomeScreen: Building MOBILE status section with icons');
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Status text at top
          Text(
            'Security System is Armed Away.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GEG',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: primaryColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          // Three icons in a row - smaller for mobile
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Door Lock icon
              _buildSecurityIcon(
                index: 0,
                imagePath: 'images/door_lock.png',
                isSvg: false,
                primaryColor: primaryColor,
                isSmall: true,
              ),
              const SizedBox(width: 20),
              // VDB icon
              _buildSecurityIcon(
                index: 1,
                imagePath: 'images/vdb.svg',
                isSvg: true,
                primaryColor: primaryColor,
                isSmall: true,
              ),
              const SizedBox(width: 20),
              // Camera icon
              _buildSecurityIcon(
                index: 2,
                imagePath: 'images/camera.png',
                isSvg: false,
                primaryColor: primaryColor,
                isSmall: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the status section with text and security icons (for iPad)
  Widget _buildStatusSection(Color primaryColor) {
    print('[DEBUG] WelcomeScreen: Building status section with icons');
    return Positioned(
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
              _buildSecurityIcon(
                index: 0,
                imagePath: 'images/door_lock.png',
                isSvg: false,
                primaryColor: primaryColor,
              ),
              const SizedBox(width: 30),
              // VDB icon
              _buildSecurityIcon(
                index: 1,
                imagePath: 'images/vdb.svg',
                isSvg: true,
                primaryColor: primaryColor,
              ),
              const SizedBox(width: 30),
              // Camera icon
              _buildSecurityIcon(
                index: 2,
                imagePath: 'images/camera.png',
                isSvg: false,
                primaryColor: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds individual security icon with double-border design
  Widget _buildSecurityIcon({
    required int index,
    required String imagePath,
    required bool isSvg,
    required Color primaryColor,
    bool isSmall = false,
  }) {
    final status = iconStatus[index];
    final isGreen = status == 2;

    // Smaller sizes for mobile
    final containerSize = isSmall ? 70.0 : 102.0;
    final imageSize = isSmall ? 24.0 : 38.0;
    final svgSize = isSmall ? 18.0 : 28.0;

    print(
      '[DEBUG] WelcomeScreen: Building security icon $index - status: $status',
    );

    return GestureDetector(
      onTap: () {
        print('[DEBUG] WelcomeScreen: Icon $index tapped');
        onIconTap(index);
      },
      onLongPress: () {
        print('[DEBUG] WelcomeScreen: Icon $index long pressed');
        if (onIconLongPress != null) {
          onIconLongPress!(index);
        }
      },
      child: Container(
        width: containerSize,
        height: containerSize,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: getStatusColor(status), width: 2),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isGreen
                ? primaryColor.withOpacity(0.15)
                : CupertinoColors.systemGrey5,
            border: Border.all(
              color: isGreen ? primaryColor : CupertinoColors.systemGrey3,
              width: 1,
            ),
          ),
          child: Center(
            child: isSvg
                ? SvgPicture.asset(
                    imagePath,
                    width: svgSize,
                    height: svgSize,
                    fit: BoxFit.contain,
                    allowDrawingOutsideViewBox: true,
                    colorFilter: ColorFilter.mode(
                      primaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                : Image.asset(
                    imagePath,
                    width: imageSize,
                    height: imageSize,
                    color: primaryColor,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
    );
  }
}
