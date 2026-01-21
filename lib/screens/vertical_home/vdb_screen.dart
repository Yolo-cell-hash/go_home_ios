// vertical_home/vdb_screen.dart
// VDB (Video Door Bell) control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// VDB control screen
class VDBScreen extends StatelessWidget {
  const VDBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      child: NavbarSetup(
        theme: theme,
        imgPath: 'vdb',
        label: 'Video Door Bell',
      ),
    );
  }
}
