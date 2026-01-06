import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarHomeScreen extends StatelessWidget {
  const NavbarHomeScreen({super.key, required this.theme});

  final CupertinoThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('images/Group 133.svg', height: 120.0),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: theme.primaryContrastingColor,
              ),
              child: Center(child: Image.asset('images/Vector-3.png')),
            ),
          ),
        ],
      ),
    );
  }
}
