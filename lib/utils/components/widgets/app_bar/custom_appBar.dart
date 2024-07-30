import 'package:flutter/material.dart';
import '../../../app_colors/app_colors.dart';


class CustomAppBar extends StatelessWidget {
  final Widget child;

  const CustomAppBar({super.key,
    required this.child});

  @override
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    final double aspectRatio = screenSize.width / screenSize.height;

    double aspectRatioValue;
    if (screenSize.shortestSide <= 550) {
      aspectRatioValue = 20/6;
    } else {
      aspectRatioValue = 20/3;
    }
    return AspectRatio(
      aspectRatio: aspectRatioValue,
        child: Container(
        decoration: BoxDecoration(
          color: AllColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 60),
          child: child,
        ),
        ),
    );
  }
}