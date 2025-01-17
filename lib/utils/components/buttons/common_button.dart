import 'package:flutter/material.dart';
import '../../appColors/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = 130,
    this.height = 40,
    this.loading = false,
    this.color, // New optional color parameter
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color? color; // Optional color property

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AllColors.mediumPurple, // Use provided color or default
          borderRadius: BorderRadius.circular(5),
        ),
        child: loading
            ? Center(
          child: CircularProgressIndicator(
            color: AllColors.whiteColor,
          ),
        )
            : Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}