import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:godrej_home/widgets/features_panel.dart';
import 'package:godrej_home/widgets/room_navbar_special.dart';

class KitchenMainScreen extends StatefulWidget {
  const KitchenMainScreen({super.key});

  @override
  State<KitchenMainScreen> createState() => _KitchenMainScreenState();
}

class _KitchenMainScreenState extends State<KitchenMainScreen> {
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
                imgPath: 'kitchen_bg.png',
                label: 'Kitchen',
              ),
              FeaturesPanel(
                sectionName: 'Safety',
                theme: theme,
                iconPaths: ['window_sensor.png', 'gas_sensor.png'],
                iconLabels: ['Window Sensor', 'Gas Sensor'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Window Sensor tapped');
                      break;
                    case 1:
                      print('Gas Sensor tapped');
                      break;
                  }
                },
              ),
              FeaturesPanel(
                allowToggle: true,
                sectionName: 'Electricals',
                theme: theme,
                iconPaths: ['light_bulb.png', 'fan.png', 'chimney.png'],
                iconLabels: ['Light', 'Fan', 'Chimney'],
                onFeatureTap: (index) {
                  switch (index) {
                    case 0:
                      print('Light Tapped');
                      break;
                    case 1:
                      print('Fan Tapped');
                      break;
                    case 2:
                      print('Chimney Tapped');
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
