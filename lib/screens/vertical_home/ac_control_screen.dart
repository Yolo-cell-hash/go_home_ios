import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/services/preset_override_helper.dart';
import 'package:godrej_home/services/godrej_ac_api_service.dart';
import 'package:godrej_home/screens/home_screen.dart';

/// AC control screen with temperature adjustment — powered by Godrej AC cloud API.
/// Preset override logic is preserved: presets still live in Firebase/SharedPreferences.
class AcControlScreen extends StatefulWidget {
  const AcControlScreen({super.key});

  @override
  State<AcControlScreen> createState() => _AcControlScreenState();
}

class _AcControlScreenState extends State<AcControlScreen> {
  // ── AC state from API ──
  bool isAcOn = false;
  int acTemp = 22; // default temperature (range: 16-30)
  String acMode = 'cool'; // cool, dry, auto, fan
  String fanSpeed = 'Low'; // Low, Medium, High, Auto
  bool isSwingOn = false;
  bool isSwingHOn = false; // horizontal swing
  bool isTurboOn = false;
  bool isDisplayOn = true; // AC LED display
  bool isSleepOn = false;
  bool isHygieneOn = false;
  bool isIndoorNoiseOn = false;

  bool _isLoading = true;

  // Selected mode index for UI highlight: 0=Auto, 1=Cool, 2=Dry, 3=Fan
  int _selectedModeIndex = -1;

  // Selected fan speed index: 0=Low, 1=Medium, 2=High, 3=Auto
  int _selectedFanSpeedIndex = 0;

  // ── Polling timer for API state sync ──
  Timer? _pollTimer;
  static const Duration _pollInterval = Duration(seconds: 10);

  // ── Firebase reference (still needed for preset automation-flags writes) ──
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'automation-flags',
  );

  // Stream subscriptions for real-time Firebase updates on ac/ac-temp/ac-mode/ac-fan-speed
  // (keeps the room control grid synced when API changes these values)
  StreamSubscription<DatabaseEvent>? _acSubscription;
  StreamSubscription<DatabaseEvent>? _tempSubscription;
  StreamSubscription<DatabaseEvent>? _modeSubscription;
  StreamSubscription<DatabaseEvent>? _fanSpeedSubscription;

  // Cached active preset — fetched once on screen open
  ActivePresetInfo? _activePreset;

  // API service reference
  final _api = GodrejAcApiService.instance;

  @override
  void initState() {
    super.initState();
    _fetchAcState();
    _startPolling();
    _loadActivePreset();
    _setupFirebaseListeners();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _acSubscription?.cancel();
    _tempSubscription?.cancel();
    _modeSubscription?.cancel();
    _fanSpeedSubscription?.cancel();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Deferred preset override: write immediately, accumulate for exit prompt
  // ---------------------------------------------------------------------------

  // Accumulated changes made during this session (dbKey → latest value).
  // Compared against _activePreset on exit to decide whether to prompt.
  final Map<String, dynamic> _pendingChanges = {};

  /// Load the active preset on screen open for override detection
  Future<void> _loadActivePreset() async {
    final preset = await PresetOverrideHelper.fetchActivePreset();
    if (mounted) {
      setState(() {
        _activePreset = preset;
      });
      print(
        '[DEBUG] AcControlScreen: Active preset loaded: '
        '${preset?.presetLabel ?? "none"}',
      );
    }
  }

  /// Apply a change immediately (automation-flags) and record it for the exit
  /// dialog. No per-change dialog is shown.
  void _applyChange(String dbKey, dynamic newValue) {
    PresetOverrideHelper.writeToAutomationFlags(dbKey, newValue);
    _pendingChanges[dbKey] = newValue;
    print('[DEBUG] AcControlScreen: Applied $dbKey = $newValue '
        '(pending: $_pendingChanges)');
  }

  // ---------------------------------------------------------------------------
  // Firebase listeners (keep room grid synced)
  // ---------------------------------------------------------------------------

  /// Setup real-time Firebase listeners for the room control grid sync.
  void _setupFirebaseListeners() {
    _acSubscription = _dbRef.child('ac').onValue.listen((event) {
      if (event.snapshot.exists) {
        final acValue = event.snapshot.value as bool?;
        if (mounted && acValue != null && acValue != isAcOn) {
          // Firebase value changed externally (e.g. preset selected) —
          // sync the API device too
          print(
            '[DEBUG] AcControlScreen: Firebase ac changed to $acValue — syncing API',
          );
          _api.setAcParam('Power', acValue);
          setState(() {
            isAcOn = acValue;
          });
        }
      }
    });

    _tempSubscription = _dbRef.child('ac-temp').onValue.listen((event) {
      if (event.snapshot.exists) {
        final tempValue = event.snapshot.value;
        if (mounted && tempValue != null) {
          final intValue = (tempValue as num).toInt().clamp(16, 30);
          if (intValue != acTemp) {
            print(
              '[DEBUG] AcControlScreen: Firebase ac-temp changed to $intValue',
            );
            // Only sync to API if AC is ON — avoid turning AC on
            if (isAcOn) {
              _api.setAcParam('Temperature', intValue);
            }
            setState(() {
              acTemp = intValue;
            });
          }
        }
      }
    });

    // Listen to AC mode changes from preset
    _modeSubscription = _dbRef.child('ac-mode').onValue.listen((event) {
      if (event.snapshot.exists) {
        final modeValue = event.snapshot.value;
        if (mounted && modeValue != null) {
          final modeStr = modeValue.toString().toLowerCase();
          if (modeStr != acMode) {
            print(
              '[DEBUG] AcControlScreen: Firebase ac-mode changed to $modeStr',
            );
            // Only sync to API if AC is ON
            if (isAcOn) {
              _api.setAcParam('Mode', modeStr);
            }
            setState(() {
              acMode = modeStr;
              _selectedModeIndex = _modeToIndex(acMode);
            });
          }
        }
      }
    });

    // Listen to AC fan speed changes from preset
    _fanSpeedSubscription = _dbRef.child('ac-fan-speed').onValue.listen((event) {
      if (event.snapshot.exists) {
        final speedValue = event.snapshot.value;
        if (mounted && speedValue != null) {
          final speedStr = speedValue.toString();
          if (speedStr != fanSpeed) {
            print(
              '[DEBUG] AcControlScreen: Firebase ac-fan-speed changed to $speedStr',
            );
            // Only sync to API if AC is ON
            if (isAcOn) {
              _api.setAcParam('Fan Speed', speedStr);
            }
            setState(() {
              fanSpeed = speedStr;
              _selectedFanSpeedIndex = _fanSpeedToIndex(fanSpeed);
            });
          }
        }
      }
    });
  }

  // ---------------------------------------------------------------------------
  // API interactions
  // ---------------------------------------------------------------------------

  /// Fetch current AC state from the cloud API.
  Future<void> _fetchAcState() async {
    print('[DEBUG] AcControlScreen: Fetching AC state from API...');
    try {
      final acData = await _api.getAcParams();
      if (acData != null && mounted) {
        setState(() {
          isAcOn = acData['Power'] as bool? ?? false;
          acTemp = (acData['Temperature'] as num?)?.toInt().clamp(16, 30) ?? 22;
          acMode = (acData['Mode'] as String?)?.toLowerCase() ?? 'cool';
          fanSpeed = acData['Fan Speed'] as String? ?? 'Low';
          isSwingOn = acData['Swing'] as bool? ?? false;
          isSwingHOn = acData['SwingH'] as bool? ?? false;
          isTurboOn = acData['Turbo'] as bool? ?? false;
          isDisplayOn = acData['Display'] as bool? ?? true;
          isSleepOn = acData['Sleep'] as bool? ?? false;
          isHygieneOn = acData['Hygiene'] as bool? ?? false;
          isIndoorNoiseOn = acData['IndoorNoise'] as bool? ?? false;
          _selectedModeIndex = _modeToIndex(acMode);
          _selectedFanSpeedIndex = _fanSpeedToIndex(fanSpeed);
          _isLoading = false;
        });
        print(
          '[DEBUG] AcControlScreen: API state loaded — '
          'Power=$isAcOn, Temp=$acTemp, Mode=$acMode, Fan=$fanSpeed, '
          'Swing=$isSwingOn, SwingH=$isSwingHOn, Display=$isDisplayOn, '
          'Sleep=$isSleepOn, Hygiene=$isHygieneOn',
        );
      } else {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    } catch (e) {
      print('[ERROR] AcControlScreen: Failed to fetch API data: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Start periodic polling to keep UI in sync with device state.
  void _startPolling() {
    _pollTimer = Timer.periodic(_pollInterval, (_) async {
      if (!mounted) return;
      final acData = await _api.getAcParams();
      if (acData != null && mounted) {
        setState(() {
          isAcOn = acData['Power'] as bool? ?? isAcOn;
          acTemp =
              (acData['Temperature'] as num?)?.toInt().clamp(16, 30) ?? acTemp;
          acMode = (acData['Mode'] as String?)?.toLowerCase() ?? acMode;
          fanSpeed = acData['Fan Speed'] as String? ?? fanSpeed;
          isSwingOn = acData['Swing'] as bool? ?? isSwingOn;
          isSwingHOn = acData['SwingH'] as bool? ?? isSwingHOn;
          isTurboOn = acData['Turbo'] as bool? ?? isTurboOn;
          isDisplayOn = acData['Display'] as bool? ?? isDisplayOn;
          isSleepOn = acData['Sleep'] as bool? ?? isSleepOn;
          isHygieneOn = acData['Hygiene'] as bool? ?? isHygieneOn;
          isIndoorNoiseOn = acData['IndoorNoise'] as bool? ?? isIndoorNoiseOn;
          _selectedModeIndex = _modeToIndex(acMode);
          _selectedFanSpeedIndex = _fanSpeedToIndex(fanSpeed);
        });
      }
    });
  }

  // ---------------------------------------------------------------------------
  // AC control actions — deferred preset override
  // ---------------------------------------------------------------------------

  /// Update AC power state — API + Firebase (deferred preset check)
  void _updateAcState(bool value) {
    // Optimistic UI update
    setState(() => isAcOn = value);

    // Call API to update device
    _api.setAcParam('Power', value);

    // Write to automation-flags + accumulate for exit dialog
    _applyChange('ac', value);
  }

  /// Update AC temperature — API + Firebase (deferred preset check)
  void _updateAcTemp(int temp) {
    final clampedTemp = temp.clamp(16, 30);

    // Optimistic UI update
    setState(() => acTemp = clampedTemp);

    // Call API to update device
    _api.setAcParam('Temperature', clampedTemp);

    // Write to automation-flags + accumulate for exit dialog
    _applyChange('ac-temp', clampedTemp);
  }

  /// Update AC mode — API + Firebase (deferred preset check)
  void _updateAcMode(String mode) {
    final modeLower = mode.toLowerCase();
    setState(() {
      acMode = modeLower;
      _selectedModeIndex = _modeToIndex(acMode);
    });
    _api.setAcParam('Mode', modeLower);

    // Write to automation-flags + accumulate for exit dialog
    _applyChange('ac-mode', modeLower);
    print('[DEBUG] AcControlScreen: Mode set to $mode');
  }

  /// Update fan speed — API + Firebase (deferred preset check)
  void _updateFanSpeed(String speed) {
    setState(() {
      fanSpeed = speed;
      _selectedFanSpeedIndex = _fanSpeedToIndex(speed);
    });
    _api.setAcParam('Fan Speed', speed);

    // Write to automation-flags + accumulate for exit dialog
    _applyChange('ac-fan-speed', speed);
    print('[DEBUG] AcControlScreen: Fan speed set to $speed');
  }

  /// Toggle vertical swing — API only
  void _toggleSwing() {
    final newVal = !isSwingOn;
    setState(() => isSwingOn = newVal);
    _api.setAcParam('Swing', newVal);
    print('[DEBUG] AcControlScreen: Swing set to $newVal');
  }

  /// Toggle horizontal swing — API only
  void _toggleSwingH() {
    final newVal = !isSwingHOn;
    setState(() => isSwingHOn = newVal);
    _api.setAcParam('SwingH', newVal);
    print('[DEBUG] AcControlScreen: SwingH set to $newVal');
  }

  /// Toggle turbo — API only
  void _toggleTurbo() {
    final newVal = !isTurboOn;
    setState(() => isTurboOn = newVal);
    _api.setAcParam('Turbo', newVal);
    print('[DEBUG] AcControlScreen: Turbo set to $newVal');
  }

  /// Toggle display (AC LED) — API only
  void _toggleDisplay() {
    final newVal = !isDisplayOn;
    setState(() => isDisplayOn = newVal);
    _api.setAcParam('Display', newVal);
    print('[DEBUG] AcControlScreen: Display set to $newVal');
  }

  /// Toggle sleep mode — API only
  void _toggleSleep() {
    final newVal = !isSleepOn;
    setState(() => isSleepOn = newVal);
    _api.setAcParam('Sleep', newVal);
    print('[DEBUG] AcControlScreen: Sleep set to $newVal');
  }

  /// Toggle hygiene mode — API only
  void _toggleHygiene() {
    final newVal = !isHygieneOn;
    setState(() => isHygieneOn = newVal);
    _api.setAcParam('Hygiene', newVal);
    print('[DEBUG] AcControlScreen: Hygiene set to $newVal');
  }

  /// Toggle indoor noise reduction — API only
  void _toggleIndoorNoise() {
    final newVal = !isIndoorNoiseOn;
    setState(() => isIndoorNoiseOn = newVal);
    _api.setAcParam('IndoorNoise', newVal);
    print('[DEBUG] AcControlScreen: IndoorNoise set to $newVal');
  }

  /// Decrease AC temperature
  void _decreaseTemp() {
    if (!isAcOn || acTemp <= 16) return;
    _updateAcTemp(acTemp - 1);
  }

  /// Increase AC temperature
  void _increaseTemp() {
    if (!isAcOn || acTemp >= 30) return;
    _updateAcTemp(acTemp + 1);
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  int _modeToIndex(String mode) {
    switch (mode.toLowerCase()) {
      case 'auto':
        return 0;
      case 'cool':
        return 1;
      case 'dry':
        return 2;
      case 'fan':
        return 3;
      default:
        return -1;
    }
  }

  int _fanSpeedToIndex(String speed) {
    switch (speed) {
      case 'Low':
        return 0;
      case 'Medium':
        return 1;
      case 'High':
        return 2;
      case 'Auto':
        return 3;
      default:
        return 0;
    }
  }

  String _indexToFanSpeed(int index) {
    switch (index) {
      case 0:
        return 'Low';
      case 1:
        return 'Medium';
      case 2:
        return 'High';
      case 3:
        return 'Auto';
      default:
        return 'Low';
    }
  }

  // ---------------------------------------------------------------------------
  // Exit handling — show single dialog if changes differ from preset
  // ---------------------------------------------------------------------------

  /// Called when the user tries to leave the screen (back button or home logo).
  Future<void> _handleExit({bool isHomeTap = false}) async {
    if (PresetOverrideHelper.hasPendingPresetChanges(
      activePreset: _activePreset,
      pendingChanges: _pendingChanges,
    )) {
      final shouldPop = await PresetOverrideHelper.showExitOverrideDialog(
        context: context,
        activePreset: _activePreset!,
        pendingChanges: _pendingChanges,
      );
      if (!shouldPop || !mounted) return;
    }

    if (!mounted) return;

    if (isHomeTap) {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        ModalRoute.withName('/home'),
      );
    } else {
      Navigator.pop(context);
    }
  }

  /// PopScope callback — intercepts system back gesture / button.
  Future<bool> _onPopInvoked() async {
    if (PresetOverrideHelper.hasPendingPresetChanges(
      activePreset: _activePreset,
      pendingChanges: _pendingChanges,
    )) {
      final shouldPop = await PresetOverrideHelper.showExitOverrideDialog(
        context: context,
        activePreset: _activePreset!,
        pendingChanges: _pendingChanges,
      );
      return shouldPop;
    }
    return true;
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onPopInvoked();
        if (shouldPop && mounted) {
          Navigator.pop(context);
        }
      },
      child: CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          // Use existing NavbarSetup widget
          NavbarSetup(
            theme: theme,
            imgPath: 'ac',
            label: 'Air-Conditioner',
            onBackPressed: () => _handleExit(),
            onHomeTap: () => _handleExit(isHomeTap: true),
          ),

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
                            // Power toggle switch - synced with API
                            CupertinoSwitch(
                              value: isAcOn,
                              onChanged: (val) {
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

                              // Right section: Mode buttons + Fan Speed + Toggles
                              Expanded(
                                flex: 2,
                                child: Container(
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
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: _buildRightPanel(primaryColor),
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
    final bool canIncrease = isEnabled && acTemp < 30;

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

  /// Builds the right panel with Mode, Fan Speed, and Toggle controls
  Widget _buildRightPanel(Color primaryColor) {
    final bool isEnabled = isAcOn;
    final Color disabledColor = Colors.grey[350]!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Mode buttons ──
          _buildSectionLabel('Mode', isEnabled),
          SizedBox(height: 8),
          _buildModeButtons(primaryColor),
          SizedBox(height: 14),

          // ── Fan Speed ──
          _buildSectionLabel('Fan Speed', isEnabled),
          SizedBox(height: 8),
          _buildFanSpeedSelector(primaryColor),
          SizedBox(height: 14),

          // ── Row 1: V-Swing & H-Swing ──
          Row(
            children: [
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.arrow_up_arrow_down,
                  label: 'V-Swing',
                  isActive: isSwingOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleSwing : null,
                  primaryColor: primaryColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.arrow_left,
                  label: 'H-Swing',
                  isActive: isSwingHOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleSwingH : null,
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // ── Row 2: Turbo & Sleep ──
          Row(
            children: [
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.bolt_fill,
                  label: 'Turbo',
                  isActive: isTurboOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleTurbo : null,
                  primaryColor: primaryColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.moon_fill,
                  label: 'Sleep',
                  isActive: isSleepOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleSleep : null,
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // ── Row 3: Display & Hygiene ──
          Row(
            children: [
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.light_max,
                  label: 'Display',
                  isActive: isDisplayOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleDisplay : null,
                  primaryColor: primaryColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.shield_fill,
                  label: 'Hygiene',
                  isActive: isHygieneOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleHygiene : null,
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // ── Row 4: Indoor Noise ──
          Row(
            children: [
              Expanded(
                child: _buildToggleChip(
                  icon: CupertinoIcons.speaker_slash_fill,
                  label: 'Quiet',
                  isActive: isIndoorNoiseOn && isEnabled,
                  isEnabled: isEnabled,
                  onTap: isEnabled ? _toggleIndoorNoise : null,
                  primaryColor: primaryColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(child: SizedBox()), // Empty space for alignment
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label, bool isEnabled) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: isEnabled ? CupertinoColors.black : Colors.grey[400],
        letterSpacing: 0.5,
      ),
    );
  }

  /// Builds AC mode buttons (Auto, Cool, Dry, Fan) — now functional
  Widget _buildModeButtons(Color primaryColor) {
    final bool isEnabled = isAcOn;
    final Color disabledColor = Colors.grey[350]!;

    final modes = [
      {'icon': CupertinoIcons.thermometer, 'label': 'Auto', 'value': 'auto'},
      {'icon': CupertinoIcons.snow, 'label': 'Cool', 'value': 'cool'},
      {'icon': CupertinoIcons.drop, 'label': 'Dry', 'value': 'dry'},
      {'icon': CupertinoIcons.wind, 'label': 'Fan', 'value': 'fan'},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(modes.length, (index) {
        final mode = modes[index];
        final isSelected = _selectedModeIndex == index && isEnabled;
        final color = !isEnabled
            ? disabledColor
            : isSelected
            ? primaryColor
            : Colors.grey[500]!;

        return GestureDetector(
          onTap: isEnabled
              ? () => _updateAcMode(mode['value'] as String)
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? primaryColor.withOpacity(0.15) : null,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(mode['icon'] as IconData, color: color, size: 20),
              ),
              SizedBox(height: 4),
              Text(
                mode['label'] as String,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// Builds fan speed selector chips
  Widget _buildFanSpeedSelector(Color primaryColor) {
    final bool isEnabled = isAcOn;
    final speeds = ['Low', 'Med', 'High', 'Auto'];
    final speedValues = ['Low', 'Medium', 'High', 'Auto'];

    return Row(
      children: List.generate(speeds.length, (index) {
        final isSelected = _selectedFanSpeedIndex == index && isEnabled;
        return Expanded(
          child: GestureDetector(
            onTap: isEnabled ? () => _updateFanSpeed(speedValues[index]) : null,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor
                    : isEnabled
                    ? Colors.white
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isEnabled
                      ? isSelected
                            ? primaryColor
                            : Colors.grey[300]!
                      : Colors.grey[300]!,
                ),
              ),
              child: Center(
                child: Text(
                  speeds[index],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.white
                        : isEnabled
                        ? Colors.grey[600]
                        : Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Builds a small toggle chip for Swing/Turbo
  Widget _buildToggleChip({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isEnabled,
    required VoidCallback? onTap,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive
              ? primaryColor.withOpacity(0.15)
              : isEnabled
              ? Colors.white
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? primaryColor : Colors.grey[300]!,
            width: isActive ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive
                  ? primaryColor
                  : isEnabled
                  ? Colors.grey[500]
                  : Colors.grey[400],
            ),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isActive
                    ? primaryColor
                    : isEnabled
                    ? Colors.grey[600]
                    : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
