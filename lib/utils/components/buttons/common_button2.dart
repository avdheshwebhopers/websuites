import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  final Color color;
  final GestureTapCallback onTap;

  const CustomButton2({
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
    return InkWell(
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