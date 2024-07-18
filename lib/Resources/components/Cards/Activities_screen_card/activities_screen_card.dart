import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';

import '../../../Assets/app_fonts.dart';
import '../../../app_strings/app_strings.dart';
import '../../../app_textstyles/app_textstyle2.dart';
import '../../app_colors.dart';

class LeadActivities_screen_card extends StatelessWidget {
  final String title;
  final String companyName;

  const LeadActivities_screen_card({
    Key? key,
    required this.title,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
      margin: EdgeInsets.only(top: 10),
      height: Get.height/3.9,
      width: Get.width/1,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 0)
            )]),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontFamily: AppFonts.nunitoRegular,
                fontWeight: FontWeight.w400
            ),),

            Text(companyName, style: TextStyle(
                color: AppColors.welcomeColor,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.nunitoRegular,
                fontSize: 18
            ),),

            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15,color: AppColors.mediumPurple,),

                SizedBox(width: 7,),

                Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                    color: AppColors.mediumPurple,
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w400
                ),)
              ],
            ),

            Row(
              children: [
                Text('Call', style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 14,
                  fontWeight: FontWeight.w500
                ),),

                SizedBox_5w(),

                Icon(Icons.arrow_right_alt, size: 15,),

                SizedBox_5w(),
                Text('Number Busy', style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 12,
                  fontFamily: AppFonts.nunitoRegular,
                ),),
                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height/40,
                  decoration: BoxDecoration(
                      color: AppColors.lighterPurple,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('Manish Jindal',style: TextStyle(
                        color: AppColors.mediumPurple,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 12
                    ),),
                  ),
                ),
              ],
            ),

            Divider(
              thickness: 0.09,
              color: AppColors.blackColor,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       AppTextStyle2.w500_12(color: AppColors.blackColor, context, AppStrings.LeadActivity_remark),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.arrow_right_alt, size: 20, color: AppColors.lightGrey,),
                        ),

                        Text('Not Answered', style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 12
                        ),)
                      ],
                    ),

                    SizedBox(height: 5,),

                    Row(
                      children: [
                        AppTextStyle2.w500_12(color: AppColors.blackColor, context, AppStrings.LeadActivity_reminder),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.arrow_right_alt, size: 20, color: AppColors.lightGrey,),
                        ),

                        Text('28/06/2024 11:59 am', style: TextStyle(
                            color: AppColors.vividBlue,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 12
                        ),
                        )
                      ],
                    )
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: Get.height/40,
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('View', style: TextStyle(
                            color: AppColors.vividBlue,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),),
                      ),
                    )

                  ],
                )
              ],
            )



          ],
        ),
      ),
    );
  }
}