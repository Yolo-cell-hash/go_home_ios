import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingCard extends StatefulWidget {
  OnboardingCard({
    super.key,
    required this.theme,
    required this.doesHaveImg,
    required this.isEditPreset,
    this.imgValue = '',
    this.title = '',
    required this.action,
  });

  final bool doesHaveImg;
  final bool isEditPreset;
  final CupertinoThemeData theme;
  final String imgValue;
  final String title;
  final VoidCallback? action;

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.doesHaveImg == false && widget.isEditPreset == true) {
      return GestureDetector(
        onTap: widget.action,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 185.0,
              width: 185.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: widget.theme.primaryContrastingColor,
              ),
              child: Icon(CupertinoIcons.add, size: 80),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      );
    } else if (widget.doesHaveImg == false) {
      return GestureDetector(
        onTap: widget.action,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 185.0,
              width: 185.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: widget.theme.primaryColor,
              ),
              child: Image.asset('images/Vector.png', height: 85),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.8,
                      fontFamily: 'GEG',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Image.asset('images/Vector-1.png'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.8,
                    fontFamily: 'GEG',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 15.0),
                Image.asset('images/Vector-1.png'),
              ],
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.action,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 185.0,
              width: 185.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: widget.theme.primaryColor,
              ),
              child: Image.asset('images/${widget.imgValue}.png', height: 85),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.8,
                    fontFamily: 'GEG',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 15.0),
                Image.asset('images/Vector-1.png'),
              ],
            ),
          ],
        ),
      );
    }
  }
}
