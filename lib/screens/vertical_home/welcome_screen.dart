// vertical_home/welcome_screen.dart
// Welcome screen with security status icons and backdrop image
// Made responsive for iPhone testing while optimized for iPad production

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'utils.dart';

/// Welcome screen widget displaying security status and quick access icons
class WelcomeScreenWidget extends StatelessWidget {
  final List<int>
  iconStatus; // [doorLock, vdb, camera] status (0=grey, 1=red, 2=green)
  final Function(int index) onIconTap; // Callback when icon is tapped
  final Function(int index)?
  onIconLongPress; // Callback when icon is long pressed
  final String? activeUserName; // Active user from Firebase ACK
  final Function(String userName)?
  onProfileSelected; // Profile dropdown callback
  final Set<String> knownUsers; // Dynamically fetched known users from /presets
  // Callback that fetches the latest user list from Firebase on demand
  final Future<Set<String>> Function()? onRefreshUsers;

  // Avatar image mapping — extended with all known users
  static const Map<String, String> userAvatars = {
    'deodatta': 'images/deodatta.jpeg',
    'parag': 'images/parag.jpeg',
    'sd': 'images/sd.jpeg',
    'jinay': 'images/jinay.jpeg',
    'jay': 'images/jay.jpeg',
    'saili': 'images/sd.jpeg', // Saili shares sd avatar
    'kd': 'images/parag.jpeg', // KD/Keyoor shares parag avatar
  };

  const WelcomeScreenWidget({
    super.key,
    required this.iconStatus,
    required this.onIconTap,
    this.onIconLongPress,
    this.activeUserName,
    this.onProfileSelected,
    this.knownUsers = const {},
    this.onRefreshUsers,
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
            _buildNavbar(context, primaryColor, isSmallScreen),
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

  // Display name overrides (e.g. 'sd' -> 'Sayali')
  static const Map<String, String> _displayNames = {'sd': 'Sayali'};

  /// Get the display-friendly name for a username
  String _displayName(String name) {
    final key = name.toLowerCase();
    if (_displayNames.containsKey(key)) return _displayNames[key]!;
    // Default: title-case
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }

  /// Builds the top navbar with logo and location/user display
  Widget _buildNavbar(
    BuildContext context,
    Color primaryColor,
    bool isSmallScreen,
  ) {
    print('[DEBUG] WelcomeScreen: Building navbar');
    final hPadding = isSmallScreen ? 20.0 : 40.0;
    final vPadding = isSmallScreen ? 15.0 : 30.0;
    final logoHeight = isSmallScreen ? 50.0 : 75.0;
    final fontSize = isSmallScreen ? 16.0 : 22.0;
    final avatarRadius = isSmallScreen ? 18.0 : 22.0;

    final hasActiveUser =
        activeUserName != null &&
        knownUsers.contains(activeUserName!.toLowerCase());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/new_main_logo.png', height: logoHeight),
          hasActiveUser
              ? GestureDetector(
                  onTap: () =>
                      _showProfileDropdown(context, primaryColor, avatarRadius),
                  child: Row(
                    children: [
                      Text(
                        _displayName(activeUserName!),
                        style: TextStyle(
                          fontFamily: 'GEG',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      userAvatars.containsKey(activeUserName!.toLowerCase())
                          ? CircleAvatar(
                              radius: avatarRadius,
                              backgroundImage: AssetImage(
                                userAvatars[activeUserName!.toLowerCase()]!,
                              ),
                            )
                          : CircleAvatar(
                              radius: avatarRadius,
                              backgroundColor: primaryColor.withOpacity(0.15),
                              child: Text(
                                activeUserName![0].toUpperCase(),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: avatarRadius * 0.9,
                                ),
                              ),
                            ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () =>
                      _showProfileDropdown(context, primaryColor, avatarRadius),
                  child: Row(
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
            'Locking System is Armed Away.',
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

  /// Shows a dropdown popup to select a user profile.
  /// Fetches the latest user list from Firebase on every open for real-time accuracy.
  void _showProfileDropdown(
    BuildContext context,
    Color primaryColor,
    double avatarRadius,
  ) {
    final currentKey = activeUserName?.toLowerCase();

    showCupertinoModalPopup(
      context: context,
      builder: (popupContext) {
        return StatefulBuilder(
          builder: (sbContext, setState) {
            // State inside the popup
            bool isLoading = false;
            Set<String> liveUsers = Set.from(knownUsers);

            // Trigger fetch immediately when popup opens
            Future<void> fetchUsers() async {
              if (onRefreshUsers == null) return;
              setState(() => isLoading = true);
              try {
                final fresh = await onRefreshUsers!();
                setState(() {
                  liveUsers = fresh;
                  isLoading = false;
                });
              } catch (_) {
                setState(() => isLoading = false);
              }
            }

            return _ProfileDropdownSheet(
              primaryColor: primaryColor,
              avatarRadius: avatarRadius,
              currentKey: currentKey,
              initialUsers: liveUsers,
              onRefreshUsers: onRefreshUsers,
              onUserSelected: (userKey) {
                Navigator.of(popupContext).pop();
                onProfileSelected?.call(userKey);
              },
              displayName: _displayName,
            );
          },
        );
      },
    );
  }
}

/// Stateful bottom sheet that fetches fresh users from Firebase on open
class _ProfileDropdownSheet extends StatefulWidget {
  final Color primaryColor;
  final double avatarRadius;
  final String? currentKey;
  final Set<String> initialUsers;
  final Future<Set<String>> Function()? onRefreshUsers;
  final void Function(String) onUserSelected;
  final String Function(String) displayName;

  const _ProfileDropdownSheet({
    required this.primaryColor,
    required this.avatarRadius,
    required this.currentKey,
    required this.initialUsers,
    required this.onRefreshUsers,
    required this.onUserSelected,
    required this.displayName,
  });

  @override
  State<_ProfileDropdownSheet> createState() => _ProfileDropdownSheetState();
}

class _ProfileDropdownSheetState extends State<_ProfileDropdownSheet> {
  bool _isLoading = true;
  Set<String> _users = {};

  // Avatar image mapping — extended with all known users
  static const Map<String, String> _userAvatars =
      WelcomeScreenWidget.userAvatars;

  @override
  void initState() {
    super.initState();
    _users = Set.from(widget.initialUsers);
    _fetchFreshUsers();
  }

  Future<void> _fetchFreshUsers() async {
    if (widget.onRefreshUsers == null) {
      setState(() => _isLoading = false);
      return;
    }
    try {
      final fresh = await widget.onRefreshUsers!();
      if (mounted) {
        setState(() {
          _users = fresh;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget _buildAvatar(String userKey) {
    final color = widget.primaryColor;
    final radius = widget.avatarRadius;
    if (_userAvatars.containsKey(userKey)) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(_userAvatars[userKey]!),
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: color.withValues(alpha: 0.15),
      child: Text(
        userKey[0].toUpperCase(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: radius * 0.9,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.primaryColor;
    // Show all users; active user gets a checkmark
    final allUsers = _users.toList()..sort();

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey3,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Title row with refresh indicator
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Switch Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                  if (_isLoading) ...[
                    const SizedBox(width: 10),
                    const CupertinoActivityIndicator(radius: 10),
                  ],
                ],
              ),
            ),
            // User list — all users, active gets checkmark
            if (!_isLoading && allUsers.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'No profiles found',
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
              )
            else
              ...allUsers.map((userKey) {
                final isActive = userKey == widget.currentKey;
                return CupertinoButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  onPressed: isActive
                      ? null // tapping active user does nothing
                      : () => widget.onUserSelected(userKey),
                  child: Row(
                    children: [
                      _buildAvatar(userKey),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          widget.displayName(userKey),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: isActive
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isActive
                                ? color
                                : CupertinoColors.label.resolveFrom(context),
                          ),
                        ),
                      ),
                      if (isActive)
                        Icon(
                          CupertinoIcons.checkmark_alt,
                          color: color,
                          size: 20,
                        ),
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
