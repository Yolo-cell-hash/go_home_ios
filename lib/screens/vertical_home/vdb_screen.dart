// vertical_home/vdb_screen.dart
// VDB (Video Door Bell) control screen with live video streaming

import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart' hide Query;
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

  // Activity trail state
  List<Map<String, dynamic>> _activityLogs = [];
  bool _isLoadingLogs = false;
  bool _hasMoreLogs = true;
  DocumentSnapshot? _lastDocument;
  final ScrollController _logScrollController = ScrollController();
  static const int _logsPerPage = 20;

  // Surveillance mode state
  bool _isSurveillanceEnabled = false;
  bool _isSurveillanceLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initRenderer();
    _connectOnPageInit();
    _fetchActivityLogs();
    _readSurveillanceMode();
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

  // ─── Surveillance Mode: read initial value ───
  Future<void> _readSurveillanceMode() async {
    try {
      final dbRef = FirebaseDatabase.instance.refFromURL(
        'https://vdb-poc-default-rtdb.asia-southeast1.firebasedatabase.app/dev_env',
      );
      final snapshot = await dbRef.child('survailanceModeEnabled').get();
      if (mounted && snapshot.exists) {
        setState(() {
          _isSurveillanceEnabled = snapshot.value == true;
        });
      }
    } catch (e) {
      print('[ERROR] VDB _readSurveillanceMode: $e');
    }
  }

  // ─── Surveillance Mode: toggle handler ───
  Future<void> _toggleSurveillanceMode(bool newValue) async {
    setState(() {
      _isSurveillanceLoading = true;
    });

    try {
      final dbRef = FirebaseDatabase.instance.refFromURL(
        'https://vdb-poc-default-rtdb.asia-southeast1.firebasedatabase.app/dev_env',
      );
      await dbRef.child('survailanceModeEnabled').set(newValue);

      // Manual 1-second loader
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;
      setState(() {
        _isSurveillanceEnabled = newValue;
        _isSurveillanceLoading = false;
      });

      // Success popup
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: CupertinoColors.activeGreen,
                size: 24,
              ),
              SizedBox(width: 8),
              Text('Success'),
            ],
          ),
          content: Text(
            newValue
                ? 'Surveillance Mode has been enabled.'
                : 'Surveillance Mode has been disabled.',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('[ERROR] VDB _toggleSurveillanceMode: $e');
      if (!mounted) return;
      setState(() {
        _isSurveillanceLoading = false;
      });
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('Failed to update surveillance mode: $e'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _recordingTimer?.cancel();
    _frameCaptureTimer?.cancel();
    _connectionStateSubscription?.cancel();
    _videoStreamSubscription?.cancel();
    _logScrollController.dispose();
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
                  // Title with icon - "VDB" + Surveillance Mode toggle
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
                        'Video Door Bell',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      // Surveillance Mode toggle
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Surveillance Mode',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          _isSurveillanceLoading
                              ? const CupertinoActivityIndicator(radius: 12)
                              : CupertinoSwitch(
                                  value: _isSurveillanceEnabled,
                                  activeTrackColor: primaryColor,
                                  onChanged: _toggleSurveillanceMode,
                                ),
                        ],
                      ),
                      const SizedBox(width: 20.0),
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
                    onTap: () => _handleFeedTap(),
                  ),
                  _buildElegantButton(
                    imagePath: 'images/activity_trail.png',
                    label: 'Activity Trail',
                    primaryColor: primaryColor,
                    isEnabled: true,
                    onTap: () => _showActivityTrailSheet(),
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

  // ─── Activity Trail: Firestore fetch with pagination ───

  bool _isLoadingMore = false;

  Future<void> _fetchActivityLogs({
    bool loadMore = false,
    StateSetter? sheetStateUpdater,
  }) async {
    if (loadMore) {
      if (_isLoadingMore || !_hasMoreLogs) return;
      _isLoadingMore = true;
      sheetStateUpdater?.call(() {});
    } else {
      if (_isLoadingLogs) return;
      _isLoadingLogs = true;
      sheetStateUpdater?.call(() {});
      if (mounted) setState(() {});
    }

    try {
      Query query = FirebaseFirestore.instance
          .collection('logs')
          .orderBy('timestamp', descending: true)
          .limit(_logsPerPage);

      if (loadMore && _lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.get();
      if (!mounted) return;

      final docs = snapshot.docs;
      print(
        '[DEBUG] VDB ActivityTrail: Fetched ${docs.length} docs (loadMore=$loadMore)',
      );

      final newLogs = docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        // Handle image: Blob, List<dynamic> (raw bytes), or base64 String
        Uint8List? imageBytes;
        if (data['image'] != null) {
          final img = data['image'];
          if (img is Blob) {
            imageBytes = Uint8List.fromList(img.bytes);
          } else if (img is List) {
            imageBytes = Uint8List.fromList(img.cast<int>());
          } else if (img is String && img.isNotEmpty) {
            try {
              imageBytes = base64Decode(img);
            } catch (_) {}
          }
        }

        // Handle "message " field (Firestore key has trailing space)
        final message = (data['message '] ?? data['message'] ?? '')
            .toString()
            .trim();
        final timestamp = data['timestamp'] ?? '';

        return {
          'message': message,
          'timestamp': timestamp,
          'imageBytes': imageBytes,
        };
      }).toList();

      if (!loadMore) {
        _activityLogs = newLogs;
      } else {
        _activityLogs.addAll(newLogs);
      }
      _lastDocument = docs.isNotEmpty ? docs.last : null;
      _hasMoreLogs = docs.length == _logsPerPage;
      _isLoadingLogs = false;
      _isLoadingMore = false;

      if (mounted) setState(() {});
      sheetStateUpdater?.call(() {});

      print(
        '[DEBUG] VDB ActivityTrail: total=${_activityLogs.length}, hasMore=$_hasMoreLogs',
      );
    } catch (e) {
      print('[ERROR] VDBScreen: Failed to fetch activity logs: $e');
      _isLoadingLogs = false;
      _isLoadingMore = false;
      if (mounted) setState(() {});
      sheetStateUpdater?.call(() {});
    }
  }

  void _showActivityTrailSheet() {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    showCupertinoModalPopup(
      context: context,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Handle bar
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey3,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  // Title row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/activity_trail.png',
                          width: 24,
                          height: 24,
                          color: primaryColor,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              CupertinoIcons.clock,
                              color: primaryColor,
                              size: 24,
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Activity Trail',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black,
                          ),
                        ),
                        const Spacer(),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _lastDocument = null;
                            _hasMoreLogs = true;
                            _fetchActivityLogs(
                              sheetStateUpdater: setSheetState,
                            );
                          },
                          child: Icon(
                            CupertinoIcons.refresh,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: CupertinoColors.systemGrey5),

                  // Content
                  Expanded(
                    child: _buildActivityTrailContent(
                      primaryColor,
                      setSheetState,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ─── Feed button: check/set /sendFeed in RTDB ───

  Future<void> _handleFeedTap() async {
    final dbRef = FirebaseDatabase.instance.ref('sendFeed');
    try {
      final snapshot = await dbRef.get();
      final currentValue = snapshot.value;

      if (currentValue == true) {
        // Already enabled — show info popup
        if (!mounted) return;
        showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('Feed Status'),
            content: const Text('Streaming is already enabled.'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Not enabled — set to true
        await dbRef.set(true);
        if (!mounted) return;
        showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('Feed Enabled'),
            content: const Text('Streaming has been enabled.'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('[ERROR] VDB _handleFeedTap: $e');
      if (!mounted) return;
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('Failed to check feed status: $e'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildActivityTrailContent(
    Color primaryColor,
    StateSetter setSheetState,
  ) {
    if (_isLoadingLogs && _activityLogs.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(radius: 16),
            SizedBox(height: 12),
            Text(
              'Loading activity logs...',
              style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
            ),
          ],
        ),
      );
    }

    if (_activityLogs.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.doc_text,
              color: CupertinoColors.systemGrey,
              size: 40,
            ),
            SizedBox(height: 12),
            Text(
              'No activity logs found',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    // Build items list + optional "Load More" button at bottom
    final itemCount =
        _activityLogs.length + (_hasMoreLogs || _isLoadingMore ? 1 : 0);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: itemCount,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: CupertinoColors.systemGrey5),
      itemBuilder: (context, index) {
        // Last item: Load More button or spinner
        if (index == _activityLogs.length) {
          if (_isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CupertinoActivityIndicator(radius: 12)),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                _fetchActivityLogs(
                  loadMore: true,
                  sheetStateUpdater: setSheetState,
                );
              },
              child: Text(
                'Load More',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }
        return _buildLogItem(_activityLogs[index], primaryColor);
      },
    );
  }

  Widget _buildLogItem(Map<String, dynamic> log, Color primaryColor) {
    final rawMessage = (log['message'] ?? '').toString();
    final rawTimestamp = (log['timestamp'] ?? '').toString();
    final imageBytes = log['imageBytes'] as Uint8List?;

    // Parse status prefix: "Success-..." or "Error-..."
    bool isSuccess = false;
    bool isError = false;
    String displayMessage = rawMessage;

    final lowerMsg = rawMessage.toLowerCase();
    if (lowerMsg.startsWith('success')) {
      isSuccess = true;
      // Strip "Success-", "Success -", "Success:" etc.
      displayMessage = rawMessage
          .replaceFirst(RegExp(r'^[Ss]uccess\s*[-:]\s*'), '')
          .trim();
    } else if (lowerMsg.startsWith('error')) {
      isError = true;
      displayMessage = rawMessage
          .replaceFirst(RegExp(r'^[Ee]rror\s*[-:]\s*'), '')
          .trim();
    }

    if (displayMessage.isEmpty) displayMessage = rawMessage;

    // Status visuals
    final Color statusColor = isSuccess
        ? const Color(0xFF34C759) // green
        : isError
        ? const Color(0xFFFF3B30) // red
        : CupertinoColors.systemGrey;
    final IconData statusIcon = isSuccess
        ? CupertinoIcons.checkmark_shield_fill
        : isError
        ? CupertinoIcons.xmark_shield_fill
        : CupertinoIcons.doc_text;
    final String statusLabel = isSuccess
        ? 'Access Granted'
        : isError
        ? 'Access Denied'
        : '';

    // Format timestamp
    String datePart = '';
    String timePart = '';
    if (rawTimestamp.isNotEmpty) {
      try {
        final dt = DateTime.parse(rawTimestamp);
        final local = dt.toLocal();
        const months = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ];
        final hour = local.hour > 12
            ? local.hour - 12
            : (local.hour == 0 ? 12 : local.hour);
        final amPm = local.hour >= 12 ? 'PM' : 'AM';
        datePart =
            '${local.day.toString().padLeft(2, '0')} ${months[local.month - 1]} ${local.year}';
        timePart =
            '${hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')} $amPm';
      } catch (_) {
        datePart = rawTimestamp;
      }
    }

    return GestureDetector(
      onTap: () => _showLogDetail(
        imageBytes: imageBytes,
        message: displayMessage,
        statusLabel: statusLabel,
        statusColor: statusColor,
        statusIcon: statusIcon,
        datePart: datePart,
        timePart: timePart,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: isSuccess
              ? const Color(0x0834C759)
              : isError
              ? const Color(0x08FF3B30)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Status icon
            Icon(statusIcon, color: statusColor, size: 22),
            const SizedBox(width: 10),

            // Image thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageBytes != null
                  ? Image.memory(
                      imageBytes,
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          _buildFallbackIcon(primaryColor),
                    )
                  : _buildFallbackIcon(primaryColor),
            ),
            const SizedBox(width: 12),

            // Message (expanded)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (statusLabel.isNotEmpty)
                    Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                  if (statusLabel.isNotEmpty) const SizedBox(height: 2),
                  Text(
                    displayMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),

            // Timestamp (trailing)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  datePart,
                  style: const TextStyle(
                    fontSize: 11,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                if (timePart.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    timePart,
                    style: const TextStyle(
                      fontSize: 11,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Show enlarged image + details when a log item is tapped
  void _showLogDetail({
    Uint8List? imageBytes,
    required String message,
    required String statusLabel,
    required Color statusColor,
    required IconData statusIcon,
    required String datePart,
    required String timePart,
  }) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(ctx),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image preview (large)
                if (imageBytes != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.memory(
                      imageBytes,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 120,
                        color: CupertinoColors.systemGrey6,
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.photo,
                            size: 40,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.camera,
                        size: 40,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                // Status badge
                if (statusLabel.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(statusIcon, color: statusColor, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          statusLabel,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (statusLabel.isNotEmpty) const SizedBox(height: 12),

                // Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),

                // Timestamp
                Text(
                  '$datePart  $timePart',
                  style: const TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 16),

                // Close button
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 10,
                  ),
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFallbackIcon(Color primaryColor) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(CupertinoIcons.camera_fill, color: primaryColor, size: 24),
      ),
    );
  }
}
