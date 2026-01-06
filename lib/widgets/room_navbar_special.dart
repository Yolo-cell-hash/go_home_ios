import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:godrej_home/screens/home_screen.dart';
import 'package:godrej_home/utils/app_state.dart';

class RoomNavbarSpecial extends StatefulWidget {
  const RoomNavbarSpecial({
    super.key,
    required this.theme,
    required this.imgPath,
    required this.label,
  });

  final CupertinoThemeData theme;
  final String imgPath, label;

  @override
  State<RoomNavbarSpecial> createState() => _RoomNavbarSpecial();
}

class _RoomNavbarSpecial extends State<RoomNavbarSpecial> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    String currentMood = appState.mood;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${widget.imgPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
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
                            color: widget.theme.primaryColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.transparent,
                        ),
                        child: Icon(
                          CupertinoIcons.back,
                          size: 28.0,
                          color: widget.theme.primaryColor,
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
                        color: Color(0xFF810055),
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Center(
                    child: Image.asset(
                      'images/${currentMood}_circle.png',
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
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
                    color: widget.theme.primaryColor,
                    fontSize: 28,
                  ),
                ),
                Icon(
                  CupertinoIcons.pencil,
                  color: Color(0xFF810055),
                  size: 35.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
