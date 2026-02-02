import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Smart Light control screen
class LightControlScreen extends StatefulWidget {
  const LightControlScreen({super.key});

  @override
  State<LightControlScreen> createState() => _LightControlScreenState();
}

class _LightControlScreenState extends State<LightControlScreen> {
  bool isLightOn = false;
  double brightness = 0.75;
  Color selectedColor = const Color(0xFFFFEB3B); // Default yellow
  bool _isLoading = true;

  // Firebase database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  // Stream subscription for real-time updates
  StreamSubscription<DatabaseEvent>? _lightSubscription;
  StreamSubscription<DatabaseEvent>? _hexSubscription;
  StreamSubscription<DatabaseEvent>? _intensitySubscription;

  // Position of color indicator on wheel (relative to center)
  Offset _indicatorPosition = const Offset(-70, 30);

  // Preset colors
  final List<Color> presetColors = [
    const Color(0xFFFFEB3B), // Yellow
    const Color(0xFFFFF9C4), // Light Yellow
    const Color(0xFFF5F5F5), // White
  ];

  @override
  void initState() {
    super.initState();
    _fetchFirebaseState();
    _setupFirebaseListeners();
  }

  @override
  void dispose() {
    _lightSubscription?.cancel();
    _hexSubscription?.cancel();
    _intensitySubscription?.cancel();
    super.dispose();
  }

  /// Fetch initial state from Firebase
  Future<void> _fetchFirebaseState() async {
    print('[DEBUG] LightControlScreen: Fetching initial Firebase state...');
    try {
      // Fetch light toggle state
      final lightSnapshot = await _dbRef.child('light').get();
      if (lightSnapshot.exists) {
        final lightValue = lightSnapshot.value as bool?;
        setState(() {
          isLightOn = lightValue ?? false;
        });
        print('[DEBUG] LightControlScreen: Light state = $isLightOn');
      }

      // Fetch hex color value
      final hexSnapshot = await _dbRef.child('light-hex-value').get();
      if (hexSnapshot.exists) {
        final hexValue = hexSnapshot.value as String?;
        if (hexValue != null && hexValue.isNotEmpty) {
          _setColorFromHex(hexValue);
          print('[DEBUG] LightControlScreen: Hex color = $hexValue');
        }
      }

      // Fetch intensity value (0-255)
      final intensitySnapshot = await _dbRef.child('light intensity').get();
      if (intensitySnapshot.exists) {
        final intensityValue = intensitySnapshot.value;
        if (intensityValue != null) {
          final intValue = (intensityValue as num).toInt();
          setState(() {
            brightness = intValue / 255.0;
          });
          print(
            '[DEBUG] LightControlScreen: Intensity = $intValue (brightness = $brightness)',
          );
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('[ERROR] LightControlScreen: Failed to fetch Firebase data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Setup real-time Firebase listeners
  void _setupFirebaseListeners() {
    // Listen to light toggle changes
    _lightSubscription = _dbRef.child('light').onValue.listen((event) {
      if (event.snapshot.exists) {
        final lightValue = event.snapshot.value as bool?;
        if (mounted && lightValue != null && lightValue != isLightOn) {
          setState(() {
            isLightOn = lightValue;
          });
          print(
            '[DEBUG] LightControlScreen: Light state updated to $isLightOn',
          );
        }
      }
    });

    // Listen to hex color changes
    _hexSubscription = _dbRef.child('light-hex-value').onValue.listen((event) {
      if (event.snapshot.exists) {
        final hexValue = event.snapshot.value as String?;
        if (mounted && hexValue != null && hexValue.isNotEmpty) {
          final newColor = _hexToColor(hexValue);
          if (newColor != selectedColor) {
            _setColorFromHex(hexValue);
            print('[DEBUG] LightControlScreen: Hex color updated to $hexValue');
          }
        }
      }
    });

    // Listen to intensity changes
    _intensitySubscription = _dbRef.child('light intensity').onValue.listen((
      event,
    ) {
      if (event.snapshot.exists) {
        final intensityValue = event.snapshot.value;
        if (mounted && intensityValue != null) {
          final intValue = (intensityValue as num).toInt();
          final newBrightness = intValue / 255.0;
          if ((newBrightness - brightness).abs() > 0.01) {
            setState(() {
              brightness = newBrightness;
            });
            print(
              '[DEBUG] LightControlScreen: Intensity updated to $intValue (brightness = $newBrightness)',
            );
          }
        }
      }
    });
  }

  /// Update light toggle state in Firebase
  Future<void> _updateLightState(bool value) async {
    try {
      await _dbRef.child('light').set(value);
      print('[DEBUG] LightControlScreen: Updated Firebase light = $value');
    } catch (e) {
      print('[ERROR] LightControlScreen: Failed to update light state: $e');
    }
  }

  /// Update hex color value in Firebase
  Future<void> _updateHexColor(Color color) async {
    final hexValue = _colorToHex(color);
    try {
      await _dbRef.child('light-hex-value').set(hexValue);
      print('[DEBUG] LightControlScreen: Updated Firebase hex = $hexValue');
    } catch (e) {
      print('[ERROR] LightControlScreen: Failed to update hex color: $e');
    }
  }

  /// Update light intensity value in Firebase (0-255)
  Future<void> _updateIntensity(double brightnessValue) async {
    final intensity = (brightnessValue * 255).round().clamp(0, 255);
    try {
      await _dbRef.child('light intensity').set(intensity);
      print(
        '[DEBUG] LightControlScreen: Updated Firebase intensity = $intensity',
      );
    } catch (e) {
      print('[ERROR] LightControlScreen: Failed to update intensity: $e');
    }
  }

  /// Convert Color to hex string (e.g., "#FFEB3B")
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  /// Convert hex string to Color
  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add alpha if not present
    }
    return Color(int.parse(hex, radix: 16));
  }

  /// Set color from hex string and update indicator position
  void _setColorFromHex(String hex) {
    final color = _hexToColor(hex);
    final hsv = HSVColor.fromColor(color);

    // Calculate indicator position from hue and saturation
    final angle = (hsv.hue / 360) * 2 * math.pi;
    final radius = hsv.saturation * 80; // 80 is approx wheel radius - 10

    setState(() {
      selectedColor = color;
      _indicatorPosition = Offset(
        radius * math.cos(angle),
        radius * math.sin(angle),
      );
    });
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
          NavbarSetup(theme: theme, imgPath: 'light', label: 'Smart Lighting'),

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
                        // Title with icon and toggle - "Light"
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
                                CupertinoIcons.lightbulb,
                                size: 28.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Light',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.black,
                              ),
                            ),
                            SizedBox(width: 20),
                            // Power toggle switch - synced with Firebase
                            CupertinoSwitch(
                              value: isLightOn,
                              onChanged: (val) {
                                setState(() => isLightOn = val);
                                _updateLightState(val);
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
                              // Left section: Light image
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
                                    child: Stack(
                                      children: [
                                        // Light image
                                        Positioned.fill(
                                          child: Image.asset(
                                            'images/big_bulb.png',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    color: Color(0xFFF5F0EB),
                                                    child: Center(
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .lightbulb_fill,
                                                        size: 80,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                        ),
                                        // Glow overlay
                                        if (isLightOn)
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            height: 120,
                                            child: AnimatedOpacity(
                                              duration: Duration(
                                                milliseconds: 300,
                                              ),
                                              opacity: brightness,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      selectedColor.withOpacity(
                                                        0.6,
                                                      ),
                                                      selectedColor.withOpacity(
                                                        0.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),

                              // Vertical brightness slider
                              _buildVerticalBrightnessSlider(primaryColor),
                              SizedBox(width: 25),

                              // Color picker section
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildColorWheel(primaryColor),
                                  SizedBox(height: 20),
                                  _buildColorPresets(primaryColor),
                                ],
                              ),
                              SizedBox(width: 20.0),

                              // Right section: Control buttons panel
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F0EB),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // First row: Night & Saver
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildElegantButton(
                                                icon: CupertinoIcons.moon_fill,
                                                label: 'Night',
                                                primaryColor: primaryColor,
                                                onTap: () {
                                                  setState(() {
                                                    brightness = 0.2;
                                                    selectedColor = Color(
                                                      0xFFFFE0B2,
                                                    );
                                                  });
                                                  _updateHexColor(
                                                    Color(0xFFFFE0B2),
                                                  );
                                                },
                                              ),
                                              _buildElegantButton(
                                                icon: CupertinoIcons
                                                    .leaf_arrow_circlepath,
                                                label: 'Saver',
                                                primaryColor: primaryColor,
                                                onTap: () {
                                                  setState(() {
                                                    brightness = 0.5;
                                                    selectedColor = Color(
                                                      0xFFFFF9C4,
                                                    );
                                                  });
                                                  _updateHexColor(
                                                    Color(0xFFFFF9C4),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Second row: Dim (centered)
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              _buildElegantButton(
                                                icon: CupertinoIcons.drop_fill,
                                                label: 'Dim',
                                                primaryColor: primaryColor,
                                                onTap: () {
                                                  setState(() {
                                                    brightness = 0.3;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
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

  /// Builds vertical brightness slider with bulb icon
  Widget _buildVerticalBrightnessSlider(Color primaryColor) {
    const double sliderHeight = 300;
    const double iconSize = 44;
    const double iconPadding = 5; // Padding from top and bottom edges

    // Calculate icon position - clamp to stay within bounds
    final double iconBottom =
        ((sliderHeight - iconSize - iconPadding * 2) * brightness) +
        iconPadding;

    return Container(
      width: 55,
      height: sliderHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Filled portion
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              height: sliderHeight * brightness,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(26),
              ),
            ),
          ),
          // Bulb icon indicator - clamped to stay within slider
          Positioned(
            bottom: iconBottom,
            child: Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor, width: 2),
              ),
              child: Icon(
                CupertinoIcons.lightbulb,
                color: primaryColor,
                size: 22,
              ),
            ),
          ),
          // Gesture detector
          Positioned.fill(
            child: GestureDetector(
              onVerticalDragUpdate: isLightOn
                  ? (details) {
                      setState(() {
                        double newBrightness =
                            1 - (details.localPosition.dy / sliderHeight);
                        brightness = newBrightness.clamp(0.0, 1.0);
                      });
                    }
                  : null,
              onVerticalDragEnd: isLightOn
                  ? (_) {
                      _updateIntensity(brightness);
                    }
                  : null,
              onTapDown: isLightOn
                  ? (details) {
                      setState(() {
                        double newBrightness =
                            1 - (details.localPosition.dy / sliderHeight);
                        brightness = newBrightness.clamp(0.0, 1.0);
                      });
                    }
                  : null,
              onTapUp: isLightOn
                  ? (_) {
                      _updateIntensity(brightness);
                    }
                  : null,
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds RGB color wheel picker with position indicator
  Widget _buildColorWheel(Color primaryColor) {
    const double wheelSize = 180;
    const double wheelRadius = wheelSize / 2;

    return GestureDetector(
      onPanUpdate: isLightOn
          ? (details) {
              _updateColorFromPosition(details.localPosition, wheelRadius);
            }
          : null,
      onPanEnd: isLightOn
          ? (_) {
              // Write to Firebase when user finishes dragging
              _updateHexColor(selectedColor);
            }
          : null,
      onTapDown: isLightOn
          ? (details) {
              _updateColorFromPosition(details.localPosition, wheelRadius);
            }
          : null,
      onTapUp: isLightOn
          ? (_) {
              // Write to Firebase when user taps
              _updateHexColor(selectedColor);
            }
          : null,
      child: Container(
        width: wheelSize,
        height: wheelSize,
        child: Stack(
          children: [
            // Color wheel
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.cyan,
                    Colors.blue,
                    Colors.purple,
                    Colors.pink,
                    Colors.red,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  ),
                ),
              ),
            ),
            // Color indicator dot showing current selection
            Positioned(
              left: wheelRadius + _indicatorPosition.dx - 10,
              top: wheelRadius + _indicatorPosition.dy - 10,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Updates selected color and indicator position based on touch
  void _updateColorFromPosition(Offset position, double radius) {
    final center = Offset(radius, radius);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;

    // Calculate distance from center
    double distance = math.sqrt(dx * dx + dy * dy);

    // Clamp to wheel radius
    double clampedDistance = distance.clamp(0.0, radius - 10);

    // Calculate angle
    double angle = math.atan2(dy, dx);
    if (angle < 0) angle += 2 * math.pi;

    // Calculate saturation (0 at center, 1 at edge)
    double saturation = clampedDistance / (radius - 10);

    // Convert angle to hue (0-360)
    double hue = (angle / (2 * math.pi)) * 360;

    // Update indicator position (normalized to clamped distance)
    double normalizedDx = clampedDistance * math.cos(angle);
    double normalizedDy = clampedDistance * math.sin(angle);

    setState(() {
      selectedColor = HSVColor.fromAHSV(1.0, hue, saturation, 1.0).toColor();
      _indicatorPosition = Offset(normalizedDx, normalizedDy);
    });
  }

  /// Builds color preset circles
  Widget _buildColorPresets(Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...presetColors.map(
          (color) => GestureDetector(
            onTap: isLightOn
                ? () {
                    setState(() {
                      selectedColor = color;
                      _indicatorPosition = const Offset(-50, 30);
                    });
                    _updateHexColor(color);
                  }
                : null,
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedColor == color
                      ? primaryColor
                      : Colors.grey[300]!,
                  width: selectedColor == color ? 3 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Add custom color button
        GestureDetector(
          onTap: isLightOn ? () {} : null,
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Icon(CupertinoIcons.add, color: Colors.grey[400], size: 20),
          ),
        ),
      ],
    );
  }

  /// Builds elegant control button (consistent with camera_screen)
  Widget _buildElegantButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: isLightOn ? onTap : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isLightOn ? primaryColor : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: imagePath != null
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(imagePath, color: Colors.white),
                  )
                : Icon(icon, color: Colors.white, size: 32),
          ),
          SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isLightOn ? primaryColor : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
