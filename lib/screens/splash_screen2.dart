import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:godrej_home/screens/home_screen.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      duration: const Duration(milliseconds: 1500),
      childWidget: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SvgPicture.asset('images/Group 133.svg', height: 100),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: HomeScreen(),
    );
  }
}
