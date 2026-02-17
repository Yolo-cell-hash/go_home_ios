// vertical_home/camera_screen.dart
// CCTV Camera control screen with live video feed
// Uses SDK's built-in PTZ controls

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, BoxShadow;
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
    // Full cleanup — stops stream AND clears the wrapper/SDK state
    // so a fresh previewVC can be created on next open
    JACameraService.stopPlay();
    JACameraService.dispose();
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

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          NavbarSetup(theme: theme, imgPath: 'camera', label: 'CCTV Camera'),

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
                  // Title with icon - "CCTV"
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
                            'images/small_cctv.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'CCTV',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Main row: Video feed + PTZ panel
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Video feed
                        Expanded(
                          flex: 5,
                          child: _buildVideoFeedSection(primaryColor),
                        ),
                        const SizedBox(width: 30),

                        // Right: PTZ Controls panel
                        Expanded(flex: 3, child: _buildPTZPanel(primaryColor)),
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

  /// Builds the PTZ control panel on the right side
  Widget _buildPTZPanel(Color primaryColor) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F0EB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.gamecontroller_fill,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'PTZ Control',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),

            // Status indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _isConnected
                    ? CupertinoColors.activeGreen.withOpacity(0.15)
                    : CupertinoColors.systemRed.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _isConnected ? '● Connected' : '○ Offline',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: _isConnected
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.systemRed,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            // PTZ D-pad
            Opacity(
              opacity: _isConnected ? 1.0 : 0.4,
              child: PTZController(
                size: 160,
                backgroundColor: primaryColor.withOpacity(0.12),
                buttonColor: primaryColor.withOpacity(0.25),
                activeButtonColor: primaryColor,
                iconColor: primaryColor,
              ),
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoFeedSection(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Video feed
            Positioned.fill(child: _buildVideoContent()),

            // Live indicator (when connected)
            if (_isConnected)
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
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

  Widget _buildVideoContent() {
    if (_isLoading) {
      return Container(
        color: const Color(0xFF2C2C2C),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 20, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Connecting to Camera...',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        color: const Color(0xFF2C2C2C),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.wifi_slash,
                size: 60,
                color: Colors.grey[600],
              ),
              const SizedBox(height: 15),
              Text(
                'Connection Failed',
                style: TextStyle(color: Colors.grey[400], fontSize: 18),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: _initializeCamera,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // Show native camera view on iOS - SDK handles PTZ internally
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
    }

    return Container(
      color: const Color(0xFF2C2C2C),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/small_cctv.png',
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 15),
            Text(
              'No Video Feed',
              style: TextStyle(color: Colors.grey[500], fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
