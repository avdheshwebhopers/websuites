import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;

  const CustomAppBar({Key? key,
    required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 7.8,
      width: Get.width / 1,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
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
    );
  }
}