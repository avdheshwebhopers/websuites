import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class AllCompanies_ScreenCard extends StatelessWidget {
  final String title;

  const AllCompanies_ScreenCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/5.6,
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
        child:
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Pulkit Surana', style: TextStyle(
                      color: AppColors.mediumGrey,
                      fontSize: 12,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400
                  ),),

                  Spacer(),

                  Text('eraasinternational@gmail.com', style: TextStyle(
                      color: AppColors.mediumGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 12
                  ),),
                ],
              ),

              Text(title, style: TextStyle(
                  color: AppColors.welcomeColor,
                  fontSize: 17,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w700
              ),),

              const Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                  SizedBox(width: 10,),

                  Text('+91-9818402350', style: TextStyle(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 12
                  ),),

                  Spacer(),

                  Text('PARENT COMPANY', style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),),


                ],
              ),

              Row(
                children: [
                  Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                  SizedBox(width: 10,),
                  Text('https://www.eraasinternational.com', style: TextStyle(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 12
                  ),),

                  Spacer(),

                  Container(
                    height: Get.height/40,
                    width: Get.width/7,
                    decoration: BoxDecoration(
                        color: AppColors.lighterPurple,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text('N/A', style: TextStyle(
                        color: AppColors.mediumPurple,
                        fontSize: 12,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  }
}