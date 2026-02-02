// services/notification_service.dart
// Local notification service for sensor alerts

import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  /// Initialize the notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Android initialization settings
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS initialization settings
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // v20.0.0 uses named parameters
    await _notifications.initialize(settings: initSettings);
    _isInitialized = true;
    print('[NotificationService] Initialized successfully');
  }

  /// Request notification permissions (especially for iOS)
  Future<bool> requestPermissions() async {
    final iOSPermission = await _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    final androidPermission = await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    return iOSPermission ?? androidPermission ?? false;
  }

  /// Show fire alert notification
  Future<void> showFireAlertNotification() async {
    // Ensure initialized
    if (!_isInitialized) {
      await initialize();
    }

    final androidDetails = AndroidNotificationDetails(
      'fire_alert_channel',
      'Fire Alerts',
      channelDescription: 'Critical fire sensor alerts',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      playSound: true,
      color: const Color(0xFFE53935),
      colorized: true,
      category: AndroidNotificationCategory.alarm,
      fullScreenIntent: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.critical,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // v20.0.0 uses named parameters
    await _notifications.show(
      id: 1,
      title: '🔥 Fire Detected!',
      body:
          'Fire sensor has been triggered. Please evacuate immediately and contact emergency services.',
      notificationDetails: details,
    );
    print('[NotificationService] Fire alert notification sent');
  }

  /// Show window open notification
  Future<void> showWindowOpenNotification() async {
    // Ensure initialized
    if (!_isInitialized) {
      await initialize();
    }

    final androidDetails = AndroidNotificationDetails(
      'window_alert_channel',
      'Window Alerts',
      channelDescription: 'Window sensor alerts',
      importance: Importance.high,
      priority: Priority.high,
      enableVibration: true,
      playSound: true,
      color: const Color(0xFFFF9800),
      colorized: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // v20.0.0 uses named parameters
    await _notifications.show(
      id: 2,
      title: '🪟 Window Open!',
      body:
          'Window sensor detected that a window is open. Please check if this is intentional.',
      notificationDetails: details,
    );
    print('[NotificationService] Window open notification sent');
  }

  /// Cancel all notifications
  Future<void> cancelAll() async {
    await _notifications.cancelAll();
  }
}
