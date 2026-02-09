// vertical_home/camera_screen.dart
// CCTV Camera control screen with live video feed
// Uses SDK's built-in PTZ controls

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/widgets/ja_camera_view.dart';
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

  void _showConnectionFailedAlert() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Connection Failed'),
          content: Text(
            _errorMessage ??
                'Unable to connect to camera. Please check your network connection and try again.',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
                _initializeCamera();
              },
            ),
          ],
        );
      },
    );
  }

  void _showInfoAlert(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
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

                  // Main content row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left section: Video feed
                        Expanded(
                          flex: 5,
                          child: _buildVideoFeedSection(primaryColor),
                        ),
                        const SizedBox(width: 30),

                        // Right section: Control buttons
                        Expanded(
                          flex: 3,
                          child: _buildControlsSection(primaryColor),
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

  Widget _buildControlsSection(Color primaryColor) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 400.0,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F0EB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          top: 50,
          bottom: 50.0,
          right: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Single row: Watch Video & PTZ Control
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElegantButton(
                    icon: CupertinoIcons.camera_fill,
                    label: 'Watch\nVideo',
                    primaryColor: primaryColor,
                    isEnabled: true,
                    onTap: () {
                      // Resume feed if paused
                      if (!_isConnected) {
                        _initializeCamera();
                      } else {
                        _showInfoAlert(
                          'Live Feed',
                          'Camera feed is currently active.',
                        );
                      }
                    },
                  ),
                  _buildElegantButton(
                    icon: Icons.control_camera,
                    label: 'PTZ\nControl',
                    primaryColor: primaryColor,
                    isEnabled: _isConnected,
                    onTap: () {
                      _showInfoAlert(
                        'PTZ Control',
                        'Use the on-screen controls in the video feed to pan, tilt, and zoom the camera.\n\nThe SDK provides built-in PTZ controls.',
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
    bool isLoading = false,
    bool isEnabled = true,
  }) {
    final effectiveColor = isEnabled
        ? primaryColor
        : CupertinoColors.systemGrey3;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: effectiveColor,
                shape: BoxShape.circle,
              ),
              child: isLoading
                  ? const CupertinoActivityIndicator(color: Colors.white)
                  : (imagePath != null
                        ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Image.asset(imagePath, color: Colors.white),
                          )
                        : Icon(icon, color: Colors.white, size: 32)),
            ),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: effectiveColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
