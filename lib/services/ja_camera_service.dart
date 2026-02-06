import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

/// Camera service for JAJUAN iOS SDK
/// Mirrors the Android EseeiotCameraService implementation
class JACameraService {
  static const MethodChannel _channel = MethodChannel('eseeiot_camera');
  static const EventChannel _eventChannel = EventChannel(
    'eseeiot_camera_events',
  );

  static Stream<Map<String, dynamic>>? _eventStream;
  static bool _isInitialized = false;

  /// Check if running on iOS
  static bool get isIOS => Platform.isIOS;

  /// Helper to parse plugin result - handles both bool and Map returns
  static bool _parseSuccess(dynamic result) {
    if (result == true) return true;
    if (result == false) return false;
    if (result is Map) {
      return result['success'] == true;
    }
    return false;
  }

  /// Helper to parse Map result with fallback
  static Map<String, dynamic> _parseMapResult(dynamic result) {
    if (result is Map) {
      return Map<String, dynamic>.from(result);
    }
    // Return a default success map
    return {'success': result == true};
  }

  /// Initialize the SDK
  static Future<bool> initializeSDK() async {
    if (_isInitialized) {
      print('[JACameraService] SDK already initialized');
      return true;
    }

    try {
      final result = await _channel.invokeMethod('initializeSDK');
      _isInitialized = _parseSuccess(result);
      print('[JACameraService] SDK initialization result: $_isInitialized');
      return _isInitialized;
    } catch (e) {
      print('[JACameraService] Error initializing SDK: $e');
      _isInitialized = false;
      return false;
    }
  }

  /// Save/Register a camera with configuration
  static Future<bool> saveCamera({
    required String cameraId,
    String cameraName = 'Living Room',
    String username = 'admin',
    String password = '',
    int channelCount = 1,
  }) async {
    if (!_isInitialized) {
      print('[JACameraService] SDK not initialized, initializing now...');
      final initResult = await initializeSDK();
      if (!initResult) {
        print('[JACameraService] Failed to initialize SDK');
        return false;
      }
    }

    try {
      print(
        '[JACameraService] Saving camera: id=$cameraId, user=$username, pwd=${password.isEmpty ? "(empty)" : "(set)"}',
      );

      final result = await _channel.invokeMethod('saveCamera', {
        'cameraId': cameraId,
        'cameraName': cameraName.isEmpty ? cameraId : cameraName,
        'username': username,
        'password': password,
        'channelCount': channelCount,
      });

      final success = _parseSuccess(result);
      print('[JACameraService] Save camera result: $success');
      return success;
    } catch (e) {
      print('[JACameraService] Error saving camera: $e');
      return false;
    }
  }

  /// Connect to a camera
  static Future<Map<String, dynamic>?> connectCamera(String cameraId) async {
    if (!_isInitialized) {
      await initializeSDK();
    }

    try {
      final result = await _channel.invokeMethod('connectCamera', {
        'cameraId': cameraId,
      });
      return _parseMapResult(result);
    } catch (e) {
      print('[JACameraService] Error connecting camera: $e');
      return null;
    }
  }

  /// Initialize live view
  static Future<bool> initLiveView() async {
    try {
      final result = await _channel.invokeMethod('initLiveView');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] Error initializing live view: $e');
      return false;
    }
  }

  /// Start playback
  static Future<bool> startPlay() async {
    try {
      final result = await _channel.invokeMethod('startPlay');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] Error starting play: $e');
      return false;
    }
  }

  /// Stop playback
  static Future<bool> stopPlay() async {
    try {
      final result = await _channel.invokeMethod('stopPlay');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] Error stopping play: $e');
      return false;
    }
  }

  // PTZ Controls
  static Future<bool> ptzMoveUp() async {
    print('[JACameraService] PTZ Move Up - sending command...');
    try {
      final result = await _channel.invokeMethod('ptzMoveUp');
      print('[JACameraService] PTZ Move Up - command sent successfully');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] PTZ Move Up - ERROR: $e');
      return false;
    }
  }

  static Future<bool> ptzMoveDown() async {
    print('[JACameraService] PTZ Move Down - sending command...');
    try {
      final result = await _channel.invokeMethod('ptzMoveDown');
      print('[JACameraService] PTZ Move Down - command sent successfully');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] PTZ Move Down - ERROR: $e');
      return false;
    }
  }

  static Future<bool> ptzMoveLeft() async {
    print('[JACameraService] PTZ Move Left - sending command...');
    try {
      final result = await _channel.invokeMethod('ptzMoveLeft');
      print('[JACameraService] PTZ Move Left - command sent successfully');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] PTZ Move Left - ERROR: $e');
      return false;
    }
  }

  static Future<bool> ptzMoveRight() async {
    print('[JACameraService] PTZ Move Right - sending command...');
    try {
      final result = await _channel.invokeMethod('ptzMoveRight');
      print('[JACameraService] PTZ Move Right - command sent successfully');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] PTZ Move Right - ERROR: $e');
      return false;
    }
  }

  static Future<bool> ptzStop() async {
    print('[JACameraService] PTZ Stop - sending command...');
    try {
      final result = await _channel.invokeMethod('ptzStop');
      print('[JACameraService] PTZ Stop - command sent successfully');
      return _parseSuccess(result);
    } catch (e) {
      print('[JACameraService] PTZ Stop - ERROR: $e');
      return false;
    }
  }

  /// Capture screenshot
  static Future<String?> capture() async {
    try {
      final result = await _channel.invokeMethod('captureScreenshot');
      if (result is Map) {
        return result['path'] as String?;
      }
      return null;
    } catch (e) {
      print('[JACameraService] Error capturing screenshot: $e');
      return null;
    }
  }

  /// Dispose camera resources
  static Future<void> dispose() async {
    try {
      await _channel.invokeMethod('dispose');
      _isInitialized = false;
      _eventStream = null;
    } catch (e) {
      print('[JACameraService] Error disposing: $e');
    }
  }

  /// Get event stream
  static Stream<Map<String, dynamic>> get eventStream {
    _eventStream ??= _eventChannel.receiveBroadcastStream().map(
      (event) => Map<String, dynamic>.from(event),
    );
    return _eventStream!;
  }
}
