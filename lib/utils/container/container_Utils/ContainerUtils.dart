import 'package:flutter/material.dart';

class ContainerUtils extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final BorderRadius? borderRadius;

  const ContainerUtils({
    super.key,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(vertical: 0),
    this.paddingTop = 10.0,
    this.paddingBottom = 15.0,
    this.paddingLeft = 15.0,
    this.paddingRight = 15.0,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(
        top: paddingTop ?? 10.0,
        bottom: paddingBottom ?? 15.0,
        left: paddingLeft ?? 15.0,
        right: paddingRight ?? 15.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}