import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:godrej_home/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.presetTitle,
    required this.presetImage,
  });

  final String presetTitle;
  final String presetImage;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 60.0),
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(color: theme.primaryColor),
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
                                color: theme.scaffoldBackgroundColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              CupertinoIcons.back,
                              size: 40.0,
                              color: theme.scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 45.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                              ModalRoute.withName('/home'),
                            );
                          },
                          child: SvgPicture.asset(
                            'images/Group 133-cropped.svg',
                            color: CupertinoColors.white,
                            width: 125,
                            height: 125,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: theme.scaffoldBackgroundColor,
                        ),
                        child: Center(
                          child: Image.asset('images/Vector-3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      'images/${widget.presetImage}',
                      fit: BoxFit.contain,
                    ),

                    Positioned(
                      bottom: 180,
                      right: 80,
                      child: Center(
                        child: CupertinoButton(
                          color: theme.scaffoldBackgroundColor,
                          child: Text(
                            'Setup',
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: 'GEG',
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.4,
                            ),
                          ),
                          onPressed: () {
                            print('Setup was clicked');
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 80,
                      child: Center(
                        child: CupertinoButton(
                          color: theme.scaffoldBackgroundColor,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: 'GEG',
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.4,
                            ),
                          ),
                          onPressed: () {
                            print('Setup was clicked');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
