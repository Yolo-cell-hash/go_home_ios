import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'images/Group 133.svg',
                      color: CupertinoColors.white,
                      width: 125,
                      height: 125,
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
              Container(child: Image.asset('images/morning_poster.png')),
            ],
          ),
        ),
      ),
    );
  }
}
