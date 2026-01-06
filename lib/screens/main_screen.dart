import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:godrej_home/screens/home_screen.dart';
import 'package:godrej_home/screens/setup_main_screen.dart';
import 'package:godrej_home/utils/app_state.dart';

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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = Provider.of<AppState>(context, listen: false);

      String mood;
      if (widget.presetImage.contains('morning_poster')) {
        print("Morning - ${widget.presetImage}");
        mood = 'morning_poster';
      } else if (widget.presetImage.contains('evening_poster')) {
        print("Evening  - ${widget.presetImage}");
        mood = 'evening_poster';
      } else {
        print("Party  - ${widget.presetImage}");
        mood = 'party_poster';
      }

      appState.setMood(mood);
    });
  }

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
                height: 270.0,
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
                      onTap: () {},
                      child: Container(
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
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
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: double.infinity,
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
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SetupMainScreen(),
                              ),
                            );
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
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color:
                                                  CupertinoColors.systemGrey4,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Status',
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'GEG',
                                                color: theme.primaryColor,
                                              ),
                                            ),
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              child: Text('Cancel'),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Foyer',
                                                style: TextStyle(
                                                  fontFamily: 'GEG',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: theme.primaryColor,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
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
