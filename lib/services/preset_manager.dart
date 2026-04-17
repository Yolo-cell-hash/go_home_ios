// services/preset_manager.dart
// Manages scene presets stored in SharedPreferences.
// Allows presets to be read, updated per-key, and reset to factory defaults.

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PresetManager {
  // SharedPreferences keys for scene presets (one per scene)
  static const String _keyPrefix = 'scene_preset_';

  // Scene names for debugging/logging
  static const List<String> sceneNames = [
    'Good Morning',
    'Good Night',
    'House Party',
    'Vaccation',
  ];

  /// Factory-default presets for all 4 scenes.
  /// These match the values previously hardcoded in vertical_home_screen.dart.
  static final List<Map<String, dynamic>> _defaultPresets = [
    // 0 — Good Morning
    {
      'light intensity': 50,
      'ac': true,
      'ac-temp': 24,
      'ac-mode': 'cool',
      'ac-fan-speed': 'Auto',
      'light-hex-value': '255,255,255',
      'camera': true,
      'door-lock': true,
      'bed-storage': true,
      'vdb': true,
      'light': false,
      'fan': true,
      'fan-speed': 3,
      'isFire': true,
      'is-window-open': true,
      'window-sensor': true,
      'party': false,
    },
    // 1 — Good Night
    {
      'ac': true,
      'ac-temp': 20,
      'ac-mode': 'cool',
      'ac-fan-speed': 'Low',
      'light intensity': 120,
      'light-hex-value': '255,0,193',
      'camera': true,
      'door-lock': true,
      'bed-storage': false,
      'vdb': true,
      'light': true,
      'fan': true,
      'fan-speed': 4,
      'isFire': true,
      'is-window-open': true,
      'window-sensor': true,
      'party': false,
    },
    // 2 — House Party
    {
      'ac': true,
      'ac-temp': 21,
      'ac-mode': 'cool',
      'ac-fan-speed': 'High',
      'light intensity': 220,
      'light-hex-value': '255,0,193',
      'camera': true,
      'door-lock': false,
      'bed-storage': false,
      'vdb': false,
      'light': true,
      'fan': true,
      'fan-speed': 4,
      'isFire': true,
      'is-window-open': true,
      'window-sensor': true,
      'party': true,
    },
    // 3 — Vaccation
    {
      'ac': false,
      'ac-temp': 26,
      'ac-mode': 'auto',
      'ac-fan-speed': 'Auto',
      'light intensity': 0,
      'light-hex-value': '255,0,193',
      'camera': true,
      'door-lock': true,
      'bed-storage': false,
      'vdb': true,
      'light': false,
      'fan': false,
      'fan-speed': 1,
      'isFire': true,
      'is-window-open': true,
      'window-sensor': true,
      'party': false,
    },
  ];

  /// Initialize default presets in SharedPreferences if they don't exist yet.
  /// Safe to call on every app launch — only writes if the key is missing.
  static Future<void> initDefaults() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _defaultPresets.length; i++) {
      final key = '$_keyPrefix$i';
      if (!prefs.containsKey(key)) {
        await prefs.setString(key, jsonEncode(_defaultPresets[i]));
        print('[PresetManager] Initialized default preset $i (${sceneNames[i]})');
      }
    }
    print('[PresetManager] initDefaults complete');
  }

  /// Return the preset map for the given scene index (0–3).
  /// Falls back to factory default if SharedPreferences read fails.
  static Future<Map<String, dynamic>> getPreset(int sceneIndex) async {
    assert(sceneIndex >= 0 && sceneIndex < _defaultPresets.length);
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_keyPrefix$sceneIndex';
      final raw = prefs.getString(key);
      if (raw != null) {
        final decoded = Map<String, dynamic>.from(jsonDecode(raw) as Map);
        print('[PresetManager] Loaded preset $sceneIndex: $decoded');
        return decoded;
      }
    } catch (e) {
      print('[PresetManager] Error reading preset $sceneIndex: $e');
    }
    // Fallback to factory default
    print('[PresetManager] Using factory default for preset $sceneIndex');
    return Map<String, dynamic>.from(_defaultPresets[sceneIndex]);
  }

  /// Update a single key inside the given scene's preset.
  /// For example: updatePresetValue(0, 'ac', false) turns AC off in Good Morning.
  static Future<void> updatePresetValue(
    int sceneIndex,
    String dbKey,
    dynamic value,
  ) async {
    assert(sceneIndex >= 0 && sceneIndex < _defaultPresets.length);
    try {
      final preset = await getPreset(sceneIndex);
      preset[dbKey] = value;
      final prefs = await SharedPreferences.getInstance();
      final key = '$_keyPrefix$sceneIndex';
      await prefs.setString(key, jsonEncode(preset));
      print(
        '[PresetManager] Updated preset $sceneIndex: $dbKey = $value',
      );
    } catch (e) {
      print('[PresetManager] Error updating preset $sceneIndex/$dbKey: $e');
    }
  }

  /// Reset all presets back to factory defaults.
  static Future<void> resetPresets() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _defaultPresets.length; i++) {
      final key = '$_keyPrefix$i';
      await prefs.setString(key, jsonEncode(_defaultPresets[i]));
    }
    print('[PresetManager] All presets reset to factory defaults');
  }
}
