// vertical_home/vdb_screen.dart
// VDB (Video Door Bell) control screen with live video streaming

import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/services/vdb_service.dart';

/// VDB control screen with live video streaming, capture and recording
class VDBScreen extends StatefulWidget {
  const VDBScreen({super.key});

  @override
  State<VDBScreen> createState() => _VDBScreenState();
}

class _VDBScreenState extends State<VDBScreen> with WidgetsBindingObserver {
  // VDB Service
  final VdbService _vdbService = VdbService();

  // Video renderer
  late RTCVideoRenderer _renderer;
  bool _rendererInitialized = false;

  // Stream subscriptions
  StreamSubscription? _connectionStateSubscription;
  StreamSubscription? _videoStreamSubscription;

  // State
  bool _isConnecting = true;
  bool _isConnected = false;
  bool _hasError = false;

  // Recording state - using frame capture for iOS compatibility
  bool _isRecording = false;
  int _recordingDuration = 0;
  Timer? _recordingTimer;
  Timer? _frameCaptureTimer;
  List<Uint8List> _capturedFrames = [];

  // Capture state
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initRenderer();
    _connectOnPageInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _vdbService.pause();
    } else if (state == AppLifecycleState.resumed) {
      _vdbService.resume();
    }
  }

  Future<void> _initRenderer() async {
    _renderer = RTCVideoRenderer();
    await _renderer.initialize();
    setState(() {
      _rendererInitialized = true;
    });
  }

  Future<void> _connectOnPageInit() async {
    // Subscribe to connection state changes
    _connectionStateSubscription = _vdbService.connectionState.listen((state) {
      setState(() {
        switch (state) {
          case VdbConnectionState.connecting:
            _isConnecting = true;
            _isConnected = false;
            _hasError = false;
            break;
          case VdbConnectionState.connected:
            _isConnecting = false;
            _isConnected = true;
            _hasError = false;
            break;
          case VdbConnectionState.error:
            _isConnecting = false;
            _isConnected = false;
            _hasError = true;
            break;
          case VdbConnectionState.disconnected:
            _isConnecting = false;
            _isConnected = false;
            _hasError = false;
            break;
        }
      });
    });

    // Subscribe to video stream
    _videoStreamSubscription = _vdbService.videoStream.listen((stream) {
      if (_rendererInitialized && stream != null) {
        _renderer.srcObject = stream;
        setState(() {});
      }
    });

    // Attempt connection
    final success = await _vdbService.connect(streamId: 7);

    if (!success && mounted) {
      _showConnectionFailedAlert();
    }
  }

  void _showConnectionFailedAlert() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Connection Failed'),
          content: Text(
            _vdbService.lastError ??
                'Unable to connect to video door bell. Please check your network connection and try again.',
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
                _connectOnPageInit();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _captureSnapshot() async {
    if (!_isConnected || _isCapturing) return;

    setState(() {
      _isCapturing = true;
    });

    try {
      // Wait for next frame
      await Future.delayed(const Duration(milliseconds: 100));

      // Capture the video frame
      RenderRepaintBoundary boundary =
          _repaintBoundaryKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List imageBytes = byteData!.buffer.asUint8List();

      // Save to gallery
      final result = await ImageGallerySaverPlus.saveImage(
        imageBytes,
        quality: 100,
        name: 'vdb_capture_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (result != null && result['isSuccess']) {
        _showSuccessAlert(
          'Snapshot Saved',
          'Image has been saved to your gallery.',
        );
      } else {
        throw Exception('Failed to save image');
      }
    } catch (e) {
      print('Error capturing image: $e');
      _showErrorAlert('Capture Failed', 'Unable to capture snapshot.');
    } finally {
      setState(() {
        _isCapturing = false;
      });
    }
  }

  Future<void> _startRecording() async {
    if (!_isConnected || _isRecording) return;

    try {
      // Clear previous frames
      _capturedFrames.clear();

      // Start recording timer
      setState(() {
        _isRecording = true;
        _recordingDuration = 0;
      });

      // Timer for duration display
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _recordingDuration++;
        });

        // Max 60 seconds recording
        if (_recordingDuration >= 60) {
          _stopRecording();
        }
      });

      // Timer for frame capture (2 fps for reasonable file size)
      _frameCaptureTimer = Timer.periodic(const Duration(milliseconds: 500), (
        timer,
      ) async {
        await _captureFrameForRecording();
      });

      _showInfoAlert(
        'Recording Started',
        'Video recording is now in progress (max 60 seconds).',
      );
    } catch (e) {
      print('Error starting recording: $e');
      _showErrorAlert('Recording Failed', 'Unable to start recording.');
    }
  }

  Future<void> _captureFrameForRecording() async {
    try {
      RenderRepaintBoundary boundary =
          _repaintBoundaryKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 1.5);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData != null) {
        _capturedFrames.add(byteData.buffer.asUint8List());
      }
    } catch (e) {
      print('Frame capture error: $e');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      // Stop timers
      _recordingTimer?.cancel();
      _frameCaptureTimer?.cancel();

      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });

      // Save frames as individual images or last frame
      if (_capturedFrames.isNotEmpty) {
        // Save the last frame as a representative image
        final result = await ImageGallerySaverPlus.saveImage(
          _capturedFrames.last,
          quality: 100,
          name: 'vdb_recording_${DateTime.now().millisecondsSinceEpoch}',
        );

        final frameCount = _capturedFrames.length;
        _capturedFrames.clear();

        if (result != null && result['isSuccess']) {
          _showSuccessAlert(
            'Recording Saved',
            'Captured $frameCount frames. Final frame saved to gallery.\n\nNote: Full video recording requires native setup.',
          );
        } else {
          throw Exception('Failed to save recording');
        }
      } else {
        _showErrorAlert('Recording Failed', 'No frames were captured.');
      }
    } catch (e) {
      print('Error stopping recording: $e');
      _showErrorAlert('Save Failed', 'Unable to save recording.');
      setState(() {
        _isRecording = false;
      });
    }
  }

  void _showSuccessAlert(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: CupertinoColors.activeGreen,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
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

  void _showErrorAlert(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: CupertinoColors.destructiveRed,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
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

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _recordingTimer?.cancel();
    _frameCaptureTimer?.cancel();
    _connectionStateSubscription?.cancel();
    _videoStreamSubscription?.cancel();
    _renderer.dispose();
    _vdbService.dispose();
    super.dispose();
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
          NavbarSetup(theme: theme, imgPath: 'vdb', label: 'Video Door Bell'),

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
                  // Title with icon - "VDB"
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
                            'images/vdb_icon.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'VDB',
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

                        // Right section: Control buttons grid
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

            // Recording indicator
            if (_isRecording)
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'REC ${_formatDuration(_recordingDuration)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Live indicator (when connected and not recording)
            if (_isConnected && !_isRecording)
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
    if (_isConnecting) {
      return Container(
        color: const Color(0xFF2C2C2C),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 20, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Connecting to VDB...',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    if (_hasError) {
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
                onPressed: _connectOnPageInit,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_rendererInitialized && _isConnected) {
      return RepaintBoundary(
        key: _repaintBoundaryKey,
        child: RTCVideoView(
          _renderer,
          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          mirror: false,
        ),
      );
    }

    return Container(
      color: const Color(0xFF2C2C2C),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/vdb_icon.png',
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
        decoration: BoxDecoration(
          color: const Color(0xFFF5F0EB),
          borderRadius: const BorderRadius.only(
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
            // First row: Capture & Record
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElegantButton(
                    imagePath: 'images/privacy_mode.png',
                    label: 'Capture',
                    primaryColor: primaryColor,
                    isLoading: _isCapturing,
                    isEnabled: _isConnected && !_isCapturing,
                    onTap: _captureSnapshot,
                  ),
                  _buildElegantButton(
                    icon: _isRecording
                        ? CupertinoIcons.stop_fill
                        : CupertinoIcons.videocam_fill,
                    label: _isRecording ? 'Stop' : 'Record',
                    primaryColor: _isRecording
                        ? CupertinoColors.destructiveRed
                        : primaryColor,
                    isEnabled: _isConnected,
                    onTap: _isRecording ? _stopRecording : _startRecording,
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
                    isEnabled: true,
                    onTap: () {
                      // Toggle feed pause/resume
                      if (_isConnected) {
                        _vdbService.resume();
                      }
                    },
                  ),
                  _buildElegantButton(
                    imagePath: 'images/activity_trail.png',
                    label: 'Activity Trail',
                    primaryColor: primaryColor,
                    isEnabled: true,
                    onTap: () {
                      _showInfoAlert(
                        'Coming Soon',
                        'Activity trail feature will be available in a future update.',
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
