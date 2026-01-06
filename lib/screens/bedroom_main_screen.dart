import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class BedroomMainScreen extends StatefulWidget {
  const BedroomMainScreen({super.key});

  @override
  State<BedroomMainScreen> createState() => _BedroomMainScreenState();
}

class _BedroomMainScreenState extends State<BedroomMainScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(children: [Center(child: Text('Bedroom'))]),
        ),
      ),
    );
  }
}
