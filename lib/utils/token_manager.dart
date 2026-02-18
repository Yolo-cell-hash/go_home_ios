// utils/token_manager.dart
// Centralized token and user profile persistence via SharedPreferences.
// Handles access token, refresh token, OTP validity (7 days),
// and automatic token refresh scheduling (every 3 days).

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // SharedPreferences keys
  static const String _keyAccessToken = 'tm_access_token';
  static const String _keyRefreshToken = 'tm_refresh_token';
  static const String _keyTokenCreatedAt = 'tm_token_created_at'; // millis
  static const String _keyOtpTimestamp = 'tm_otp_timestamp'; // millis
  static const String _keyLockID = 'tm_lock_id';
  static const String _keyActiveUser = 'tm_active_user';

  // Durations
  static const int _tokenRefreshDays = 3; // refresh access token every 3 days
  static const int _otpValidityDays = 7; // OTP session valid for 7 days

  // ─── Token Storage ───

  /// Save tokens after OTP verification (fresh session).
  static Future<void> saveTokensFromOtp({
    required String accessToken,
    required String refreshToken,
    String? lockId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;

    await prefs.setString(_keyAccessToken, accessToken);
    await prefs.setString(_keyRefreshToken, refreshToken);
    await prefs.setInt(_keyTokenCreatedAt, now);
    await prefs.setInt(_keyOtpTimestamp, now);
    if (lockId != null && lockId.isNotEmpty) {
      await prefs.setString(_keyLockID, lockId);
    }

    print('[TokenManager] Saved tokens from OTP (session starts now)');
  }

  /// Save tokens after a refresh (keeps existing OTP timestamp).
  static Future<void> saveTokensFromRefresh({
    required String accessToken,
    String? refreshToken,
    String? lockId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;

    await prefs.setString(_keyAccessToken, accessToken);
    if (refreshToken != null && refreshToken.isNotEmpty) {
      await prefs.setString(_keyRefreshToken, refreshToken);
    }
    await prefs.setInt(_keyTokenCreatedAt, now);
    if (lockId != null && lockId.isNotEmpty) {
      await prefs.setString(_keyLockID, lockId);
    }

    print('[TokenManager] Saved tokens from refresh');
  }

  /// Save lock ID separately (e.g. after getLockList).
  static Future<void> saveLockId(String lockId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLockID, lockId);
    print('[TokenManager] Saved lockID: $lockId');
  }

  // ─── Token Retrieval ───

  /// Load stored access token (may be null if never saved).
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessToken);
  }

  /// Load stored refresh token.
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRefreshToken);
  }

  /// Load stored lock ID.
  static Future<String?> getLockId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLockID);
  }

  // ─── Freshness Checks ───

  /// Returns true if the access token is older than 3 days and needs a refresh.
  static Future<bool> needsTokenRefresh() async {
    final prefs = await SharedPreferences.getInstance();
    final createdAt = prefs.getInt(_keyTokenCreatedAt);
    if (createdAt == null) return true; // no timestamp → treat as expired

    final age = DateTime.now().millisecondsSinceEpoch - createdAt;
    final threshold = const Duration(days: _tokenRefreshDays).inMilliseconds;
    return age >= threshold;
  }

  /// Returns true if the OTP session has expired (>7 days since OTP verified).
  /// When true, a new OTP must be requested.
  static Future<bool> needsNewOtp() async {
    final prefs = await SharedPreferences.getInstance();
    final otpTimestamp = prefs.getInt(_keyOtpTimestamp);
    if (otpTimestamp == null) return true; // never verified

    final age = DateTime.now().millisecondsSinceEpoch - otpTimestamp;
    final threshold = const Duration(days: _otpValidityDays).inMilliseconds;
    return age >= threshold;
  }

  /// Returns true if we have stored tokens at all.
  static Future<bool> hasStoredTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_keyAccessToken);
    final refreshToken = prefs.getString(_keyRefreshToken);
    return accessToken != null &&
        accessToken.isNotEmpty &&
        refreshToken != null &&
        refreshToken.isNotEmpty;
  }

  // ─── Clear ───

  /// Wipe all stored tokens (e.g. on refresh failure when OTP also expired).
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccessToken);
    await prefs.remove(_keyRefreshToken);
    await prefs.remove(_keyTokenCreatedAt);
    await prefs.remove(_keyOtpTimestamp);
    await prefs.remove(_keyLockID);
    print('[TokenManager] Cleared all tokens');
  }

  // ─── User Profile Persistence ───

  /// Save the currently active user profile name.
  static Future<void> saveActiveUser(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyActiveUser, userName);
    print('[TokenManager] Saved active user: $userName');
  }

  /// Load the persisted active user profile name (may be null).
  static Future<String?> loadActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyActiveUser);
  }

  /// Clear the saved user (reset to "Mumbai Home").
  static Future<void> clearActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyActiveUser);
    print('[TokenManager] Cleared active user');
  }
}
