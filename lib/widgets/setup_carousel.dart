import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SetupCarousel extends StatefulWidget {
  const SetupCarousel({super.key, required this.path, required this.id});

  final String path;
  final String id;

  @override
  State<SetupCarousel> createState() => _SetupCarouselState();
}

class _SetupCarouselState extends State<SetupCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Image.asset(
          widget.path,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
