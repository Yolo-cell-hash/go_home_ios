import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:godrej_home/widgets/room_navbar_special.dart';
import 'package:godrej_home/widgets/features_panel.dart';

class LivingMainScreen extends StatefulWidget {
  const LivingMainScreen({super.key});

  @override
  State<LivingMainScreen> createState() => _LivingMainScreenState();
}

class _LivingMainScreenState extends State<LivingMainScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(
            children: [
              RoomNavbarSpecial(
                theme: theme,
                imgPath: 'living_room_bg.png',
                label: 'Living Room',
              ),
              FeaturesPanel(
                sectionName: 'Safety',
                theme: theme,
                iconPaths: [
                  'window_sensor.png',
                  'fire_sensor.png',
                  'camera.png',
                ],
                iconLabels: ['Window Sensor', 'Fire & Smoke Sensor', 'Camera'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Window Sensor tapped');
                      break;
                    case 1:
                      print('Fire & Smoke Sensor tapped');
                      break;
                    case 2:
                      print('Camera tapped');
                      break;
                  }
                },
              ),
              FeaturesPanel(
                allowToggle: true,
                sectionName: 'Electricals',
                theme: theme,
                iconPaths: ['light_bulb.png', 'fan.png', 'ac.png'],
                iconLabels: ['Light', 'Fan', 'Air-Conditioner'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Light Tapped');
                      break;
                    case 1:
                      print('Fan Tapped');
                      break;
                    case 2:
                      print('Air-Conditioner Tapped');
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
