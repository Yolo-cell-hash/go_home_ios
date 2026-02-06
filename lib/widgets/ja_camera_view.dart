import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Native camera view widget for iOS
/// Uses UiKitView to embed native JAMultivideosPlayer
class JACameraView extends StatefulWidget {
  final String deviceId;
  final String deviceName;
  final String username;
  final String password;
  final int channelCount;
  final Function(int, int)? onViewCreated;

  const JACameraView({
    super.key,
    required this.deviceId,
    this.deviceName = '',
    this.username = 'admin',
    this.password = '',
    this.channelCount = 1,
    this.onViewCreated,
  });

  @override
  State<JACameraView> createState() => _JACameraViewState();
}

class _JACameraViewState extends State<JACameraView> {
  bool _isCreated = false;
  int? _viewId;

  @override
  void initState() {
    super.initState();
    print('[JACameraView] initState called');
    print('[JACameraView] deviceId: ${widget.deviceId}');
    print('[JACameraView] Platform.isIOS: ${Platform.isIOS}');
  }

  @override
  Widget build(BuildContext context) {
    print(
      '[JACameraView] build called - isCreated: $_isCreated, viewId: $_viewId',
    );

    if (!Platform.isIOS) {
      print('[JACameraView] Not iOS, showing fallback');
      return Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Camera not available on this platform',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final creationParams = {
      'deviceId': widget.deviceId,
      'deviceName': widget.deviceName.isEmpty
          ? widget.deviceId
          : widget.deviceName,
      'username': widget.username,
      'password': widget.password,
      'channelCount': widget.channelCount,
    };

    print('[JACameraView] Creating UiKitView with viewType: ja_camera_view');
    print('[JACameraView] Creation params: $creationParams');

    // Use LayoutBuilder to ensure we have proper sizing
    return LayoutBuilder(
      builder: (context, constraints) {
        print('[JACameraView] LayoutBuilder constraints: $constraints');
        print(
          '[JACameraView] maxWidth: ${constraints.maxWidth}, maxHeight: ${constraints.maxHeight}',
        );

        // If constraints are unbounded or zero, provide a default size
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        if (width == double.infinity || width == 0) {
          width = 400;
          print('[JACameraView] Using default width: $width');
        }
        if (height == double.infinity || height == 0) {
          height = 300;
          print('[JACameraView] Using default height: $height');
        }

        print('[JACameraView] Final size: ${width}x$height');

        return SizedBox(
          width: width,
          height: height,
          child: ColoredBox(
            color: Colors.black,
            child: UiKitView(
              viewType: 'ja_camera_view',
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onPlatformViewCreated: _onPlatformViewCreated,
              gestureRecognizers: const {},
            ),
          ),
        );
      },
    );
  }

  void _onPlatformViewCreated(int id) {
    print('[JACameraView] *** Platform view created with id: $id ***');
    setState(() {
      _isCreated = true;
      _viewId = id;
    });
    widget.onViewCreated?.call(id, widget.channelCount);
  }

  @override
  void dispose() {
    print('[JACameraView] dispose called - viewId: $_viewId');
    super.dispose();
  }
}
