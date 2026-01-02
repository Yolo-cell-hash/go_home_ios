import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:godrej_home/utils/app_state.dart';

import 'package:godrej_home/screens/splash_screen.dart';
import 'package:godrej_home/screens/splash_screen2.dart';
import 'package:godrej_home/screens/home_screen.dart';
import 'package:godrej_home/screens/main_screen.dart';

Future<void> _requestAllPermissions() async {
  final permissions = [
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    Permission.location,
    Permission.locationWhenInUse,
    Permission.notification,
    Permission.storage,
  ];

  await permissions.request();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _requestAllPermissions();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, WidgetBuilder> appRoutes = {
    '/': (context) => SplashScreen(),
    '/home': (context) => HomeScreen(),
    '/ss2': (context) => SplashScreen2(),
    '/main': (context) => MainScreen(presetTitle: '', presetImage: ''),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      routes: appRoutes,
      initialRoute: '/',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF810055),
        primaryContrastingColor: Color(0xFFF1F1ED),
      ),
    );
  }
}
