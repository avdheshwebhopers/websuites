import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Assets/app_fonts.dart';
import '../app_colors.dart';

class App_Button extends StatelessWidget {

  String title;
  bool loading;
  dynamic onPress;

   App_Button({

    Key? key,
    required this.title,
    this.loading = false,
    this.onPress,

}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: Get.width/1,
        height: Get.height/22,

        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: loading ? CircularProgressIndicator() : Text(title, style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: AppFonts.nunitoRegular,
          ),
          ),
        ),
      ),
    );
  }
}
