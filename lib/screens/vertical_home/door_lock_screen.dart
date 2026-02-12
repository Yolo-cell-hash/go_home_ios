// vertical_home/door_lock_screen.dart
// Door lock control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
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
  bool isUnlocking = false; // Loading state for unlock operation

  // Firebase database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

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
                                  // First row: Privacy Mode & Passage Mode
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildControlCard(
                                          imagePath: 'images/privacy_mode.png',
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
                                        _buildControlCard(
                                          imagePath: 'images/passage_mode.png',
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
                                          isToggle: false,
                                          primaryColor: primaryColor,
                                        ),
                                        _buildControlCard(
                                          imagePath:
                                              'images/activity_trail.png',
                                          label: 'Activity Trail',
                                          isToggle: false,
                                          primaryColor: primaryColor,
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

  Widget _buildControlCard({
    required String imagePath,
    required String label,
    required bool isToggle,
    bool toggleValue = false,
    Function(bool)? onToggle,
    required Color primaryColor,
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
