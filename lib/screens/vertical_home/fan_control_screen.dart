import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Fan control screen with speed adjustment
class FanControlScreen extends StatefulWidget {
  const FanControlScreen({super.key});

  @override
  State<FanControlScreen> createState() => _FanControlScreenState();
}

class _FanControlScreenState extends State<FanControlScreen> {
  bool isFanOn = false;
  int fanSpeed = 1; // 1-5
  bool _isLoading = true;

  // Firebase database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  // Stream subscriptions for real-time updates
  StreamSubscription<DatabaseEvent>? _fanSubscription;
  StreamSubscription<DatabaseEvent>? _speedSubscription;

  @override
  void initState() {
    super.initState();
    _fetchFirebaseState();
    _setupFirebaseListeners();
  }

  @override
  void dispose() {
    _fanSubscription?.cancel();
    _speedSubscription?.cancel();
    super.dispose();
  }

  /// Fetch initial state from Firebase
  Future<void> _fetchFirebaseState() async {
    print('[DEBUG] FanControlScreen: Fetching initial Firebase state...');
    try {
      // Fetch fan toggle state
      final fanSnapshot = await _dbRef.child('fan').get();
      if (fanSnapshot.exists) {
        final fanValue = fanSnapshot.value as bool?;
        setState(() {
          isFanOn = fanValue ?? false;
        });
        print('[DEBUG] FanControlScreen: Fan state = $isFanOn');
      }

      // Fetch fan speed value
      final speedSnapshot = await _dbRef.child('fan-speed').get();
      if (speedSnapshot.exists) {
        final speedValue = speedSnapshot.value;
        if (speedValue != null) {
          final intValue = (speedValue as num).toInt();
          setState(() {
            fanSpeed = intValue.clamp(1, 5);
          });
          print('[DEBUG] FanControlScreen: Fan speed = $fanSpeed');
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('[ERROR] FanControlScreen: Failed to fetch Firebase data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Setup real-time Firebase listeners
  void _setupFirebaseListeners() {
    // Listen to fan toggle changes
    _fanSubscription = _dbRef.child('fan').onValue.listen((event) {
      if (event.snapshot.exists) {
        final fanValue = event.snapshot.value as bool?;
        if (mounted && fanValue != null && fanValue != isFanOn) {
          setState(() {
            isFanOn = fanValue;
          });
          print('[DEBUG] FanControlScreen: Fan state updated to $isFanOn');
        }
      }
    });

    // Listen to fan speed changes
    _speedSubscription = _dbRef.child('fan-speed').onValue.listen((event) {
      if (event.snapshot.exists) {
        final speedValue = event.snapshot.value;
        if (mounted && speedValue != null) {
          final intValue = (speedValue as num).toInt().clamp(1, 5);
          if (intValue != fanSpeed) {
            setState(() {
              fanSpeed = intValue;
            });
            print('[DEBUG] FanControlScreen: Fan speed updated to $fanSpeed');
          }
        }
      }
    });
  }

  /// Update fan toggle state in Firebase
  Future<void> _updateFanState(bool value) async {
    try {
      await _dbRef.child('fan').set(value);
      print('[DEBUG] FanControlScreen: Updated Firebase fan = $value');
    } catch (e) {
      print('[ERROR] FanControlScreen: Failed to update fan state: $e');
    }
  }

  /// Update fan speed value in Firebase (1-5)
  Future<void> _updateFanSpeed(int speed) async {
    final clampedSpeed = speed.clamp(1, 5);
    try {
      await _dbRef.child('fan-speed').set(clampedSpeed);
      print(
        '[DEBUG] FanControlScreen: Updated Firebase fan-speed = $clampedSpeed',
      );
    } catch (e) {
      print('[ERROR] FanControlScreen: Failed to update fan speed: $e');
    }
  }

  /// Decrease fan speed
  void _decreaseSpeed() {
    if (!isFanOn || fanSpeed <= 1) return;
    final newSpeed = fanSpeed - 1;
    setState(() {
      fanSpeed = newSpeed;
    });
    _updateFanSpeed(newSpeed);
  }

  /// Increase fan speed
  void _increaseSpeed() {
    if (!isFanOn || fanSpeed >= 5) return;
    final newSpeed = fanSpeed + 1;
    setState(() {
      fanSpeed = newSpeed;
    });
    _updateFanSpeed(newSpeed);
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
          NavbarSetup(theme: theme, imgPath: 'fan', label: 'Fan'),

          // Main content area
          Expanded(
            child: _isLoading
                ? Center(child: CupertinoActivityIndicator())
                : Container(
                    color: CupertinoColors.systemBackground,
                    padding: EdgeInsets.only(
                      left: 60.0,
                      top: 30.0,
                      bottom: 40.0,
                      right: 0.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with icon and toggle - "Fan"
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/fan.png',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 35),
                            Text(
                              'Fan',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.black,
                              ),
                            ),
                            SizedBox(width: 20),
                            // Power toggle switch - synced with Firebase
                            CupertinoSwitch(
                              value: isFanOn,
                              onChanged: (val) {
                                setState(() => isFanOn = val);
                                _updateFanState(val);
                              },
                              activeColor: primaryColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),

                        // Main content row
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Left section: Fan image
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F0EB),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 15,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'images/fan-small.png',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Color(0xFFF5F0EB),
                                              child: Center(
                                                child: Image.asset(
                                                  'images/fan.png',
                                                  width: 80,
                                                  height: 80,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),

                              // Right section: Speed control panel
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F0EB),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        bottomLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 30,
                                    ),
                                    child: _buildSpeedControl(primaryColor),
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

  /// Builds the speed control widget matching the reference UI
  Widget _buildSpeedControl(Color primaryColor) {
    final bool isEnabled = isFanOn;
    final Color disabledColor = Colors.grey[350]!;
    final Color activeColor = primaryColor;

    // Check if at min/max limits
    final bool canDecrease = isEnabled && fanSpeed > 1;
    final bool canIncrease = isEnabled && fanSpeed < 5;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        decoration: BoxDecoration(
          color: Color(0xFFF8F6F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isEnabled ? activeColor : disabledColor,
            width: 2.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Decrease button
            GestureDetector(
              onTap: canDecrease ? _decreaseSpeed : null,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: canDecrease ? activeColor : disabledColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  CupertinoIcons.chevron_left,
                  color: canDecrease ? activeColor : disabledColor,
                  size: 22,
                ),
              ),
            ),
            SizedBox(width: 25),

            // Speed display circle
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: isEnabled ? activeColor : disabledColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$fanSpeed',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 25),

            // Increase button
            GestureDetector(
              onTap: canIncrease ? _increaseSpeed : null,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: canIncrease ? activeColor : disabledColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  CupertinoIcons.chevron_right,
                  color: canIncrease ? activeColor : disabledColor,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
