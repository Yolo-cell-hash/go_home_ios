import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:godrej_home/widgets/room_navbar_special.dart';
import 'package:godrej_home/widgets/features_panel.dart';

class FoyerMainScreen extends StatefulWidget {
  const FoyerMainScreen({super.key});

  @override
  State<FoyerMainScreen> createState() => _FoyerMainScreenState();
}

class _FoyerMainScreenState extends State<FoyerMainScreen> {
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
                imgPath: 'foyer_bg.png',
                label: 'Foyer',
              ),
              FeaturesPanel(
                sectionName: 'Safety',
                theme: theme,
                iconPaths: ['door_lock.png', 'vdb_icon.png', 'camera.png'],
                iconLabels: ['Door Lock', 'Video Door Bell', 'Camera'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Door Lock tapped');
                      break;
                    case 1:
                      print('Video Door Bell tapped');
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
                iconPaths: ['light_bulb.png', 'light_bulb.png', 'fan.png'],
                iconLabels: ['Light 1', 'Light 2', 'Fan'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Light 1 Tapped');
                      break;
                    case 1:
                      print('Light 2 Tapped');
                      break;
                    case 2:
                      print('Fan Tapped');
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
