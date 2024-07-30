import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/appColors/app_colors.dart';


class CreateNewLeadScreenCard extends StatelessWidget {
  final String hintText;

  const CreateNewLeadScreenCard({
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
    color: AllColors.lightGrey, // Specify the outline color here
    width: 0.3,),
        color: AllColors.whiteColor,// Specify
        borderRadius: BorderRadius.circular(30),
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
                  
                color: AllColors.lighterGrey,
              )
          ),
        ),
      ),
    );

  }
}