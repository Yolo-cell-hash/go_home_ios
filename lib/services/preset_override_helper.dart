// services/preset_override_helper.dart
// Shared helper for all control screens to check preset overrides.
// Reads the active profile from Firebase /automation-flags/profile,
// determines whether a scene or user profile is active, compares the
// proposed value against the preset, and shows the override dialog.

import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/services/preset_manager.dart';

class PresetOverrideHelper {
  // Scene name → index mapping (all lowercase for matching)
  static const Map<String, int> _sceneNameToIndex = {
    'good morning': 0,
    'good night': 1,
    'house party': 2,
    'vaccation': 3,
  };

  /// Core method: update a Firebase value with preset-override awareness.
  ///
  /// 1. Reads /automation-flags/profile to determine the active preset.
  /// 2. If a scene is active, compares against SharedPreferences preset.
  /// 3. If a user profile is active, compares against Firebase /presets/{user}.
  /// 4. If values differ, shows the override dialog.
  /// 5. Otherwise writes directly to /automation-flags/{dbKey}.
  static Future<void> updateWithCheck({
    required BuildContext context,
    required String dbKey,
    required dynamic newValue,
    required String deviceName,
    VoidCallback? onDone,
  }) async {
    print('[PresetOverrideHelper] updateWithCheck called: '
        'dbKey=$dbKey, newValue=$newValue, deviceName=$deviceName');

    // Create fresh references each time (avoids static init issues)
    final profileRef = FirebaseDatabase.instance.ref('automation-flags/profile');

    // Step 1: Read current profile value directly from /automation-flags/profile
    String? profileValue;
    try {
      final profileSnapshot = await profileRef.get();
      print('[PresetOverrideHelper] Raw profile snapshot: '
          'exists=${profileSnapshot.exists}, '
          'value=${profileSnapshot.value}, '
          'type=${profileSnapshot.value.runtimeType}');

      if (profileSnapshot.exists && profileSnapshot.value != null) {
        // The value should be a simple string like "jinay" or "Good Morning"
        final raw = profileSnapshot.value;
        if (raw is String) {
          profileValue = raw.trim();
        } else {
          // If it's not a string, convert but warn
          profileValue = raw.toString().trim();
          print('[PresetOverrideHelper] WARNING: profile is not a String, '
              'it is ${raw.runtimeType}: $raw');
        }
        print('[PresetOverrideHelper] Resolved profile: "$profileValue"');
      } else {
        print('[PresetOverrideHelper] No profile value found');
      }
    } catch (e) {
      print('[PresetOverrideHelper] Failed to read profile: $e');
    }

    if (profileValue == null || profileValue.isEmpty) {
      print('[PresetOverrideHelper] No active profile, writing directly');
      await _writeToAutomationFlags(dbKey, newValue);
      onDone?.call();
      return;
    }

    // Step 2: Determine if this is a scene or a user profile
    final profileLower = profileValue.toLowerCase();
    final sceneIndex = _sceneNameToIndex[profileLower];

    if (sceneIndex != null) {
      print('[PresetOverrideHelper] Profile is SCENE: "$profileValue" '
          '(index=$sceneIndex)');
      await _handleSceneCheck(
        context: context,
        sceneIndex: sceneIndex,
        dbKey: dbKey,
        newValue: newValue,
        deviceName: deviceName,
        onDone: onDone,
      );
    } else {
      print('[PresetOverrideHelper] Profile is USER: "$profileValue"');
      await _handleUserCheck(
        context: context,
        userName: profileValue,
        dbKey: dbKey,
        newValue: newValue,
        deviceName: deviceName,
        onDone: onDone,
      );
    }
  }

  /// Check against a scene preset stored in SharedPreferences.
  static Future<void> _handleSceneCheck({
    required BuildContext context,
    required int sceneIndex,
    required String dbKey,
    required dynamic newValue,
    required String deviceName,
    VoidCallback? onDone,
  }) async {
    try {
      final preset = await PresetManager.getPreset(sceneIndex);
      final presetValue = preset[dbKey];

      print('[PresetOverrideHelper] Scene[$sceneIndex] preset '
          '"$dbKey": $presetValue (${presetValue?.runtimeType}), '
          'newValue: $newValue (${newValue.runtimeType})');

      if (presetValue != null && !_valuesEqual(presetValue, newValue)) {
        print('[PresetOverrideHelper] Values DIFFER — showing dialog');
        if (context.mounted) {
          _showOverrideDialog(
            context: context,
            presetLabel: PresetManager.sceneNames[sceneIndex],
            dbKey: dbKey,
            newValue: newValue,
            deviceName: deviceName,
            onUpdatePreset: () async {
              await PresetManager.updatePresetValue(
                  sceneIndex, dbKey, newValue);
            },
            onDone: onDone,
          );
        }
        return;
      }
      print('[PresetOverrideHelper] Values match or key absent — writing directly');
    } catch (e) {
      print('[PresetOverrideHelper] Scene check error: $e');
    }
    await _writeToAutomationFlags(dbKey, newValue);
    onDone?.call();
  }

  /// Check against a user profile preset stored in Firebase /presets/{user}.
  static Future<void> _handleUserCheck({
    required BuildContext context,
    required String userName,
    required String dbKey,
    required dynamic newValue,
    required String deviceName,
    VoidCallback? onDone,
  }) async {
    // Create a fresh reference for presets
    final presetsRef = FirebaseDatabase.instance.ref('presets');

    try {
      // Try the username as-is first, then lowercase
      final attempts = [userName, userName.toLowerCase()];
      Map<String, dynamic>? preset;
      String resolvedKey = userName;

      for (final attempt in attempts) {
        final snap = await presetsRef.child(attempt).get();
        print('[PresetOverrideHelper] Checking /presets/$attempt: '
            'exists=${snap.exists}, type=${snap.value?.runtimeType}');
        if (snap.exists && snap.value is Map) {
          preset = Map<String, dynamic>.from(snap.value as Map);
          resolvedKey = attempt;
          break;
        }
      }

      if (preset == null) {
        print('[PresetOverrideHelper] No preset found for "$userName" — '
            'writing directly');
        await _writeToAutomationFlags(dbKey, newValue);
        onDone?.call();
        return;
      }

      final presetValue = preset[dbKey];
      print('[PresetOverrideHelper] User "$resolvedKey" preset '
          '"$dbKey": $presetValue (${presetValue?.runtimeType}), '
          'newValue: $newValue (${newValue.runtimeType})');

      if (presetValue != null && !_valuesEqual(presetValue, newValue)) {
        print('[PresetOverrideHelper] Values DIFFER — showing dialog');
        final displayName = userName.isNotEmpty
            ? userName[0].toUpperCase() + userName.substring(1).toLowerCase()
            : 'User';

        if (context.mounted) {
          _showOverrideDialog(
            context: context,
            presetLabel: displayName,
            dbKey: dbKey,
            newValue: newValue,
            deviceName: deviceName,
            onUpdatePreset: () async {
              await presetsRef.child(resolvedKey).child(dbKey).set(newValue);
              print('[PresetOverrideHelper] Updated /presets/$resolvedKey'
                  '/$dbKey = $newValue');
            },
            onDone: onDone,
          );
        }
        return;
      }
      print('[PresetOverrideHelper] Values match or key absent — writing directly');
    } catch (e) {
      print('[PresetOverrideHelper] User check error: $e');
    }
    await _writeToAutomationFlags(dbKey, newValue);
    onDone?.call();
  }

  /// Compare two values with type-safe normalization.
  static bool _valuesEqual(dynamic a, dynamic b) {
    if (a == b) return true;
    if (a is num && b is num) return a.toDouble() == b.toDouble();
    if (a is bool && b is bool) return a == b;
    if (a is String && b is String) return a.trim() == b.trim();
    // Cross-type: bool vs string
    if (a is bool && b is String) return a.toString() == b.trim().toLowerCase();
    if (a is String && b is bool) return a.trim().toLowerCase() == b.toString();
    // Cross-type: num vs string
    if (a is num && b is String) {
      final p = num.tryParse(b.trim());
      return p != null && a.toDouble() == p.toDouble();
    }
    if (a is String && b is num) {
      final p = num.tryParse(a.trim());
      return p != null && p.toDouble() == b.toDouble();
    }
    return false;
  }

  /// Write a value directly to /automation-flags/{dbKey}.
  static Future<void> _writeToAutomationFlags(
    String dbKey,
    dynamic value,
  ) async {
    final ref = FirebaseDatabase.instance.ref('automation-flags');
    try {
      await ref.child(dbKey).set(value);
      print('[PresetOverrideHelper] Written /automation-flags/$dbKey = $value');
    } catch (e) {
      print('[PresetOverrideHelper] Failed to write $dbKey: $e');
    }
  }

  /// Show the "Set for Once" / "Update My Preset" dialog.
  static void _showOverrideDialog({
    required BuildContext context,
    required String presetLabel,
    required String dbKey,
    required dynamic newValue,
    required String deviceName,
    required Future<void> Function() onUpdatePreset,
    VoidCallback? onDone,
  }) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: const Text('Override Preset?'),
          content: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'You are changing "$deviceName" which differs from your '
              '"$presetLabel" preset.\n\n'
              'Would you like to apply this change once, or update your '
              '"$presetLabel" preset so it remembers this setting?',
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await _writeToAutomationFlags(dbKey, newValue);
                onDone?.call();
                print('[PresetOverrideHelper] Once-only: $dbKey = $newValue');
              },
              child: const Text('Set for Once'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await _writeToAutomationFlags(dbKey, newValue);
                await onUpdatePreset();
                onDone?.call();

                if (context.mounted) {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                      title: const Text('Preset Updated'),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '"$presetLabel" preset has been updated with the '
                          'new $deviceName setting.',
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
                print('[PresetOverrideHelper] Preset updated: $dbKey = $newValue');
              },
              child: const Text('Update My Preset'),
            ),
          ],
        );
      },
    );
  }
}
