// services/godrej_ac_api_service.dart
// Singleton service for Godrej AC cloud API communication.
// Handles login, token auto-refresh (every 40 min), GET params, and PUT single-param updates.
// Node ID is fetched dynamically from Firebase /automation-flags/ac-node-id.

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class GodrejAcApiService {
  // ── Singleton ──
  GodrejAcApiService._internal();
  static final GodrejAcApiService instance = GodrejAcApiService._internal();

  // ── Constants ──
  static const String _baseUrl =
      'https://14uv336e1j.execute-api.ap-south-1.amazonaws.com/dev/v1';
  static const String _loginEndpoint = '$_baseUrl/login2';
  static const String _userName = '+918268667702';
  static const String _password = 'Keyoor@97';

  /// Fallback node ID used if Firebase hasn't provided one yet.
  static const String _fallbackNodeId = 'JTf6KXVV9B4DQ56xXVTjBj';

  /// Token refresh interval — 40 minutes (before the 45-min expiry).
  static const Duration _refreshInterval = Duration(minutes: 40);

  // ── State ──
  String? _accessToken;
  String? _idToken;
  String? _refreshToken;
  Timer? _refreshTimer;
  bool _isInitialised = false;

  /// Dynamic node ID — updated in real-time from Firebase.
  String _nodeId = _fallbackNodeId;

  /// Firebase listener for ac-node-id changes.
  StreamSubscription<DatabaseEvent>? _nodeIdSubscription;

  /// Whether the service has successfully logged in at least once.
  bool get isAuthenticated => _accessToken != null;

  /// Current node ID (for debugging / display).
  String get nodeId => _nodeId;

  /// Build the params endpoint URL using the current dynamic node ID.
  String get _paramsEndpoint =>
      '$_baseUrl/user/nodes/params?node_id=$_nodeId';

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  /// Call once at app startup (e.g. VerticalHomeScreen.initState).
  /// Fetches dynamic node ID from Firebase, performs login, and starts timers.
  Future<void> init() async {
    if (_isInitialised) {
      print('[GodrejAcApi] Already initialised — skipping');
      return;
    }
    print('[GodrejAcApi] Initialising...');

    // Fetch initial node ID from Firebase before login
    await _fetchNodeId();

    // Start listening for node ID changes
    _setupNodeIdListener();

    // Login and start token refresh
    await login();
    _startRefreshTimer();
    _isInitialised = true;
  }

  /// Clean up timers and listeners.
  void dispose() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    _nodeIdSubscription?.cancel();
    _nodeIdSubscription = null;
    print('[GodrejAcApi] Disposed — timers and listeners cancelled');
  }

  // ---------------------------------------------------------------------------
  // Dynamic Node ID
  // ---------------------------------------------------------------------------

  /// Fetch the node ID once from Firebase /automation-flags/ac-node-id.
  Future<void> _fetchNodeId() async {
    try {
      final ref = FirebaseDatabase.instance.ref('automation-flags');
      final snapshot = await ref.get();
      if (snapshot.exists && snapshot.value is Map) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final id = data['ac-node-id'];
        if (id is String && id.trim().isNotEmpty) {
          _nodeId = id.trim();
          print('[GodrejAcApi] Node ID fetched from Firebase: $_nodeId');
          return;
        }
      }
      print('[GodrejAcApi] No ac-node-id in Firebase — using fallback: $_fallbackNodeId');
    } catch (e) {
      print('[GodrejAcApi] Failed to fetch node ID: $e — using fallback');
    }
  }

  /// Listen for real-time changes to /automation-flags/ac-node-id.
  void _setupNodeIdListener() {
    final ref = FirebaseDatabase.instance
        .ref('automation-flags')
        .child('ac-node-id');

    _nodeIdSubscription = ref.onValue.listen((event) {
      if (event.snapshot.exists) {
        final value = event.snapshot.value;
        if (value is String && value.trim().isNotEmpty) {
          final newId = value.trim();
          if (newId != _nodeId) {
            print('[GodrejAcApi] Node ID updated from Firebase: '
                '$_nodeId → $newId');
            _nodeId = newId;
          }
        }
      }
    });
    print('[GodrejAcApi] Listening for ac-node-id changes');
  }

  // ---------------------------------------------------------------------------
  // Auth
  // ---------------------------------------------------------------------------

  /// Perform a fresh login. Stores tokens internally.
  Future<bool> login() async {
    print('[GodrejAcApi] login() called');
    try {
      final response = await http.post(
        Uri.parse(_loginEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_name': _userName,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['status'] == 'success') {
          _accessToken = data['accesstoken'] as String?;
          _idToken = data['idtoken'] as String?;
          _refreshToken = data['refreshtoken'] as String?;
          print('[GodrejAcApi] Login successful — token obtained');
          return true;
        } else {
          print('[GodrejAcApi] Login response not success: ${data['description']}');
        }
      } else {
        print('[GodrejAcApi] Login HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('[GodrejAcApi] Login error: $e');
    }
    return false;
  }

  /// Ensure we have a valid token. Re-login if needed.
  Future<void> ensureAuthenticated() async {
    if (_accessToken == null) {
      print('[GodrejAcApi] No token — performing login');
      await login();
    }
  }

  void _startRefreshTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(_refreshInterval, (_) async {
      print('[GodrejAcApi] Auto-refreshing token (40-min timer fired)');
      await login();
    });
    print('[GodrejAcApi] Refresh timer started (every ${_refreshInterval.inMinutes}min)');
  }

  // ---------------------------------------------------------------------------
  // GET Device Params
  // ---------------------------------------------------------------------------

  /// Fetch the full AC parameter set from the cloud.
  /// Returns the AC section map, or null on failure.
  Future<Map<String, dynamic>?> getAcParams() async {
    await ensureAuthenticated();
    if (_accessToken == null) {
      print('[GodrejAcApi] getAcParams: still no token');
      return null;
    }

    try {
      final response = await http.get(
        Uri.parse(_paramsEndpoint),
        headers: {'Authorization': _accessToken!},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final acData = data['AC'] as Map<String, dynamic>?;
        print('[GodrejAcApi] getAcParams success: $acData');
        return acData;
      } else {
        print('[GodrejAcApi] getAcParams HTTP ${response.statusCode}: ${response.body}');
        // If 401/403, token may have expired — re-login and retry once
        if (response.statusCode == 401 || response.statusCode == 403) {
          print('[GodrejAcApi] Token expired — re-logging in');
          final ok = await login();
          if (ok) return getAcParams(); // single retry
        }
      }
    } catch (e) {
      print('[GodrejAcApi] getAcParams error: $e');
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // PUT Single Param
  // ---------------------------------------------------------------------------

  /// Update a single AC parameter on the device.
  /// [key] — the AC field name, e.g. "Temperature", "Power", "Mode"
  /// [value] — the value to set
  Future<bool> setAcParam(String key, dynamic value) async {
    await ensureAuthenticated();
    if (_accessToken == null) {
      print('[GodrejAcApi] setAcParam: no token');
      return false;
    }

    print('[GodrejAcApi] setAcParam: $key = $value');
    try {
      final response = await http.put(
        Uri.parse(_paramsEndpoint),
        headers: {
          'Authorization': _accessToken!,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'AC': {key: value},
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['status'] == 'success') {
          print('[GodrejAcApi] setAcParam success: $key = $value');
          return true;
        } else {
          print('[GodrejAcApi] setAcParam failed: ${data['description']}');
        }
      } else {
        print('[GodrejAcApi] setAcParam HTTP ${response.statusCode}: ${response.body}');
        // Retry on auth failure
        if (response.statusCode == 401 || response.statusCode == 403) {
          print('[GodrejAcApi] Token expired — re-logging in');
          final ok = await login();
          if (ok) return setAcParam(key, value);
        }
      }
    } catch (e) {
      print('[GodrejAcApi] setAcParam error: $e');
    }
    return false;
  }

  /// Update multiple AC parameters sequentially (one PUT per param).
  /// Returns true if ALL updates succeeded.
  Future<bool> setAcParamsSequential(Map<String, dynamic> params) async {
    bool allOk = true;
    for (final entry in params.entries) {
      final ok = await setAcParam(entry.key, entry.value);
      if (!ok) allOk = false;
    }
    return allOk;
  }
}
