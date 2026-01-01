import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:godrej_home/screens/home_screen.dart';
import 'package:godrej_home/screens/splash_screen2.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      backgroundColor: Colors.white,
      duration: const Duration(milliseconds: 3000),
      childWidget: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Image.asset('images/Group 93.png', height: 100),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: SplashScreen2(),
    );
  }
}
