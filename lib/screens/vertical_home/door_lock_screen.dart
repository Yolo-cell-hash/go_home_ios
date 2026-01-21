// vertical_home/door_lock_screen.dart
// Door lock control screen

import 'package:flutter/cupertino.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Door lock control screen
class DoorLockScreen extends StatelessWidget {
  const DoorLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      child: NavbarSetup(
        theme: theme,
        imgPath: 'door_lock',
        label: 'Door Lock',
      ),
    );
  }
}
