// vertical_home/door_lock_screen.dart
// Door lock control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/utils/web_api.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

import 'dart:math' as math;

/// Door lock control screen
class DoorLockScreen extends StatefulWidget {
  const DoorLockScreen({super.key});

  @override
  State<DoorLockScreen> createState() => _DoorLockScreenState();
}

class _DoorLockScreenState extends State<DoorLockScreen> {
  bool isLocked = true;
  double batteryLevel = 0.75; // 75% battery
  bool isUnlocking = false; // Loading state for unlock operation

  // Activity trails state
  List<Map<String, dynamic>>? _activityTrails;
  bool _isLoadingTrails = false;

  // Lock status API state
  String _lockState = 'Unknown';
  String _lockMode = 'Unknown';
  bool _isLoadingLockStatus = false;

  // Firebase database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  final WebApi _webApi = WebApi();

  @override
  void initState() {
    super.initState();
    // Ensure valid token before fetching data, then fetch
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasToken = await WebApi.ensureValidToken(context);
      if (hasToken && mounted) {
        _fetchActivityTrails();
        _fetchLockStatus();
      } else {
        print('[DEBUG] DoorLockScreen: No valid token, skipping API calls');
      }
    });
  }

  Future<void> _fetchActivityTrails() async {
    if (!mounted) return;

    setState(() {
      _isLoadingTrails = true;
    });

    try {
      final trails = await _webApi.getActivityTrails(context);

      if (!mounted) return;

      setState(() {
        _activityTrails = trails;
        _isLoadingTrails = false;
      });
    } catch (e) {
      print('[ERROR] DoorLockScreen: Failed to fetch activity trails: $e');
      if (!mounted) return;
      setState(() {
        _isLoadingTrails = false;
      });
    }
  }

  /// Fetches lock status from the API (lockState, lockMode, batteryStatus, etc.)
  Future<void> _fetchLockStatus() async {
    if (!mounted) return;

    setState(() {
      _isLoadingLockStatus = true;
    });

    try {
      final statusData = await _webApi.getLockStatus(context);

      if (!mounted) return;

      if (statusData != null) {
        setState(() {
          _lockState = statusData['lockState']?.toString() ?? 'Unknown';
          _lockMode = statusData['lockMode']?.toString() ?? 'Unknown';
          _isLoadingLockStatus = false;

          // Update battery level from API if available
          final battery = statusData['batteryStatus']?.toString().toUpperCase();
          if (battery == 'GOOD') {
            batteryLevel = 0.85;
          } else if (battery == 'LOW') {
            batteryLevel = 0.25;
          } else if (battery == 'CRITICAL') {
            batteryLevel = 0.10;
          }
        });
        print(
          '[DEBUG] DoorLockScreen: Lock status - lockState=$_lockState, lockMode=$_lockMode',
        );
      } else {
        setState(() {
          _isLoadingLockStatus = false;
        });
        print('[DEBUG] DoorLockScreen: Lock status returned null');
      }
    } catch (e) {
      print('[ERROR] DoorLockScreen: Failed to fetch lock status: $e');
      if (!mounted) return;
      setState(() {
        _isLoadingLockStatus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          // Use existing NavbarSetup widget
          NavbarSetup(theme: theme, imgPath: 'door_lock', label: 'Door Lock'),

          // Main content area
          Expanded(
            child: Container(
              color: CupertinoColors.systemBackground,
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 0.0,
                top: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with icon - "Door Lock - Advantis IoT 9"
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'images/door_lock.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                CupertinoIcons.lock_fill,
                                color: Colors.white,
                                size: 28,
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(width: 15),
                      Text(
                        'Door Lock - Advantis IoT 9',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Main content row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left section: Door image with lock status overlay
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                // Door image
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/door_lock_feed.png',
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                        errorBuilder: (context, error, stackTrace) {
                                          // Fallback placeholder matching design
                                          return Container(
                                            color: Color(0xFFE8E0D8),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.home,
                                                    size: 60,
                                                    color: Colors.grey[500],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Door Image',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),

                                // Lock status indicator
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Large circular lock button
                                        GestureDetector(
                                          onTap: () => _toggleUnlock(),
                                          child: Container(
                                            width: 180,
                                            height: 180,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: isUnlocking
                                                    ? CupertinoColors
                                                          .systemYellow
                                                    : (isLocked
                                                          ? CupertinoColors
                                                                .systemRed
                                                          : Color(0xFF4CAF50)),
                                                width: 4,
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: primaryColor,
                                                ),
                                                child: isUnlocking
                                                    ? const CupertinoActivityIndicator(
                                                        radius: 30,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        isLocked
                                                            ? CupertinoIcons
                                                                  .lock_fill
                                                            : CupertinoIcons
                                                                  .lock_open_fill,
                                                        color: Colors.white,
                                                        size: 70,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        // Status indicator
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color: isUnlocking
                                                    ? CupertinoColors
                                                          .systemYellow
                                                    : (isLocked
                                                          ? CupertinoColors
                                                                .systemRed
                                                          : Color(0xFF4CAF50)),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              isUnlocking
                                                  ? 'Unlocking...'
                                                  : (isLocked
                                                        ? 'Locked'
                                                        : 'Unlocked'),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30),

                        // Right section: Control buttons grid
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F0EB),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 25,
                                bottom: 25,
                                right: 0,
                              ),
                              child: Column(
                                children: [
                                  // First row: Lock State & Lock Mode (read-only from API)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildStatusCard(
                                          imagePath: 'images/privacy_mode.png',
                                          label: 'Lock State',
                                          status: _lockState,
                                          isLoading: _isLoadingLockStatus,
                                          primaryColor: primaryColor,
                                        ),
                                        _buildStatusCard(
                                          imagePath: 'images/passage_mode.png',
                                          label: 'Lock Mode',
                                          status: _lockMode,
                                          isLoading: _isLoadingLockStatus,
                                          primaryColor: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),

                                  // Second row: Tamper Alarm & Activity Trail
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildControlCard(
                                          imagePath: 'images/tamper_alarm.png',
                                          label: 'Tamper Alarm',
                                          primaryColor: primaryColor,
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              _showActivityTrailSheet(),
                                          child: _buildControlCard(
                                            imagePath:
                                                'images/activity_trail.png',
                                            label: 'Activity Trail',
                                            primaryColor: primaryColor,
                                            showBadge:
                                                _activityTrails != null &&
                                                _activityTrails!.isNotEmpty,
                                            badgeCount: _activityTrails?.length,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),

                                  // Battery level indicator
                                  Expanded(
                                    child: _buildBatteryCard(primaryColor),
                                  ),
                                ],
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
        ],
      ),
    );
  }

  /// Read-only status card for Privacy Mode / Passage Mode (no toggle).
  Widget _buildStatusCard({
    required String imagePath,
    required String label,
    required String status,
    required bool isLoading,
    required Color primaryColor,
  }) {
    Color statusColor;
    switch (status) {
      case 'Enabled':
      case 'Active':
        statusColor = const Color(0xFF4CAF50);
        break;
      case 'Disabled':
        statusColor = CupertinoColors.systemGrey;
        break;
      default:
        statusColor = CupertinoColors.systemGrey3;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 36,
                height: 36,
                fit: BoxFit.contain,
                color: Colors.white,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    CupertinoIcons.circle,
                    color: Colors.white,
                    size: 36,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),
          // Status indicator (replaces the toggle)
          isLoading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CupertinoActivityIndicator(radius: 8),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12,
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildControlCard({
    required String imagePath,
    required String label,
    required Color primaryColor,
    bool showBadge = false,
    int? badgeCount,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: 36,
                    height: 36,
                    fit: BoxFit.contain,
                    color: Colors.white,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        CupertinoIcons.circle,
                        color: Colors.white,
                        size: 36,
                      );
                    },
                  ),
                ),
              ),
              if (showBadge && badgeCount != null && badgeCount > 0)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemRed,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                    child: Center(
                      child: Text(
                        badgeCount > 99 ? '99+' : '$badgeCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryCard(Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Battery circular indicator
          CustomPaint(
            size: Size(80, 80),
            painter: BatteryLevelPainter(
              batteryLevel: batteryLevel,
              primaryColor: primaryColor,
            ),
          ),
          SizedBox(width: 20),
          Text(
            'Battery Level',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a bottom sheet with the activity trail entries.
  void _showActivityTrailSheet() {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    showCupertinoModalPopup(
      context: context,
      builder: (sheetContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey3,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/activity_trail.png',
                      width: 24,
                      height: 24,
                      color: primaryColor,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          CupertinoIcons.clock,
                          color: primaryColor,
                          size: 24,
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Activity Trail',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.black,
                      ),
                    ),
                    Spacer(),
                    // Refresh button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        _fetchActivityTrails().then((_) {
                          if (mounted) _showActivityTrailSheet();
                        });
                      },
                      child: Icon(
                        CupertinoIcons.refresh,
                        color: primaryColor,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: CupertinoColors.systemGrey5),

              // Content
              Expanded(child: _buildActivityTrailContent(primaryColor)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActivityTrailContent(Color primaryColor) {
    if (_isLoadingTrails) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(radius: 16),
            SizedBox(height: 12),
            Text(
              'Loading activity trails...',
              style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
            ),
          ],
        ),
      );
    }

    if (_activityTrails == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_circle,
              color: CupertinoColors.systemGrey,
              size: 40,
            ),
            SizedBox(height: 12),
            Text(
              'Unable to load activity trails',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Please ensure you are authenticated',
              style: TextStyle(
                color: CupertinoColors.systemGrey2,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    if (_activityTrails!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.doc_text,
              color: CupertinoColors.systemGrey,
              size: 40,
            ),
            SizedBox(height: 12),
            Text(
              'No activity trails found',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: _activityTrails!.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: CupertinoColors.systemGrey5),
      itemBuilder: (context, index) {
        final trail = _activityTrails![index];
        return _buildTrailItem(trail, primaryColor);
      },
    );
  }

  Widget _buildTrailItem(Map<String, dynamic> trail, Color primaryColor) {
    // Extract fields matching actual API: eventType, eventTimestamp, accessType, firstAccess, secondAccess
    final eventType =
        (trail['eventType'] ?? trail['action'] ?? trail['type'] ?? 'Unknown')
            .toString();
    final accessType = (trail['accessType'] ?? trail['method'] ?? '')
        .toString();
    final rawTimestamp =
        (trail['eventTimestamp'] ??
                trail['timestamp'] ??
                trail['createdAt'] ??
                '')
            .toString();

    // Extract user info from firstAccess / secondAccess
    final firstAccess = trail['firstAccess'];
    final secondAccess = trail['secondAccess'];
    String userName = '';
    if (firstAccess != null && firstAccess is Map) {
      userName = (firstAccess['name'] ?? firstAccess['userName'] ?? '')
          .toString();
    }
    if (userName.isEmpty && secondAccess != null && secondAccess is Map) {
      userName = (secondAccess['name'] ?? secondAccess['userName'] ?? '')
          .toString();
    }

    // Format timestamp
    String formattedTime = '';
    if (rawTimestamp.isNotEmpty) {
      try {
        final dt = DateTime.parse(rawTimestamp);
        final local = dt.toLocal();
        final months = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ];
        final hour = local.hour > 12
            ? local.hour - 12
            : (local.hour == 0 ? 12 : local.hour);
        final amPm = local.hour >= 12 ? 'PM' : 'AM';
        formattedTime =
            '${local.day.toString().padLeft(2, '0')} ${months[local.month - 1]} ${local.year}, ${hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')} $amPm';
      } catch (_) {
        formattedTime = rawTimestamp;
      }
    }

    // Friendly display name for event type
    String displayEvent;
    final eventLower = eventType.toLowerCase();
    if (eventLower == 'locked') {
      displayEvent = 'Door Locked';
    } else if (eventLower == 'unlocked') {
      displayEvent = 'Door Unlocked';
    } else {
      displayEvent =
          eventType[0].toUpperCase() + eventType.substring(1).toLowerCase();
    }

    // Friendly display for access type
    String displayAccess = '';
    if (accessType.isNotEmpty) {
      switch (accessType.toLowerCase()) {
        case 'autolock':
          displayAccess = 'Auto Lock';
          break;
        case 'pin':
          displayAccess = 'PIN Code';
          break;
        case 'fingerprint':
          displayAccess = 'Fingerprint';
          break;
        case 'rfid':
          displayAccess = 'RFID Card';
          break;
        case 'remote':
          displayAccess = 'Remote Access';
          break;
        case 'manual':
          displayAccess = 'Manual';
          break;
        default:
          displayAccess = accessType[0].toUpperCase() + accessType.substring(1);
      }
    }

    // Pick icon and color based on event type
    IconData iconData;
    Color iconColor;
    if (eventLower.contains('unlock')) {
      iconData = CupertinoIcons.lock_open_fill;
      iconColor = const Color(0xFF4CAF50);
    } else if (eventLower.contains('lock')) {
      iconData = CupertinoIcons.lock_fill;
      iconColor = CupertinoColors.systemRed;
    } else if (eventLower.contains('privacy')) {
      iconData = CupertinoIcons.eye_slash_fill;
      iconColor = CupertinoColors.systemOrange;
    } else if (eventLower.contains('passage')) {
      iconData = CupertinoIcons.arrow_right_arrow_left;
      iconColor = CupertinoColors.systemBlue;
    } else if (eventLower.contains('tamper')) {
      iconData = CupertinoIcons.exclamationmark_triangle_fill;
      iconColor = CupertinoColors.systemRed;
    } else {
      iconData = CupertinoIcons.clock;
      iconColor = primaryColor;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(iconData, color: iconColor, size: 20)),
          ),
          const SizedBox(width: 14),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayEvent,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
                  ),
                ),
                if (displayAccess.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    displayAccess,
                    style: const TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
                if (userName.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey2,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Timestamp
          if (formattedTime.isNotEmpty)
            Text(
              formattedTime,
              style: const TextStyle(
                fontSize: 11,
                color: CupertinoColors.systemGrey2,
              ),
            ),
        ],
      ),
    );
  }

  // Method to unlock via Firebase toggle
  Future<void> _toggleUnlock() async {
    // Prevent unlock if already unlocked or currently unlocking
    if (!isLocked || isUnlocking) {
      return;
    }

    // Start loading animation
    setState(() {
      isUnlocking = true;
    });

    try {
      // Set unlock_door to true in Firebase
      await _dbRef.child('unlock_door').set(true);
      print('[DEBUG] DoorLockScreen: Set unlock_door = true in Firebase');

      // Wait 2 seconds (manual loader)
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      // Unlock successful - update UI
      setState(() {
        isUnlocking = false;
        isLocked = false;
      });

      // Fetch lock status 3 seconds after unlock
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          _fetchLockStatus();
        }
      });

      // Auto-lock after 8 seconds and reset Firebase flag
      Future.delayed(const Duration(seconds: 8), () async {
        if (mounted && !isLocked) {
          setState(() {
            isLocked = true;
          });
          try {
            await _dbRef.child('unlock_door').set(false);
            print(
              '[DEBUG] DoorLockScreen: Set unlock_door = false in Firebase (auto-lock)',
            );
          } catch (e) {
            print('[ERROR] DoorLockScreen: Failed to reset unlock_door: $e');
          }
        }
      });
    } catch (e) {
      print('[ERROR] DoorLockScreen: Failed to set unlock_door: $e');
      if (!mounted) return;
      setState(() {
        isUnlocking = false;
      });
    }
  }
}

// Custom painter for battery level circular indicator
class BatteryLevelPainter extends CustomPainter {
  final double batteryLevel;
  final Color primaryColor;

  BatteryLevelPainter({required this.batteryLevel, required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Background circle (grey track)
    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(center, radius - 4, backgroundPaint);

    // Progress arc (purple)
    final progressPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    // Draw arc from top, clockwise
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 4),
      -math.pi / 2, // Start from top
      2 * math.pi * batteryLevel, // Progress
      false,
      progressPaint,
    );

    // Battery icon in center
    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(CupertinoIcons.battery_full.codePoint),
        style: TextStyle(
          fontSize: 28,
          fontFamily: CupertinoIcons.battery_full.fontFamily,
          package: CupertinoIcons.battery_full.fontPackage,
          color: primaryColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    iconPainter.layout();
    iconPainter.paint(
      canvas,
      Offset(
        center.dx - iconPainter.width / 2,
        center.dy - iconPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(BatteryLevelPainter oldDelegate) {
    return oldDelegate.batteryLevel != batteryLevel;
  }
}
