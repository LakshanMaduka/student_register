import 'package:flutter/material.dart';
import 'package:student_register/utils/const.dart';

class GradientButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient =
        const LinearGradient(colors: [primaryLightBlue, primaryDarkBlue]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
