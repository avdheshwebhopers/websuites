import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../../../Resources/all_strings/all_strings.dart';
import '../../../../Resources/all_textStyles/all_textStyles.dart';
import '../../Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../app_colors.dart';

class CustomerActivitiesScreenCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomerActivitiesScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/4,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4
              ),
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                color: AllColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: AllFonts.nunitoRegular,
              ),),

              Text(subtitle, style: TextStyle(
                color: AllColors.welcomeColor,
                fontFamily: AllFonts.nunitoRegular,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 17, color: AllColors.mediumPurple,),
                  SizedBox(width: 10,),
                  Text('Wed, Jun 26, 2024 at 11:39 AM', style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AllFonts.nunitoRegular,
                  ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('Call', style: TextStyle(
                      color: AllColors.blackColor,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),

                  SizedBox5w(),

                  Icon(Icons.arrow_right_alt, size: 20,),

                  SizedBox5w(),

                  Text('Number Busy', style: TextStyle(
                    color: AllColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AllFonts.nunitoRegular,
                  ),),

                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: Get.height/40,
                    decoration: BoxDecoration(
                      color: AllColors.lightPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Roshan Jha', style: TextStyle(
                          color: AllColors.mediumPurple,
                          fontFamily: AllFonts.nunitoRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 0.4,
              ),

              Row(children: [
              AllTextStyles.w500_universal(fontSize: 13, color: AllColors.blackColor, context, AllStrings.CustomerActivities_Remark),
                SizedBox5w(),
                Icon(Icons.arrow_right_alt, size: 15, color: AllColors.lightGrey,),

                SizedBox5w(),

                Text('Not Answered', style: TextStyle(
                    color: AllColors.lightGrey,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                ),),


              ],),

              Row(
                children: [
                 AllTextStyles.w500_universal(fontSize: 13,color: AllColors.blackColor, context, AllStrings.CustomerActivities_ReminderTo),
                  SizedBox5w(),
                  Icon(Icons.arrow_right_alt, size: 15, color: AllColors.lightGrey,),
                  SizedBox5w(),

                  Text('Anil Kumar', style: TextStyle(
                      color: AllColors.darkBlue,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  ),
                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('View', style: TextStyle(
                          color: AllColors.vividBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AllFonts.nunitoRegular
                      ),
                      ),
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