import 'dart:ui';

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  const BlurEffect(
      {super.key,
      this.isCircle = false,
      required this.child,
      this.borderRadius})
      : assert(isCircle == false || borderRadius == null);

  /// Helps in determining the shape of Clipper.
  ///
  /// Clipper is used to contain the Blur Effect.
  final bool isCircle;

  /// The Widget that will be on the blurred background.
  final Widget child;

  /// The BorderRadius for Clipper.
  ///
  /// Must be null in case `isCircle` is true.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: child,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: child,
        ),
      );
    }
  }
}
