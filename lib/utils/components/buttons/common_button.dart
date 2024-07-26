

import 'package:flutter/material.dart';
import '../../../Resources/all_fonts/all_fonts.dart';
import '../../app_colors/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false

  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AllColors.mediumPurple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: loading?
        Center(
            child: CircularProgressIndicator(
              color: AllColors.whiteColor,
            ),
        ) :
        Center(
          child: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13,
                fontFamily: AllFonts.nunitoRegular
            ),
          ),
        ),
      ),
    );
  }
}
