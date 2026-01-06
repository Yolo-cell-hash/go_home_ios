import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class KitchenMainScreen extends StatefulWidget {
  const KitchenMainScreen({super.key});

  @override
  State<KitchenMainScreen> createState() => _KitchenMainScreenState();
}

class _KitchenMainScreenState extends State<KitchenMainScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: Column(children: [Center(child: Text('Kitchen'))]),
        ),
      ),
    );
    ;
  }
}
