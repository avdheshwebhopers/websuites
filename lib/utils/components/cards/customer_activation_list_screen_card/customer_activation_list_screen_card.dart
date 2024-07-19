import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../app_colors.dart';

class CustomerActivationListCard extends StatelessWidget {
  final String title;

  const CustomerActivationListCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/6,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,

              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Text('Pharmahopers', style: TextStyle(
                      color: AllColors.lightGrey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: AllFonts.nunitoRegular
                  ),),
                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: Get.height/40,
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('View', style: TextStyle(
                        color: AllColors.darkBlue,

                      ),),
                    ),
                  )
                ],
              ),

              Text(title, style: TextStyle(
                  color: AllColors.welcomeColor,
                  fontFamily: AllFonts.nunitoRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),),

              Row(children: [
                Icon(Icons.calendar_month_outlined, size: 14, color: AllColors.mediumPurple,),
                SizedBox5w(),
                Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AllFonts.nunitoRegular
                ),)
              ],),

              Row(
                children: [
                  Icon(Icons.inventory, size: 14, color: AllColors.vividBlue,),
                  SizedBox5w(),
                  Text('Invalid Date', style: TextStyle(
                      color: AllColors.vividBlue,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 13
                  ),),

                  Spacer(),


                  Container(
                    height: Get.height/40,
                    width: Get.width/4,
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Nitin Sharma', style: TextStyle(
                          color: AllColors.darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AllFonts.nunitoRegular
                      ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );

  }
}
