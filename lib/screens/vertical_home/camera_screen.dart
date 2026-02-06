// vertical_home/camera_screen.dart
// CCTV Camera control screen with live video feed and PTZ controls
// Responsive layout for iPhone testing, optimized for iPad production

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/widgets/ja_camera_view.dart';
import 'package:godrej_home/widgets/ptz_controller.dart';
import 'package:godrej_home/services/ja_camera_service.dart';

/// CCTV Camera control screen with live video feed
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // Camera configuration - hardcoded for demo
  static const String _deviceId = '6659244802';
  static const String _deviceName = 'Main Camera';
  static const String _username = 'admin';
  static const String _password = '';
  static const int _channelCount = 1;

  // State
  bool _isLoading = true;
  bool _isConnected = false;
  bool _showPTZ = false;
  bool _isRecording = true;
  String? _errorMessage;
  StreamSubscription? _eventSubscription;

  @override
  void initState() {
    super.initState();
    print('[CameraScreen] initState called');
    _initializeCamera();
    _listenToEvents();
  }

  @override
  void dispose() {
    print('[CameraScreen] dispose called');
    _eventSubscription?.cancel();
    JACameraService.stopPlay();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    print('[CameraScreen] _initializeCamera started');
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Save camera configuration
      print('[CameraScreen] Saving camera configuration...');
      final saved = await JACameraService.saveCamera(
        cameraId: _deviceId,
        cameraName: _deviceName,
        username: _username,
        password: _password,
        channelCount: _channelCount,
      );
      print('[CameraScreen] Save camera result: $saved');

      if (!saved) {
        throw Exception('Failed to save camera configuration');
      }

      // Connect to camera
      print('[CameraScreen] Connecting to camera...');
      final connectResult = await JACameraService.connectCamera(_deviceId);
      print('[CameraScreen] Connect result: $connectResult');

      if (connectResult?['success'] != true) {
        throw Exception('Failed to connect to camera');
      }

      // Initialize live view
      print('[CameraScreen] Initializing live view...');
      await JACameraService.initLiveView();
      print('[CameraScreen] Live view initialized');

      print('[CameraScreen] Starting play...');
      await JACameraService.startPlay();
      print('[CameraScreen] Play started');

      if (mounted) {
        setState(() {
          _isConnected = true;
          _isLoading = false;
        });
        print('[CameraScreen] Camera connected successfully!');
      }
    } catch (e) {
      print('[CameraScreen] ERROR in _initializeCamera: $e');
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _listenToEvents() {
    print('[CameraScreen] Setting up event listener...');
    _eventSubscription = JACameraService.eventStream.listen((event) {
      print('[CameraScreen] Event received: $event');
      final type = event['type'] as String?;
      if (type == 'playError') {
        setState(() {
          _errorMessage = event['data']?['message'] ?? 'Playback error';
        });
      }
    });
  }

  Future<void> _handleCapture() async {
    print('[CameraScreen] Capture button pressed');
    final path = await JACameraService.capture();
    final success = path != null;
    print('[CameraScreen] Capture result: $success, path: $path');

    if (mounted) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(success ? 'Screenshot Saved' : 'Capture Failed'),
          content: Text(
            success
                ? 'Screenshot has been saved to your device.'
                : 'Failed to capture screenshot.',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  // Check if we're on a small screen (iPhone)
  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.shortestSide < 600;
    print(
      '[CameraScreen] isSmallScreen: $isSmall (shortestSide: ${size.shortestSide})',
    );
    return isSmall;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);
    final isSmallScreen = _isSmallScreen(context);
    final screenSize = MediaQuery.of(context).size;

    print(
      '[CameraScreen] build called - isSmallScreen: $isSmallScreen, size: $screenSize',
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Use existing NavbarSetup widget
            NavbarSetup(theme: theme, imgPath: 'camera', label: 'CCTV Camera'),

            // Main content area - responsive layout
            Expanded(
              child: isSmallScreen
                  ? _buildPhoneLayout(primaryColor, screenSize)
                  : _buildTabletLayout(primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  /// Phone layout - vertical stacking with fixed camera height
  Widget _buildPhoneLayout(Color primaryColor, Size screenSize) {
    // Calculate camera height to ensure controls fit
    final availableHeight =
        screenSize.height - 200; // Account for navbar and safe areas
    final cameraHeight = (availableHeight * 0.6).clamp(200.0, 400.0);

    print('[CameraScreen] Phone layout - cameraHeight: $cameraHeight');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          _buildTitle(primaryColor),
          const SizedBox(height: 12),

          // Camera feed with fixed height
          SizedBox(
            height: cameraHeight,
            child: _buildVideoFeedSection(primaryColor),
          ),
          const SizedBox(height: 16),

          // Control buttons - horizontal row for phone
          Expanded(child: _buildPhoneControlPanel(primaryColor)),
        ],
      ),
    );
  }

  /// Tablet (iPad) layout - horizontal side by side
  Widget _buildTabletLayout(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.only(
        left: 60.0,
        top: 30.0,
        bottom: 30.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          _buildTitle(primaryColor),
          const SizedBox(height: 30),

          // Main content row
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left section: Camera feed
                Expanded(flex: 5, child: _buildVideoFeedSection(primaryColor)),
                const SizedBox(width: 30),

                // Right section: Control buttons
                Expanded(flex: 3, child: _buildControlPanel(primaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(Color primaryColor) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'images/small_cctv.png',
            height: 24.0,
            width: 24.0,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'CCTV',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoFeedSection(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Video feed or placeholder
            Positioned.fill(child: _buildVideoContent()),

            // Recording indicator
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _isRecording && _isConnected
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _isConnected ? 'Live' : 'Offline',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // PTZ overlay - PTZController handles PTZ internally via JACameraService
            if (_showPTZ && _isConnected)
              Positioned(
                right: 10,
                bottom: 10,
                child: PTZController(
                  size: 100,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  buttonColor: Colors.white24,
                  activeButtonColor: primaryColor,
                  iconColor: Colors.white,
                ),
              ),

            // PTZ toggle button
            if (_isConnected)
              Positioned(
                left: 10,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    print('[CameraScreen] PTZ toggle pressed');
                    setState(() => _showPTZ = !_showPTZ);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _showPTZ
                          ? primaryColor
                          : Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.control_camera,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent() {
    print(
      '[CameraScreen] _buildVideoContent - isLoading: $_isLoading, errorMessage: $_errorMessage',
    );

    if (_isLoading) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoActivityIndicator(color: Colors.white, radius: 14),
              SizedBox(height: 10),
              Text(
                'Connecting to camera...',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  CupertinoIcons.exclamationmark_triangle,
                  color: Colors.orange,
                  size: 32,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Connection Failed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white54, fontSize: 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  color: CupertinoTheme.of(context).primaryColor,
                  minSize: 30,
                  onPressed: _initializeCamera,
                  child: const Text('Retry', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Show native camera view on iOS
    if (Platform.isIOS) {
      print('[CameraScreen] Rendering JACameraView widget');
      return JACameraView(
        deviceId: _deviceId,
        deviceName: _deviceName,
        username: _username,
        password: _password,
        channelCount: _channelCount,
        onViewCreated: (viewId, channelCount) {
          print(
            '[CameraScreen] JACameraView created: viewId=$viewId, channelCount=$channelCount',
          );
        },
      );
    } else {
      // Fallback for non-iOS platforms
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.camera_fill,
                size: 48,
                color: Colors.grey[500],
              ),
              const SizedBox(height: 8),
              Text(
                'Camera feed available on iOS only',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }
  }

  /// Phone control panel - horizontal layout
  Widget _buildPhoneControlPanel(Color primaryColor) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCompactButton(
            imagePath: 'images/privacy_mode.png',
            label: 'Capture',
            primaryColor: primaryColor,
            onTap: _handleCapture,
          ),
          _buildCompactButton(
            icon: CupertinoIcons.videocam_fill,
            label: 'Record',
            primaryColor: primaryColor,
            onTap: () {
              print('[CameraScreen] Record button pressed');
              setState(() => _isRecording = !_isRecording);
            },
          ),
          _buildCompactButton(
            icon: CupertinoIcons.camera_fill,
            label: 'PTZ',
            primaryColor: primaryColor,
            onTap: () {
              print('[CameraScreen] PTZ button pressed');
              setState(() => _showPTZ = !_showPTZ);
            },
          ),
          _buildCompactButton(
            imagePath: 'images/activity_trail.png',
            label: 'Activity',
            primaryColor: primaryColor,
            onTap: () {
              print('[CameraScreen] Activity button pressed');
            },
          ),
        ],
      ),
    );
  }

  /// Compact button for phone layout
  Widget _buildCompactButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: imagePath != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(imagePath, color: Colors.white),
                  )
                : Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// iPad control panel - vertical layout
  Widget _buildControlPanel(Color primaryColor) {
    return Center(
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F0EB),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First row: Capture & Record
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElegantButton(
                    imagePath: 'images/privacy_mode.png',
                    label: 'Capture',
                    primaryColor: primaryColor,
                    onTap: _handleCapture,
                  ),
                  _buildElegantButton(
                    icon: CupertinoIcons.videocam_fill,
                    label: 'Record',
                    primaryColor: primaryColor,
                    onTap: () {
                      print('[CameraScreen] Record button pressed (iPad)');
                      setState(() {
                        _isRecording = !_isRecording;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Second row: Feed & Activity Trail
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElegantButton(
                    icon: CupertinoIcons.camera_fill,
                    label: 'Feed',
                    primaryColor: primaryColor,
                    onTap: () {
                      print('[CameraScreen] Feed/PTZ button pressed (iPad)');
                      setState(() => _showPTZ = !_showPTZ);
                    },
                  ),
                  _buildElegantButton(
                    imagePath: 'images/activity_trail.png',
                    label: 'Activity Trail',
                    primaryColor: primaryColor,
                    onTap: () {
                      print(
                        '[CameraScreen] Activity Trail button pressed (iPad)',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
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
            width: 70,
            height: 70,
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
          const SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
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
