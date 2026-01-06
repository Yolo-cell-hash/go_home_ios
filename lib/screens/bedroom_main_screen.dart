import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:godrej_home/widgets/features_panel.dart';
import 'package:godrej_home/widgets/room_navbar_special.dart';

class BedroomMainScreen extends StatefulWidget {
  const BedroomMainScreen({super.key});

  @override
  State<BedroomMainScreen> createState() => _BedroomMainScreenState();
}

class _BedroomMainScreenState extends State<BedroomMainScreen> {
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
                imgPath: 'bedroom_bg.png',
                label: 'Bedroom',
              ),
              FeaturesPanel(
                sectionName: 'Safety',
                theme: theme,
                iconPaths: ['window_sensor.png', 'fire_sensor.png'],
                iconLabels: ['Window Sensor', 'Fire & Smoke Sensor'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Window Sensor tapped');
                      break;
                    case 1:
                      print('Fire & Smoke Sensor tapped');
                      break;
                  }
                },
              ),
              FeaturesPanel(
                allowToggle: true,
                sectionName: 'Electricals',
                theme: theme,
                iconPaths: ['bedroom.png', 'wardrobe.png', 'ac.png'],
                iconLabels: ['Bed Storage', 'Wardrobe', 'Air-Conditioner'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Bed Storage Tapped');
                      break;
                    case 1:
                      print('Wardrobe Tapped');
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
