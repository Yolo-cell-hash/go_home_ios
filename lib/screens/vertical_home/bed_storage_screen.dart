import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godrej_home/utils/ble_util.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Bed Storage control screen with BLE integration
class BedStorageScreen extends StatefulWidget {
  const BedStorageScreen({super.key});

  @override
  State<BedStorageScreen> createState() => _BedStorageScreenState();
}

class _BedStorageScreenState extends State<BedStorageScreen> {
  // Track selected button: 0=UP(Open), 1=STOP, 2=DOWN(Close), -1=none
  int _selectedButton = -1;

  // BLE controller instance (singleton)
  final BleController _bleController = BleController();

  // State tracking
  String _statusMessage = "Initializing...";
  BleConnectionStatus _connectionStatus = BleConnectionStatus.disconnected;
  bool _isScanning = false;

  // Stream subscriptions
  StreamSubscription<String>? _statusSubscription;
  StreamSubscription<BleConnectionStatus>? _connectionSubscription;
  StreamSubscription<bool>? _scanningSubscription;

  @override
  void initState() {
    super.initState();
    print('[BED STORAGE DEBUG] initState() - Setting up BLE listeners');
    _setupBleListeners();
    print(
      '[BED STORAGE DEBUG] Calling forceReconnect() to scan for EB device...',
    );
    _bleController.forceReconnect();
  }

  void _setupBleListeners() {
    print(
      '[BED STORAGE DEBUG] _setupBleListeners() - Setting up stream listeners',
    );

    // Listen to status messages
    _statusSubscription = _bleController.statusStream.listen((status) {
      print('[BED STORAGE DEBUG] Status stream update: $status');
      if (mounted) {
        setState(() {
          _statusMessage = status;
        });
      }
    });

    // Listen to connection status changes
    _connectionSubscription = _bleController.connectionStatusStream.listen((
      status,
    ) {
      print('[BED STORAGE DEBUG] Connection status stream update: $status');
      if (mounted) {
        setState(() {
          _connectionStatus = status;
        });
      }
    });

    // Listen to scanning state
    _scanningSubscription = _bleController.isScanningStream.listen((scanning) {
      print('[BED STORAGE DEBUG] Scanning state stream update: $scanning');
      if (mounted) {
        setState(() {
          _isScanning = scanning;
        });
      }
    });
  }

  @override
  void dispose() {
    _statusSubscription?.cancel();
    _connectionSubscription?.cancel();
    _scanningSubscription?.cancel();
    super.dispose();
  }

  /// Handle button tap and send BLE command
  /// Commands: OPEN->"open", STOP->"stop", CLOSE->"close" (case-sensitive, lowercase)
  void _handleCommand(int index, String command) async {
    print(
      '[BED STORAGE DEBUG] _handleCommand() - Button index: $index, Command: "$command"',
    );

    setState(() {
      _selectedButton = index;
    });

    print('[BED STORAGE DEBUG] Sending command "$command" to BLE device...');
    final success = await _bleController.sendCommand(command);

    if (success) {
      print('[BED STORAGE DEBUG] Command "$command" sent successfully!');
    } else {
      print('[BED STORAGE DEBUG] Failed to send command "$command"');
    }

    if (!success && mounted) {
      // Show toast/snackbar on failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send $command command'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red.shade400,
        ),
      );
    }
  }

  /// Get status indicator color based on connection status
  Color _getStatusColor() {
    switch (_connectionStatus) {
      case BleConnectionStatus.connected:
        return Colors.green;
      case BleConnectionStatus.scanning:
      case BleConnectionStatus.connecting:
        return Colors.orange;
      case BleConnectionStatus.disconnected:
      case BleConnectionStatus.error:
      case BleConnectionStatus.permissionDenied:
      case BleConnectionStatus.bluetoothOff:
        return Colors.red;
    }
  }

  /// Check if BLE is ready for commands
  bool get _isReady => _connectionStatus == BleConnectionStatus.connected;

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          // Use existing NavbarSetup widget
          NavbarSetup(theme: theme, imgPath: 'bedroom', label: 'Bed Storage'),

          // Main content area
          Expanded(
            child: Container(
              color: CupertinoColors.systemBackground,
              padding: EdgeInsets.only(
                left: 60.0,
                top: 30.0,
                bottom: 30.0,
                right: 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with icon and status indicator
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'images/bed_small.png',
                          height: 24.0,
                          width: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Bed Storage',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Spacer(),
                      // Status indicator with dot and text
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Scanning indicator or status dot
                            if (_isScanning)
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CupertinoActivityIndicator(radius: 8),
                              )
                            else
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: _getStatusColor(),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: _getStatusColor().withOpacity(0.4),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(width: 8),
                            Text(
                              _statusMessage,
                              style: TextStyle(
                                fontSize: 14,
                                color: _getStatusColor(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // Retry button when not connected and not scanning
                            if (_connectionStatus ==
                                    BleConnectionStatus.error ||
                                _connectionStatus ==
                                    BleConnectionStatus.disconnected)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  minSize: 0,
                                  onPressed: _isScanning
                                      ? null
                                      : _bleController.retryScan,
                                  child: Text(
                                    'Retry',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
                        // Left section: Image and control buttons
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F1EC),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'images/bed_storage_big.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                // Right half: Three circular buttons
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      // OPEN -> "open" command (lowercase, case-sensitive)
                                      _buildCircularButton(
                                        label: 'OPEN',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 0,
                                        isEnabled: _isReady,
                                        onTap: () => _handleCommand(0, "open"),
                                      ),
                                      SizedBox(height: 50.0),
                                      // STOP -> "stop" command (lowercase, case-sensitive)
                                      _buildCircularButton(
                                        label: 'STOP',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 1,
                                        isEnabled: _isReady,
                                        onTap: () => _handleCommand(1, "stop"),
                                      ),
                                      SizedBox(height: 50.0),
                                      // CLOSE -> "close" command (lowercase, case-sensitive)
                                      _buildCircularButton(
                                        label: 'CLOSE',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 2,
                                        isEnabled: _isReady,
                                        onTap: () => _handleCommand(2, "close"),
                                      ),
                                    ],
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
                          child: Center(
                            child: Container(
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F1EC),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // First row: Safety, Timer, Maintenance
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildElegantButton(
                                          icon: CupertinoIcons.shield,
                                          label: 'Safety',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle safety
                                          },
                                        ),
                                        _buildElegantButton(
                                          icon: CupertinoIcons.timer,
                                          label: 'Timer',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle timer
                                          },
                                        ),
                                        _buildElegantButton(
                                          icon: CupertinoIcons.settings,
                                          label: 'Maintenance',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle maintenance
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

  Widget _buildCircularButton({
    required String label,
    required Color primaryColor,
    required bool isSelected,
    required bool isEnabled,
    required VoidCallback onTap,
  }) {
    // Default color #E5E4DD, selected uses primaryColor
    // Disabled state uses grey
    final buttonColor = !isEnabled
        ? Colors.grey.shade300
        : isSelected
        ? primaryColor
        : Color(0xFFE5E4DD);
    final textColor = !isEnabled
        ? Colors.grey.shade500
        : isSelected
        ? Colors.white
        : primaryColor;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElegantButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: primaryColor,
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
              fontFamily: 'GEG',
              fontSize: 16.0,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
