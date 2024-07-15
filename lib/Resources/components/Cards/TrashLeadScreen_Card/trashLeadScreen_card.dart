import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class TrashLeadScreen_Card extends StatelessWidget {
  final String title;
  final String email;

  const TrashLeadScreen_Card({
    Key? key,
    required this.title,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      height: Get.height/4.5,
      width: Get.width*1,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.06),
                spreadRadius: 3,
                blurRadius: 4
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(email, style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.nunitoRegular
            ),),


            Text(title, style: TextStyle(
                color: AppColors.welcomeColor,
                fontFamily: AppFonts.nunitoRegular,
                fontWeight: FontWeight.w700,
                fontSize: 18
            ),),

            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15, color: AppColors.vividPurple,),
                SizedBox(width: 5,),
                Text('Wed June 26, 2024 at 11:39 AM', style: TextStyle(
                    color: AppColors.vividPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular
                ),)
              ],
            ),

            Row(
              children: [
                Icon(Icons.call, size: 15, color: AppColors.lightGrey,),
                SizedBox(width: 5,),
                Text('+91-9999333456', style: TextStyle(
                    color: AppColors.lightGrey,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                ),),
                Spacer(),

                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  height: Get.height/40,
                  // width: Get.width/3.5,
                  decoration: BoxDecoration(
                    color: AppColors.lighterPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text('Siddharth Kapoor', style: TextStyle(
                        color: AppColors.vividPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular
                    ),),
                  ),
                ),
              ],
            ),

            Divider(
              thickness: 0.2,
            ),

            Row(
              children: [
                Text(
                  'REMARK',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                ),),

                Icon(Icons.arrow_right_alt, size: 25, color: AppColors.lightGrey,),

                Text('No Use',style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 12
                ),),

                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height/40,
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('Hot', style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 12,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400
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