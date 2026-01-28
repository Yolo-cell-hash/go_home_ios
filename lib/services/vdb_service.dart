// services/vdb_service.dart
// High-level VDB service for managing video streaming connection

import 'dart:async';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'janus_webrtc_client.dart';
import 'vdb_firebase_service.dart';

/// Connection state for VDB
enum VdbConnectionState { disconnected, connecting, connected, error }

/// High-level VDB service combining WebRTC and Firebase functionality
class VdbService {
  JanusWebRTCClient? _client;
  final VdbFirebaseService _fbService = VdbFirebaseService();

  StreamSubscription? _streamSubscription;
  MediaStream? _currentStream;

  final StreamController<VdbConnectionState> _connectionStateController =
      StreamController<VdbConnectionState>.broadcast();
  final StreamController<MediaStream?> _streamController =
      StreamController<MediaStream?>.broadcast();
  final StreamController<String> _messageController =
      StreamController<String>.broadcast();

  VdbConnectionState _state = VdbConnectionState.disconnected;
  String? _lastError;

  // Public streams
  Stream<VdbConnectionState> get connectionState =>
      _connectionStateController.stream;
  Stream<MediaStream?> get videoStream => _streamController.stream;
  Stream<String> get messages => _messageController.stream;

  // Public getters
  VdbConnectionState get state => _state;
  String? get lastError => _lastError;
  MediaStream? get currentStream => _currentStream;
  bool get isConnected => _state == VdbConnectionState.connected;

  /// Connect to VDB and start video stream
  /// [streamId] - The stream ID to watch (default: 7)
  Future<bool> connect({int streamId = 7}) async {
    if (_state == VdbConnectionState.connecting) {
      return false;
    }

    _updateState(VdbConnectionState.connecting);
    _messageController.add('Connecting to VDB...');

    try {
      // Step 1: Read IP address from Firebase
      final String? ip = await _fbService.readIpv6();

      if (ip == null) {
        throw Exception('Failed to read server IP address');
      }

      _messageController.add('Server IP: $ip');

      // Step 2: Enable send feed in Firebase
      await _fbService.enableSendFeed();

      // Step 3: Create Janus client and connect
      _client = JanusWebRTCClient('ws://$ip:8188');
      await _client!.connect();

      // Step 4: Attach to streaming plugin
      bool attached = await _client!.attachToStreamingPlugin();

      if (!attached) {
        throw Exception('Failed to attach to streaming plugin');
      }

      // Step 5: Start keep-alive
      await _client!.keepAlive();

      // Step 6: List available streams
      await _client!.listStreams();

      // Step 7: Listen for remote stream
      _streamSubscription = _client!.remoteStream.listen((stream) {
        _currentStream = stream;
        _streamController.add(stream);
        print("Stream received");
      });

      // Step 8: Watch the specified stream
      await _client!.watchStream(streamId);

      _updateState(VdbConnectionState.connected);
      _messageController.add('Connected successfully!');

      return true;
    } catch (e) {
      _lastError = e.toString();
      _updateState(VdbConnectionState.error);
      _messageController.add('Connection failed: $e');
      print('VDB Connection Error: $e');
      return false;
    }
  }

  /// Disconnect from VDB
  Future<void> disconnect() async {
    try {
      // Disable send feed
      await _fbService.disableSendFeed();

      // Cancel stream subscription
      await _streamSubscription?.cancel();
      _streamSubscription = null;

      // Disconnect client
      await _client?.disconnect();
      _client = null;

      // Clear current stream
      _currentStream?.dispose();
      _currentStream = null;
      _streamController.add(null);

      _updateState(VdbConnectionState.disconnected);
      _messageController.add('Disconnected');
    } catch (e) {
      print('Error during disconnect: $e');
    }
  }

  /// Pause the video feed
  Future<void> pause() async {
    try {
      await _fbService.disableSendFeed();
      _messageController.add('Feed paused');
    } catch (e) {
      print('Error pausing feed: $e');
    }
  }

  /// Resume the video feed
  Future<void> resume() async {
    try {
      await _fbService.enableSendFeed();
      _messageController.add('Feed resumed');
    } catch (e) {
      print('Error resuming feed: $e');
    }
  }

  void _updateState(VdbConnectionState newState) {
    _state = newState;
    _connectionStateController.add(newState);
  }

  /// Dispose all resources
  void dispose() {
    disconnect();
    _connectionStateController.close();
    _streamController.close();
    _messageController.close();
  }
}
