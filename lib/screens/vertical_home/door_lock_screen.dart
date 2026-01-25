// vertical_home/door_lock_screen.dart
// Door lock control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool privacyMode = false;
  bool passageMode = false;
  double batteryLevel = 0.75; // 75% battery

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
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
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
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          color: Colors.white,
                          size: 28,
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
                                          onTap: () {
                                            setState(() {
                                              isLocked = !isLocked;
                                            });
                                          },
                                          child: Container(
                                            width: 160,
                                            height: 160,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(
                                                  0xFF8BC34A,
                                                ), // Green border
                                                width: 4,
                                              ),
                                              color: primaryColor,
                                            ),
                                            child: Icon(
                                              isLocked
                                                  ? CupertinoIcons.lock_fill
                                                  : CupertinoIcons
                                                        .lock_open_fill,
                                              color: Colors.white,
                                              size: 70,
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
                                                color: isLocked
                                                    ? Color(0xFF4CAF50)
                                                    : Colors.orange,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              isLocked ? 'Locked' : 'Unlocked',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: isLocked
                                                    ? Color(0xFF4CAF50)
                                                    : Colors.orange,
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: [
                                // First row: Privacy Mode & Passage Mode
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _buildControlCard(
                                          icon: CupertinoIcons
                                              .person_crop_circle_badge_minus,
                                          label: 'Privacy Mode',
                                          isToggle: true,
                                          toggleValue: privacyMode,
                                          onToggle: (value) {
                                            setState(() {
                                              privacyMode = value;
                                            });
                                          },
                                          primaryColor: primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: _buildControlCard(
                                          icon:
                                              CupertinoIcons.square_arrow_right,
                                          label: 'Passage Mode',
                                          isToggle: true,
                                          toggleValue: passageMode,
                                          onToggle: (value) {
                                            setState(() {
                                              passageMode = value;
                                            });
                                          },
                                          primaryColor: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),

                                // Second row: Tamper Alarm & Activity Trail
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _buildControlCard(
                                          icon: CupertinoIcons.bell_fill,
                                          label: 'Tamper Alarm',
                                          isToggle: false,
                                          primaryColor: primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: _buildControlCard(
                                          icon: CupertinoIcons
                                              .arrow_counterclockwise,
                                          label: 'Activity Trail',
                                          isToggle: false,
                                          primaryColor: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),

                                // Battery level indicator
                                Expanded(
                                  child: _buildBatteryCard(primaryColor),
                                ),
                              ],
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

  Widget _buildControlCard({
    required IconData icon,
    required String label,
    required bool isToggle,
    bool toggleValue = false,
    Function(bool)? onToggle,
    required Color primaryColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
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
          if (isToggle) ...[
            SizedBox(height: 8),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: toggleValue,
                onChanged: onToggle,
                activeColor: primaryColor,
              ),
            ),
          ],
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
