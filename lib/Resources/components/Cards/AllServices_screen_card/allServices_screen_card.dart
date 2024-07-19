import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class AllServicesScreenCard extends StatelessWidget {
  final String title;

  const AllServicesScreenCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/4.6,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Super 50(Quarterly)', style: TextStyle(
                      color: AppColors.mediumGrey,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400
                  ),),

                  SizedBox(width: 10,),

                  Container(
                    height: Get.height/45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('Cheque', style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 10
                      ),),
                    ),
                  ),
                  Spacer(),

                  Text('₹ 55,000', style: TextStyle(
                      color: AppColors.mediumGrey,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w500
                  ),),

                ],
              ),

              Text('Events Pharmaceuticals Pvt Ltd', style: TextStyle(
                color: AppColors.welcomeColor,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.nunitoRegular,
                fontSize: 17,
              ),),

              Row(
                children: [
                  Icon(Icons.mail_outline_rounded, size: 16, color: AppColors.lightGrey,),

                  SizedBox(width: 8,),

                  Text('eventpharma@gmail.com', style: TextStyle(
                      color: AppColors.mediumGrey,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400
                  ),),

                  Spacer(),

                  Text('ORDER NO', style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 12
                  ),),
                ],
              ),


              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 16, color: AppColors.mediumPurple,),

                  SizedBox(width: 8,),

                  Text('Oct 3, 2023 To Oct 3, 2028', style: TextStyle(
                      color: AppColors.mediumPurple,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400
                  ),),
                  Spacer(),

                  Text('#003246', style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 12,

                  ),)
                ],
              ),

              Divider(
                thickness: 0.4,
              ),

              Container(
                height: Get.height/40,
                width: Get.width/3,
                decoration: BoxDecoration(
                  color: AppColors.lighterPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text('Currently Running', style: TextStyle(
                      color: AppColors.mediumPurple,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              )


            ],
          ),
        ),
      );

  }
}