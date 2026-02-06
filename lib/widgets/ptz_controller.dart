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
    print('[PTZController] Building with size: $size');
    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _positionedButton(
                Alignment.topCenter,
                Icons.keyboard_arrow_up,
                'UP',
                JACameraService.ptzMoveUp,
              ),
              _positionedButton(
                Alignment.bottomCenter,
                Icons.keyboard_arrow_down,
                'DOWN',
                JACameraService.ptzMoveDown,
              ),
              _positionedButton(
                Alignment.centerLeft,
                Icons.keyboard_arrow_left,
                'LEFT',
                JACameraService.ptzMoveLeft,
              ),
              _positionedButton(
                Alignment.centerRight,
                Icons.keyboard_arrow_right,
                'RIGHT',
                JACameraService.ptzMoveRight,
              ),
              const Center(
                child: Icon(
                  Icons.control_camera,
                  color: Colors.white24,
                  size: 30,
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
        padding: const EdgeInsets.all(8.0),
        child: _PTZButton(
          icon: icon,
          direction: direction,
          onPressed: action,
          onReleased: JACameraService.ptzStop,
          size: 50,
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
    print('[PTZButton] TAP DOWN - ${widget.direction}');
    setState(() => _isPressed = true);
    widget.onPressed();
  }

  void _onTapUp(TapUpDetails details) {
    print('[PTZButton] TAP UP - ${widget.direction}');
    setState(() => _isPressed = false);
    widget.onReleased();
  }

  void _onTapCancel() {
    print('[PTZButton] TAP CANCEL - ${widget.direction}');
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
        duration: const Duration(milliseconds: 100),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: _isPressed ? widget.activeColor : widget.buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: widget.size * 0.6,
        ),
      ),
    );
  }
}
