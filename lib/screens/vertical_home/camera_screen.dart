// vertical_home/camera_screen.dart
// Camera control screen

import 'package:flutter/cupertino.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Camera control screen
class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      child: NavbarSetup(
        theme: theme,
        imgPath: 'evening_poster',
        label: 'Camera',
      ),
    );
  }
}
