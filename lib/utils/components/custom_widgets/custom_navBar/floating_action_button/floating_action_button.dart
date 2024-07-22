import 'package:flutter/material.dart';

import '../../../../../Utils/components/app_colors.dart';


class CustomFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imageIcon;
  final Color backgroundColor;

 const CustomFloatingButton({
    Key? key,
    required this.onPressed,
    required this.imageIcon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Image.asset(imageIcon, scale: 20, color: AllColors.whiteColor,),
      backgroundColor: backgroundColor,
    );
  }
}