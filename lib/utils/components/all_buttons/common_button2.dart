import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  final Color color;
  final GestureTapCallback onTap;

  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.child,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}