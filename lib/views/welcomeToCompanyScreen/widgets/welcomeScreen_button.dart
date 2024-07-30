import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appColors/app_colors.dart';


class WelcomeScreenButton extends StatelessWidget {

  String title;
  bool loading;
  dynamic onPress;

   WelcomeScreenButton({

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
          color: AllColors.buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: loading ? CircularProgressIndicator() : Text(title, style: TextStyle(
            color: AllColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,

          ),
          ),
        ),
      ),
    );
  }
}
