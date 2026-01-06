import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class LivingMainScreen extends StatefulWidget {
  const LivingMainScreen({super.key});

  @override
  State<LivingMainScreen> createState() => _LivingMainScreenState();
}

class _LivingMainScreenState extends State<LivingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(children: [Center(child: Text('Living'))]),
        ),
      ),
    );
  }
}
