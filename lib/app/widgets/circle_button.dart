import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.iconPath,
    required this.radius,
    required this.onPressed,
  });
  final String iconPath;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: 48,
      shape: const CircleBorder(),
      onPressed: onPressed, //TODO: Perform center button tap action.
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          gradient: LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
            colors: [
              Color(0XFFFFA553),
              Color(0XFFEE8C34),
              Color(0XFFEA5434),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
