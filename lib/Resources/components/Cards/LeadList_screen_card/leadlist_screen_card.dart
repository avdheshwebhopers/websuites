import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class Leadlist_screen_card extends StatelessWidget {
  final String title;
  final String companyName;

  const Leadlist_screen_card({
    Key? key,
    required this.title,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(top: 10),
        height: Get.height/4.3,
        width: Get.width/1,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Text(title, style: TextStyle(
                  color: AppColors.grey,
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 12,
                  fontWeight: FontWeight.w400
              ),),

              Text(companyName, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: AppFonts.nunitoRegular,
                  color: AppColors.welcomeColor
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month_rounded, size: 17, color: AppColors.vividPurple, ),
                  SizedBox(width: 8,),
                  Text('Wed 26, June 2024 at 12:09 pm', style: TextStyle(
                    color: AppColors.vividPurple,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 12,
                  ), ),
                  Spacer(),

                  Row(
                    children: [
                      Icon(Icons.language, size: 16,color: AppColors.lightGrey,),

                      SizedBox(width: 5,),

                      Text('Google', style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w400
                      ),)
                    ],
                  )
                ],
              ),

              Row(
                children: [
                  Icon(Icons.call_rounded, size: 15, color: AppColors.lightGrey,),

                  SizedBox(width: 5,),

                  Text('+91-88105399221', style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 12,
                      color: AppColors.grey
                  ),),
                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                      height: Get.height / 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lighterPurple
                      ),
                      child: Center(
                        child: Text('Manish Jindal', style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            color: AppColors.vividPurple
                        ),),
                      )
                  ),

                ],
              ),

              Divider(thickness: 0.5, color: AppColors.lighterGrey,),

              Container(
                  height: Get.height / 40,
                  width: Get.width / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightBlue
                  ),
                  child: Center(
                    child: Text('PharmaHopers', style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkBlue
                    ),
                    ),
                  )
              ),
            ],
          ),
        ),
      );
  }
}