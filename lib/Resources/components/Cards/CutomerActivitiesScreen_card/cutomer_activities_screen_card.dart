import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';

import '../../../Assets/app_fonts.dart';
import '../../../app_strings/app_strings.dart';
import '../../../app_textstyles/app_textstyle2.dart';
import '../../app_colors.dart';

class CustomerActvities_Card extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomerActvities_Card({
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
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.06),
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
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.nunitoRegular,
              ),),

              Text(subtitle, style: TextStyle(
                color: AppColors.welcomeColor,
                fontFamily: AppFonts.nunitoRegular,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 17, color: AppColors.mediumPurple,),
                  SizedBox(width: 10,),
                  Text('Wed, Jun 26, 2024 at 11:39 AM', style: TextStyle(
                    color: AppColors.mediumPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                  ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('Call', style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),

                  SizedBox_5w(),

                  Icon(Icons.arrow_right_alt, size: 20,),

                  SizedBox_5w(),

                  Text('Number Busy', style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                  ),),

                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: Get.height/40,
                    decoration: BoxDecoration(
                      color: AppColors.lightPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Roshan Jha', style: TextStyle(
                          color: AppColors.mediumPurple,
                          fontFamily: AppFonts.nunitoRegular,
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
              AppTextStyle2.w500_universal(fontSize: 13, color: AppColors.blackColor, context, AppStrings.CustomerActivities_Remark),
                SizedBox_5w(),
                Icon(Icons.arrow_right_alt, size: 15, color: AppColors.lightGrey,),

                SizedBox_5w(),

                Text('Not Answered', style: TextStyle(
                    color: AppColors.lightGrey,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                ),),


              ],),

              Row(
                children: [
                 AppTextStyle2.w500_universal(fontSize: 13,color: AppColors.blackColor, context, AppStrings.CustomerActivities_ReminderTo),
                  SizedBox_5w(),
                  Icon(Icons.arrow_right_alt, size: 15, color: AppColors.lightGrey,),
                  SizedBox_5w(),

                  Text('Anil Kumar', style: TextStyle(
                      color: AppColors.darkBlue,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  ),
                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('View', style: TextStyle(
                          color: AppColors.vividBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoRegular
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