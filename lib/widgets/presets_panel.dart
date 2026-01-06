import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:godrej_home/widgets/onboarding_card.dart';
import 'package:godrej_home/screens/main_screen.dart';

class PresetsPanel extends StatefulWidget {
  const PresetsPanel({super.key, required this.theme});
  final CupertinoThemeData theme;

  @override
  State<PresetsPanel> createState() => _PresetsPanelState();
}

class _PresetsPanelState extends State<PresetsPanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OnboardingCard(
          action: () {
            print('Morning Action called');
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const MainScreen(
                  presetTitle: 'Morning',
                  presetImage: 'morning_poster.png',
                ),
              ),
            );
          },
          doesHaveImg: true,
          theme: widget.theme,
          imgValue: 'morning_poster_circle',
          isEditPreset: false,
          title: 'Morning',
        ),
        OnboardingCard(
          action: () {
            print('Evening Action Called');
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const MainScreen(
                  presetTitle: 'Evening',
                  presetImage: 'evening_poster.png',
                ),
              ),
            );
          },
          doesHaveImg: true,
          theme: widget.theme,
          imgValue: 'evening_poster_circle',
          isEditPreset: false,
          title: 'Evening',
        ),
        OnboardingCard(
          action: () {
            print('Party Action Clicked');
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const MainScreen(
                  presetTitle: 'Party',
                  presetImage: 'party_poster.png',
                ),
              ),
            );
          },
          doesHaveImg: true,
          theme: widget.theme,
          imgValue: 'party_poster_circle',
          title: 'Party',
          isEditPreset: false,
        ),
        OnboardingCard(
          action: () {
            print('Create action called');
          },
          doesHaveImg: false,
          theme: widget.theme,
          isEditPreset: true,
        ),
      ],
    );
  }
}
