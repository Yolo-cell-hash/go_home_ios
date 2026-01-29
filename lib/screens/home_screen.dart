import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';

import 'package:godrej_home/widgets/navbar_home_screen.dart';
import 'package:godrej_home/widgets/onboarding_card.dart';
import 'package:godrej_home/widgets/presets_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return SafeArea(
      child: FadeIn(
        child: CupertinoPageScaffold(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavbarHomeScreen(theme: theme),
              OnboardingCard(
                action: () {
                  print('Clicked Property Name');
                },
                isEditPreset: false,
                theme: theme,
                doesHaveImg: false,
                title: 'Willow Edge',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150.0,
                  vertical: 50.0,
                ),
                child: PresetsPanel(theme: theme),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
