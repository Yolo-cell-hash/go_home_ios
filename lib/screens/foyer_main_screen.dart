import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class FoyerMainScreen extends StatefulWidget {
  const FoyerMainScreen({super.key});

  @override
  State<FoyerMainScreen> createState() => _FoyerMainScreenState();
}

class _FoyerMainScreenState extends State<FoyerMainScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(children: [Center(child: Text('Foyer'))]),
        ),
      ),
    );
  }
}
