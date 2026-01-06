import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeaturesPanel extends StatefulWidget {
  const FeaturesPanel({
    super.key,
    required this.theme,
    required this.iconPaths,
    required this.iconLabels,
    required this.sectionName,
    this.allowToggle = false,
    this.onFeatureTap,
  });

  final CupertinoThemeData theme;
  final List<String> iconPaths;
  final List<String> iconLabels;
  final Function(int index)? onFeatureTap;
  final String sectionName;
  final bool allowToggle;

  int get numberOfFeatures => iconPaths.length;

  @override
  State<FeaturesPanel> createState() => _FeaturesPanelState();
}

class _FeaturesPanelState extends State<FeaturesPanel> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30.0),
          decoration: BoxDecoration(
            color: widget.theme.primaryContrastingColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 144.0,
            right: 32.0,
          ),
          child: widget.allowToggle
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.sectionName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.6,
                        fontFamily: 'GEG',
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    CupertinoSwitch(
                      activeColor: widget.theme.primaryColor,
                      trackColor: widget.theme.scaffoldBackgroundColor,
                      thumbColor: widget.theme.scaffoldBackgroundColor,
                      inactiveThumbColor: widget.theme.primaryColor,
                      value: _isToggled,
                      onChanged: (value) {
                        setState(() {
                          _isToggled = value;
                        });
                      },
                    ),
                  ],
                )
              : Text(
                  widget.sectionName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.6,
                    fontFamily: 'GEG',
                    fontSize: 24.0,
                  ),
                ),
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.iconPaths.length + 1, (index) {
            final isLast = index == widget.iconPaths.length;
            return GestureDetector(
              onTap: () {
                if (isLast) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Coming Soon'),
                      content: const Text(
                        'Device addition feature coming soon',
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  widget.onFeatureTap?.call(index);
                }
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(95.0),
                      color: isLast
                          ? widget.theme.primaryContrastingColor
                          : widget.theme.primaryColor,
                    ),
                    height: 140.0,
                    width: 140.0,
                    child: isLast
                        ? Icon(
                            CupertinoIcons.add,
                            color: widget.theme.primaryColor,
                            size: 48.0,
                          )
                        : Center(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Image.asset(
                                'images/${widget.iconPaths[index]}',
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 25.0),
                  Text(
                    isLast ? ' ' : widget.iconLabels[index],
                    style: TextStyle(
                      fontFamily: 'GEG',
                      letterSpacing: 1.8,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
