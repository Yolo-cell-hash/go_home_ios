import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:godrej_home/screens/home_screen.dart';

class NavbarSetup extends StatefulWidget {
  const NavbarSetup({
    super.key,
    required this.theme,
    required this.imgPath,
    required this.label,
  });

  final CupertinoThemeData theme;
  final String imgPath, label;

  @override
  State<NavbarSetup> createState() => _NavbarSetupState();
}

class _NavbarSetupState extends State<NavbarSetup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.theme.primaryColor,
      padding: EdgeInsets.only(
        top: 60.0,
        left: 60.0,
        right: 60.0,
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button - consistent with room_control_screen style
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.theme.scaffoldBackgroundColor,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.chevron_left,
                    size: 20,
                    color: widget.theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
              SizedBox(width: 45.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                    ModalRoute.withName('/home'),
                  );
                },
                child: SvgPicture.asset(
                  'images/Group 133-cropped.svg',
                  color: CupertinoColors.white,
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
