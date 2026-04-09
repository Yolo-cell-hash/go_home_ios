import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/services/preset_override_helper.dart';

/// AC control screen with temperature adjustment
class AcControlScreen extends StatefulWidget {
  const AcControlScreen({super.key});

  @override
  State<AcControlScreen> createState() => _AcControlScreenState();
}

class _AcControlScreenState extends State<AcControlScreen> {
  bool isAcOn = false;
  int acTemp = 22; // default temperature (range: 16-26)
  bool _isLoading = true;

  // Firebase database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  // Stream subscriptions for real-time updates
  StreamSubscription<DatabaseEvent>? _acSubscription;
  StreamSubscription<DatabaseEvent>? _tempSubscription;

  @override
  void initState() {
    super.initState();
    _fetchFirebaseState();
    _setupFirebaseListeners();
  }

  @override
  void dispose() {
    _acSubscription?.cancel();
    _tempSubscription?.cancel();
    super.dispose();
  }

  /// Fetch initial state from Firebase
  Future<void> _fetchFirebaseState() async {
    print('[DEBUG] AcControlScreen: Fetching initial Firebase state...');
    try {
      // Fetch AC toggle state
      final acSnapshot = await _dbRef.child('ac').get();
      if (acSnapshot.exists) {
        final acValue = acSnapshot.value as bool?;
        setState(() {
          isAcOn = acValue ?? false;
        });
        print('[DEBUG] AcControlScreen: AC state = $isAcOn');
      }

      // Fetch AC temperature value
      final tempSnapshot = await _dbRef.child('ac-temp').get();
      if (tempSnapshot.exists) {
        final tempValue = tempSnapshot.value;
        if (tempValue != null) {
          final intValue = (tempValue as num).toInt();
          setState(() {
            acTemp = intValue.clamp(16, 26);
          });
          print('[DEBUG] AcControlScreen: AC temp = $acTemp');
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('[ERROR] AcControlScreen: Failed to fetch Firebase data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Setup real-time Firebase listeners
  void _setupFirebaseListeners() {
    // Listen to AC toggle changes
    _acSubscription = _dbRef.child('ac').onValue.listen((event) {
      if (event.snapshot.exists) {
        final acValue = event.snapshot.value as bool?;
        if (mounted && acValue != null && acValue != isAcOn) {
          setState(() {
            isAcOn = acValue;
          });
          print('[DEBUG] AcControlScreen: AC state updated to $isAcOn');
        }
      }
    });

    // Listen to AC temperature changes
    _tempSubscription = _dbRef.child('ac-temp').onValue.listen((event) {
      if (event.snapshot.exists) {
        final tempValue = event.snapshot.value;
        if (mounted && tempValue != null) {
          final intValue = (tempValue as num).toInt().clamp(16, 26);
          if (intValue != acTemp) {
            setState(() {
              acTemp = intValue;
            });
            print('[DEBUG] AcControlScreen: AC temp updated to $acTemp');
          }
        }
      }
    });
  }

  /// Update AC toggle state — with preset override check
  Future<void> _updateAcState(bool value) async {
    await PresetOverrideHelper.updateWithCheck(
      context: context,
      dbKey: 'ac',
      newValue: value,
      deviceName: 'Air Conditioner',
    );
  }

  /// Update AC temperature — with preset override check
  Future<void> _updateAcTemp(int temp) async {
    final clampedTemp = temp.clamp(16, 26);
    await PresetOverrideHelper.updateWithCheck(
      context: context,
      dbKey: 'ac-temp',
      newValue: clampedTemp,
      deviceName: 'AC Temperature',
    );
  }

  /// Decrease AC temperature
  void _decreaseTemp() {
    if (!isAcOn || acTemp <= 16) return;
    final newTemp = acTemp - 1;
    setState(() {
      acTemp = newTemp;
    });
    _updateAcTemp(newTemp);
  }

  /// Increase AC temperature
  void _increaseTemp() {
    if (!isAcOn || acTemp >= 26) return;
    final newTemp = acTemp + 1;
    setState(() {
      acTemp = newTemp;
    });
    _updateAcTemp(newTemp);
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
          NavbarSetup(theme: theme, imgPath: 'ac', label: 'Air-Conditioner'),

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
                        // Title with icon and toggle - "Air-Conditioner"
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
                                  'images/ac.png',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 35),
                            Text(
                              'Air-Conditioner',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.black,
                              ),
                            ),
                            SizedBox(width: 20),
                            // Power toggle switch - synced with Firebase
                            CupertinoSwitch(
                              value: isAcOn,
                              onChanged: (val) {
                                setState(() => isAcOn = val);
                                _updateAcState(val);
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
                              // Left section: AC image + temperature control
                              Expanded(
                                flex: 3,
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
                                    child: Row(
                                      children: [
                                        // AC image on the left
                                        Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                            'images/img_ac_main.png',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    color: Color(0xFFF5F0EB),
                                                    child: Center(
                                                      child: Icon(
                                                        CupertinoIcons.snow,
                                                        size: 60,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                        ),
                                        // Temperature control on the right
                                        Expanded(
                                          flex: 3,
                                          child: _buildTemperatureControl(
                                            primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),

                              // Right section: Mode buttons panel
                              Expanded(
                                flex: 2,
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
                                    horizontal: 30,
                                    vertical: 25,
                                  ),
                                  child: _buildModeButtons(primaryColor),
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

  /// Builds the temperature control widget with circular dial
  Widget _buildTemperatureControl(Color primaryColor) {
    final bool isEnabled = isAcOn;
    final Color disabledColor = Colors.grey[350]!;
    final Color activeColor = primaryColor;

    // Check if at min/max limits
    final bool canDecrease = isEnabled && acTemp > 16;
    final bool canIncrease = isEnabled && acTemp < 26;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decrease button
              GestureDetector(
                onTap: canDecrease ? _decreaseTemp : null,
                child: Container(
                  width: 38,
                  height: 38,
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
                    size: 18,
                  ),
                ),
              ),
              SizedBox(width: 15),

              // Temperature display circle with ring
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isEnabled
                        ? Color(0xFFA8B84A) // olive green ring as in ref
                        : disabledColor,
                    width: 3,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isEnabled ? activeColor : disabledColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$acTemp°C',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),

              // Increase button
              GestureDetector(
                onTap: canIncrease ? _increaseTemp : null,
                child: Container(
                  width: 38,
                  height: 38,
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
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // On/Off indicator
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isEnabled ? Color(0xFFA8B84A) : Colors.grey[400],
                ),
              ),
              SizedBox(width: 6),
              Text(
                isEnabled ? 'On' : 'Off',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isEnabled ? Color(0xFFA8B84A) : Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds AC mode buttons (Auto, Cool, Dry, Timer)
  Widget _buildModeButtons(Color primaryColor) {
    final bool isEnabled = isAcOn;
    final Color disabledColor = Colors.grey[350]!;
    final Color activeColor = isEnabled ? primaryColor : disabledColor;

    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 18,
        alignment: WrapAlignment.center,
        children: [
          _buildModeButton(
            icon: CupertinoIcons.thermometer,
            label: 'Auto',
            color: activeColor,
            isEnabled: isEnabled,
          ),
          _buildModeButton(
            icon: CupertinoIcons.snow,
            label: 'Cool',
            color: activeColor,
            isEnabled: isEnabled,
          ),
          _buildModeButton(
            icon: CupertinoIcons.drop,
            label: 'Dry',
            color: activeColor,
            isEnabled: isEnabled,
          ),
          _buildModeButton(
            icon: CupertinoIcons.timer,
            label: 'Timer',
            color: activeColor,
            isEnabled: isEnabled,
          ),
        ],
      ),
    );
  }

  /// Builds a single mode button
  Widget _buildModeButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool isEnabled,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
