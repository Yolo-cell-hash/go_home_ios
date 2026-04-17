// services/preset_override_helper.dart
// Shared helper for all control screens to check preset overrides.
// Fetches the active preset on screen init, then provides synchronous
// comparison for each toggle — no async gap before dialog display.

import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:godrej_home/services/preset_manager.dart';

/// Holds the fetched preset data + metadata for the currently active profile.
/// Created once when a control screen opens and used for all subsequent checks.
class ActivePresetInfo {
  /// Human-readable label (e.g. "Jay", "Good Morning").
  final String presetLabel;

  /// The preset key-value map fetched from Firebase /presets/{user} or SharedPrefs.
  final Map<String, dynamic> presetData;

  /// True when the active preset is a user profile, false for a scene.
  final bool isUserProfile;

  /// Scene index (0-3) when [isUserProfile] is false, otherwise -1.
  final int sceneIndex;

  /// The resolved Firebase key under /presets/{user} when [isUserProfile] is true.
  final String? resolvedUserKey;

  const ActivePresetInfo({
    required this.presetLabel,
    required this.presetData,
    required this.isUserProfile,
    required this.sceneIndex,
    this.resolvedUserKey,
  });
}

class PresetOverrideHelper {
  // Scene name → index mapping (all lowercase for matching)
  static const Map<String, int> _sceneNameToIndex = {
    'good morning': 0,
    'good night': 1,
    'house party': 2,
    'vaccation': 3,
  };

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Fetch the currently active preset once (call on screen init).
  ///
  /// Reads the full /automation-flags node, extracts the 'profile' field,
  /// then fetches the preset from /presets/{user} or SharedPreferences.
  ///
  /// Returns `null` when no profile/scene is active (toggles should go through
  /// directly without any dialog).
  static Future<ActivePresetInfo?> fetchActivePreset() async {
    print('[PresetOverrideHelper] fetchActivePreset called');

    // ── Step 1: Read the entire automation-flags node ──
    // NOTE: Firebase .get() on child paths returns the parent map in this SDK
    // version, so we read the whole node and extract 'profile' manually.
    String? profileValue;
    try {
      final flagsRef = FirebaseDatabase.instance.ref('automation-flags');
      final snapshot = await flagsRef.get();

      if (snapshot.exists && snapshot.value is Map) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final raw = data['profile'];
        print('[PresetOverrideHelper] Extracted profile field: '
            '$raw (${raw.runtimeType})');

        if (raw is String && raw.trim().isNotEmpty) {
          profileValue = raw.trim();
        } else if (raw != null) {
          print('[PresetOverrideHelper] WARNING: profile field is '
              '${raw.runtimeType}, expected String');
        }
      } else {
        print('[PresetOverrideHelper] automation-flags snapshot empty');
      }
    } catch (e) {
      print('[PresetOverrideHelper] Failed to read automation-flags: $e');
    }

    if (profileValue == null) {
      print('[PresetOverrideHelper] No active profile — no preset to load');
      return null;
    }

    print('[PresetOverrideHelper] Active profile: "$profileValue"');

    // ── Step 2: Determine scene vs user profile ──
    final profileLower = profileValue.toLowerCase();
    final sceneIndex = _sceneNameToIndex[profileLower];

    if (sceneIndex != null) {
      // Scene preset — read from SharedPreferences
      print('[PresetOverrideHelper] Profile is SCENE (index=$sceneIndex)');
      try {
        final preset = await PresetManager.getPreset(sceneIndex);
        print('[PresetOverrideHelper] Scene preset loaded: $preset');
        return ActivePresetInfo(
          presetLabel: PresetManager.sceneNames[sceneIndex],
          presetData: preset,
          isUserProfile: false,
          sceneIndex: sceneIndex,
        );
      } catch (e) {
        print('[PresetOverrideHelper] Failed to load scene preset: $e');
        return null;
      }
    } else {
      // User profile — read from Firebase /presets/{user}
      print('[PresetOverrideHelper] Profile is USER: "$profileValue"');
      try {
        final presetsRef = FirebaseDatabase.instance.ref('presets');
        final attempts = [profileValue, profileValue.toLowerCase()];
        for (final attempt in attempts) {
          final snap = await presetsRef.child(attempt).get();
          print('[PresetOverrideHelper] Checking /presets/$attempt: '
              'exists=${snap.exists}');
          if (snap.exists && snap.value is Map) {
            final preset = Map<String, dynamic>.from(snap.value as Map);
            final displayName = profileValue.isNotEmpty
                ? profileValue[0].toUpperCase() +
                    profileValue.substring(1).toLowerCase()
                : 'User';
            print('[PresetOverrideHelper] User preset loaded: $preset');
            return ActivePresetInfo(
              presetLabel: displayName,
              presetData: preset,
              isUserProfile: true,
              sceneIndex: -1,
              resolvedUserKey: attempt,
            );
          }
        }
        print('[PresetOverrideHelper] No preset found for "$profileValue"');
      } catch (e) {
        print('[PresetOverrideHelper] Failed to load user preset: $e');
      }
      return null;
    }
  }

  /// Synchronous check: does [newValue] differ from the cached preset for [dbKey]?
  ///
  /// Returns `true` when the override dialog should be shown.
  static bool shouldShowDialog({
    required ActivePresetInfo? activePreset,
    required String dbKey,
    required dynamic newValue,
  }) {
    if (activePreset == null) return false;

    final presetValue = activePreset.presetData[dbKey];
    if (presetValue == null) return false; // key not in preset — allow directly

    final differs = !_valuesEqual(presetValue, newValue);
    print('[PresetOverrideHelper] shouldShowDialog: '
        'preset[$dbKey]=$presetValue, newValue=$newValue, differs=$differs');
    return differs;
  }

  /// Write a value directly to /automation-flags/{dbKey}.
  static Future<void> writeToAutomationFlags(
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
  ///
  /// The caller **must** verify the widget is mounted before calling this.
  static void showOverrideDialog({
    required BuildContext context,
    required ActivePresetInfo activePreset,
    required String dbKey,
    required dynamic newValue,
    required String deviceName,
    /// Called after the preset data is updated (lets the caller refresh its cache).
    void Function(String dbKey, dynamic newValue)? onPresetUpdated,
  }) {
    print('[PresetOverrideHelper] showOverrideDialog: '
        'preset="${activePreset.presetLabel}", '
        'dbKey=$dbKey, newValue=$newValue');

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
              '"${activePreset.presetLabel}" preset.\n\n'
              'Would you like to apply this change once, or update your '
              '"${activePreset.presetLabel}" preset so it remembers this '
              'setting?',
            ),
          ),
          actions: [
            // ── Set for Once ──
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await writeToAutomationFlags(dbKey, newValue);
                print('[PresetOverrideHelper] Once-only: $dbKey = $newValue');
              },
              child: const Text('Set for Once'),
            ),
            // ── Update My Preset ──
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await writeToAutomationFlags(dbKey, newValue);

                // Persist to preset store
                if (activePreset.isUserProfile &&
                    activePreset.resolvedUserKey != null) {
                  try {
                    final presetsRef =
                        FirebaseDatabase.instance.ref('presets');
                    await presetsRef
                        .child(activePreset.resolvedUserKey!)
                        .child(dbKey)
                        .set(newValue);
                    print('[PresetOverrideHelper] Updated /presets/'
                        '${activePreset.resolvedUserKey}/$dbKey = $newValue');
                  } catch (e) {
                    print('[PresetOverrideHelper] Failed to update user '
                        'preset: $e');
                  }
                } else if (!activePreset.isUserProfile &&
                    activePreset.sceneIndex >= 0) {
                  await PresetManager.updatePresetValue(
                      activePreset.sceneIndex, dbKey, newValue);
                  print('[PresetOverrideHelper] Scene preset updated: '
                      '$dbKey = $newValue');
                }

                // Notify caller so it can update its cached preset
                onPresetUpdated?.call(dbKey, newValue);

                if (context.mounted) {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                      title: const Text('Preset Updated'),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '"${activePreset.presetLabel}" preset has been '
                          'updated with the new $deviceName setting.',
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
                print('[PresetOverrideHelper] Preset updated: '
                    '$dbKey = $newValue');
              },
              child: const Text('Update My Preset'),
            ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Deferred override (prompt on exit, not on every change)
  // ---------------------------------------------------------------------------

  /// Check whether any entries in [pendingChanges] differ from the cached
  /// [activePreset]. Returns `true` when the exit dialog should be shown.
  static bool hasPendingPresetChanges({
    required ActivePresetInfo? activePreset,
    required Map<String, dynamic> pendingChanges,
  }) {
    if (activePreset == null || pendingChanges.isEmpty) return false;

    for (final entry in pendingChanges.entries) {
      final presetValue = activePreset.presetData[entry.key];
      if (presetValue == null) continue; // key not in preset — skip
      if (!_valuesEqual(presetValue, entry.value)) {
        print('[PresetOverrideHelper] Pending diff: '
            '${entry.key} preset=$presetValue current=${entry.value}');
        return true;
      }
    }
    return false;
  }

  /// Collect all keys from [pendingChanges] that actually differ from the
  /// cached preset. Returns a filtered map of only the differing entries.
  static Map<String, dynamic> _getDifferingChanges({
    required ActivePresetInfo activePreset,
    required Map<String, dynamic> pendingChanges,
  }) {
    final diffs = <String, dynamic>{};
    for (final entry in pendingChanges.entries) {
      final presetValue = activePreset.presetData[entry.key];
      if (presetValue == null) continue;
      if (!_valuesEqual(presetValue, entry.value)) {
        diffs[entry.key] = entry.value;
      }
    }
    return diffs;
  }

  /// Human-readable labels for common DB keys.
  static const Map<String, String> _keyLabels = {
    'fan': 'Fan Power',
    'fan-speed': 'Fan Speed',
    'light': 'Light Power',
    'light-hex-value': 'Light Color',
    'light intensity': 'Light Intensity',
    'party': 'Party Mode',
    'ac': 'AC Power',
    'ac-temp': 'AC Temperature',
    'ac-mode': 'AC Mode',
    'ac-fan-speed': 'AC Fan Speed',
  };

  /// Show a **single** exit dialog summarising all pending changes.\n
  /// Called when the user tries to leave a control screen with unsaved diffs.
  ///
  /// - **"Keep as One-Time"** → pops without writing to preset.
  /// - **"Save to Preset"** → writes all diffs to the preset, then pops.
  ///
  /// Returns a [Future<bool>] — `true` means the caller should allow the pop.
  static Future<bool> showExitOverrideDialog({
    required BuildContext context,
    required ActivePresetInfo activePreset,
    required Map<String, dynamic> pendingChanges,
  }) async {
    final diffs = _getDifferingChanges(
      activePreset: activePreset,
      pendingChanges: pendingChanges,
    );

    if (diffs.isEmpty) return true; // nothing to save — allow pop

    // Build human-readable change summary
    final changeList = diffs.keys
        .map((k) => _keyLabels[k] ?? k)
        .toList();
    final summary = changeList.length == 1
        ? changeList.first
        : '${changeList.sublist(0, changeList.length - 1).join(", ")} and ${changeList.last}';

    print('[PresetOverrideHelper] showExitOverrideDialog: '
        'preset="${activePreset.presetLabel}", diffs=$diffs');

    final result = await showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: const Text('Unsaved Changes'),
          content: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'You changed $summary which differs from your '
              '"${activePreset.presetLabel}" preset.\n\n'
              'Would you like to keep this as a one-time change, '
              'or save it to your "${activePreset.presetLabel}" preset?',
            ),
          ),
          actions: [
            // ── Keep as One-Time ──
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
                print('[PresetOverrideHelper] Exit: one-time only');
              },
              child: const Text('One-Time Only'),
            ),
            // ── Save to Preset ──
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(dialogContext).pop(true);

                // Write all diffs to the preset store
                if (activePreset.isUserProfile &&
                    activePreset.resolvedUserKey != null) {
                  try {
                    final presetsRef =
                        FirebaseDatabase.instance.ref('presets');
                    for (final entry in diffs.entries) {
                      await presetsRef
                          .child(activePreset.resolvedUserKey!)
                          .child(entry.key)
                          .set(entry.value);
                    }
                    print('[PresetOverrideHelper] Exit: user preset '
                        '${activePreset.resolvedUserKey} updated with $diffs');
                  } catch (e) {
                    print('[PresetOverrideHelper] Failed to update user '
                        'preset on exit: $e');
                  }
                } else if (!activePreset.isUserProfile &&
                    activePreset.sceneIndex >= 0) {
                  for (final entry in diffs.entries) {
                    await PresetManager.updatePresetValue(
                      activePreset.sceneIndex,
                      entry.key,
                      entry.value,
                    );
                  }
                  print('[PresetOverrideHelper] Exit: scene preset '
                      '${activePreset.sceneIndex} updated with $diffs');
                }

                // Show confirmation
                if (context.mounted) {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                      title: const Text('Preset Updated'),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '"${activePreset.presetLabel}" preset has been '
                          'updated with your changes.',
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
              },
              child: const Text('Save to Preset'),
            ),
          ],
        );
      },
    );

    return result ?? true;
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

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
}
