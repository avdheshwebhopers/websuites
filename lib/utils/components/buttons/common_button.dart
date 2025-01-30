import 'package:flutter/material.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../appColors/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
    this.color, // Optional background color
    this.textColor, // Optional text color
    this.borderColor, // Optional border color
    this.borderRadius = 5.0, // Optional border radius with a default value
    this.fontWeight, // Optional font weight
    this.fontSize, // Optional font size
    this.icon, // Optional icon
    this.iconSpacing = true, // Optional control for spacing between text and icon
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color? color; // Optional background color
  final Color? textColor; // Optional text color
  final Color? borderColor; // Optional border color
  final double borderRadius; // Optional border radius
  final FontWeight? fontWeight; // Optional font weight
  final double? fontSize; // Optional font size
  final Widget? icon; // Optional icon
  final bool iconSpacing; // Optional control for spacing between text and icon

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: color ?? AllColors.mediumPurple, // Use provided color or default
          borderRadius: BorderRadius.circular(borderRadius), // Use provided borderRadius
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: loading
            ? Center(
          child: CircularProgressIndicator(
            color: AllColors.whiteColor,
          ),
        )
            : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.white, // Use provided textColor or default to white
                  fontWeight: fontWeight ?? FontWeight.w400, // Use provided fontWeight or default
                  fontSize: fontSize ?? 13, // Use provided fontSize or default
                  fontFamily: FontFamily.sfPro,
                ),
              ),
              if (icon != null) ...[
                if (iconSpacing) SizedBox(width: 4), // Conditionally render the spacing
                icon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
