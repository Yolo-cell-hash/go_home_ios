// vertical_home/utils.dart
// Shared utility functions and helpers for the vertical home screen components

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Helper method to get status border color
/// - 0 = grey (neutral/unavailable)
/// - 1 = red (inactive)
/// - 2 = green (active)
Color getStatusColor(int status) {
  print('[DEBUG] getStatusColor called with status: $status');
  switch (status) {
    case 0:
      return CupertinoColors.systemGrey;
    case 1:
      return CupertinoColors.systemRed;
    case 2:
      return CupertinoColors.systemGreen;
    default:
      return CupertinoColors.systemGrey;
  }
}

/// Helper method to render either icon or custom image (PNG/SVG)
/// Used by all room screens for consistent icon rendering
Widget buildControlItem(dynamic item, bool isEnabled, Color primaryColor) {
  print('[DEBUG] buildControlItem called - enabled: $isEnabled, item: $item');

  if (item is IconData) {
    // Render as icon
    return Icon(
      item,
      size: 28,
      color: isEnabled ? primaryColor : CupertinoColors.systemGrey,
    );
  } else if (item is String) {
    // Check if it's an SVG file
    if (item.toLowerCase().endsWith('.svg')) {
      // Render as SVG
      return SvgPicture.asset(
        item,
        width: 28,
        height: 28,
        fit: BoxFit.contain,
        allowDrawingOutsideViewBox: true,
        colorFilter: ColorFilter.mode(
          isEnabled ? primaryColor : CupertinoColors.systemGrey,
          BlendMode.srcIn,
        ),
      );
    } else {
      // Render as regular image (PNG, JPG, etc.)
      return Image.asset(
        item,
        width: 38,
        height: 38,
        color: isEnabled ? primaryColor : CupertinoColors.systemGrey,
        fit: BoxFit.contain,
      );
    }
  }
  // Fallback to empty container if type is unknown
  return const SizedBox.shrink();
}

/// Builds a circular icon button with double-border design for status indication
/// Used by all room screens for consistent icon styling
Widget buildDoubleCircleIcon({
  required Widget child,
  required int status,
  required bool isGreen,
  required Color primaryColor,
  double size = 94,
  double outerPadding = 3,
  double outerBorderWidth = 2,
  double innerBorderWidth = 1,
}) {
  print('[DEBUG] buildDoubleCircleIcon - status: $status, isGreen: $isGreen');

  return Container(
    padding: EdgeInsets.all(outerPadding),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: getStatusColor(status),
        width: outerBorderWidth,
      ),
    ),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGreen
            ? primaryColor.withOpacity(0.15)
            : CupertinoColors.systemGrey5,
        border: Border.all(
          color: isGreen ? primaryColor : CupertinoColors.systemGrey3,
          width: innerBorderWidth,
        ),
      ),
      child: Center(child: child),
    ),
  );
}
