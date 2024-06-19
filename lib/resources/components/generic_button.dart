

import 'package:flutter/material.dart';

import '../../Resources/components/app_colors.dart';
import '../Assets/app_fonts.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    Key? key,
    // this.buttonColor = App_Colors.buttoncolor,
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
  // final Color buttonColor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: loading?
        Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
        ) :
        Center(
          child: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13,
                fontFamily: AppFonts.nunitoRegular
            ),
          ),
        ),
      ),
    );
  }
}
