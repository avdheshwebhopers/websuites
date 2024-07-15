import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class CreateNewLeadScreenWidget extends StatelessWidget {
  final String hintText;

  const CreateNewLeadScreenWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
      margin: EdgeInsets.only(top: 5),
      height: Get.height/21,
      width: Get.width/1,
      decoration: BoxDecoration(
      border: Border.all(
    color: AppColors.lightGrey, // Specify the outline color here
    width: 0.3,),
        color: AppColors.whiteColor,// Specify
        borderRadius: BorderRadius.circular(30                                                        ),
      ),
      child:

    Center(
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.nunitoRegular,
                color: AppColors.lighterGrey,
              )
          ),
        ),
      ),
    );

  }
}