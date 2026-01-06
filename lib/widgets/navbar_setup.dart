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
    return Column(
      children: [
        Container(
          color: widget.theme.primaryColor,
          padding: EdgeInsets.only(
            top: 60.0,
            left: 60.0,
            right: 60.0,
            bottom: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.theme.scaffoldBackgroundColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
                      ),
                      child: Icon(
                        CupertinoIcons.back,
                        size: 28.0,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Center(
                    child: Image.asset(
                      'images/${widget.imgPath}_circle.png',
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: widget.theme.primaryColor,
          padding: EdgeInsets.only(left: 155.0, right: 70.0, bottom: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  letterSpacing: 1.8,
                  fontFamily: 'GEG',
                  color: widget.theme.primaryContrastingColor,
                  fontSize: 28,
                ),
              ),
              Icon(CupertinoIcons.pencil, color: Colors.white, size: 35.0),
            ],
          ),
        ),
      ],
    );
  }
}
