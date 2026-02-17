import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/ja_camera_service.dart';

/// PTZ (Pan-Tilt-Zoom) Controller D-pad widget
/// Provides directional controls for camera movement
class PTZController extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color buttonColor;
  final Color activeButtonColor;
  final Color iconColor;

  const PTZController({
    super.key,
    this.size = 200,
    this.backgroundColor = Colors.black54,
    this.buttonColor = Colors.white24,
    this.activeButtonColor = Colors.blue,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [backgroundColor.withOpacity(0.3), backgroundColor],
              stops: const [0.3, 1.0],
            ),
            border: Border.all(color: buttonColor.withOpacity(0.4), width: 2),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.15),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _positionedButton(
                Alignment.topCenter,
                CupertinoIcons.chevron_up,
                'UP',
                JACameraService.ptzMoveUp,
              ),
              _positionedButton(
                Alignment.bottomCenter,
                CupertinoIcons.chevron_down,
                'DOWN',
                JACameraService.ptzMoveDown,
              ),
              _positionedButton(
                Alignment.centerLeft,
                CupertinoIcons.chevron_left,
                'LEFT',
                JACameraService.ptzMoveLeft,
              ),
              _positionedButton(
                Alignment.centerRight,
                CupertinoIcons.chevron_right,
                'RIGHT',
                JACameraService.ptzMoveRight,
              ),
              // Center dot
              Center(
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor.withOpacity(0.15),
                    border: Border.all(
                      color: iconColor.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _positionedButton(
    Alignment alignment,
    IconData icon,
    String direction,
    Future<bool> Function() action,
  ) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _PTZButton(
          icon: icon,
          direction: direction,
          onPressed: action,
          onReleased: JACameraService.ptzStop,
          size: 44,
          buttonColor: buttonColor,
          activeColor: activeButtonColor,
          iconColor: iconColor,
        ),
      ),
    );
  }
}

class _PTZButton extends StatefulWidget {
  final IconData icon;
  final String direction;
  final Future<bool> Function() onPressed;
  final Future<bool> Function() onReleased;
  final double size;
  final Color buttonColor;
  final Color activeColor;
  final Color iconColor;

  const _PTZButton({
    required this.icon,
    required this.direction,
    required this.onPressed,
    required this.onReleased,
    required this.size,
    required this.buttonColor,
    required this.activeColor,
    required this.iconColor,
  });

  @override
  State<_PTZButton> createState() => _PTZButtonState();
}

class _PTZButtonState extends State<_PTZButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    widget.onPressed();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onReleased();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    widget.onReleased();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: _isPressed ? widget.activeColor : widget.buttonColor,
          shape: BoxShape.circle,
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: widget.activeColor.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Icon(
          widget.icon,
          color: _isPressed ? Colors.white : widget.iconColor,
          size: widget.size * 0.5,
        ),
      ),
    );
  }
}
