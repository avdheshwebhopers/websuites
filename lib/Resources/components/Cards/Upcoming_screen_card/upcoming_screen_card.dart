import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../../Assets/app_images.dart';
import '../../app_colors.dart';

class Upcoming_screen_card extends StatelessWidget {
  final String title;
  final String companyName;

  const Upcoming_screen_card({
    Key? key,
    required this.title,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
      margin: EdgeInsets.only(bottom: 10),
      height: Get.height/3.8,
      width: Get.width/1,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: Offset(0, 0),
            )]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title, style: TextStyle(
              fontFamily: AppFonts.nunitoRegular,
              color: AppColors.grey,
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
            children: [
              Icon(Icons.calendar_month_rounded, size: 17, color: AppColors.vividPurple,),

              SizedBox(width: 10,),

              Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mediumPurple
              ),),
            ],
          ),

          Row(
            children: [
              Icon(Icons.timer_outlined, size: 18, color: AppColors.grey,),

              SizedBox(width: 10,),

              Text('01 Hr, 30 Min', style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: AppFonts.nunitoRegular,
              ),),

              SizedBox(width: 25),

              Icon(Icons.access_time_rounded, size: 18 ,color: AppColors.grey,),
              SizedBox(width: 8),

              Text('55 minutes', style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 12,
                  fontWeight: FontWeight.w400
              ),),
            ],
          ),

          Divider(
            thickness: 0.4,
            color: AppColors.lighterGrey,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightPurple,
                backgroundImage: AssetImage(AppImages.Splash_WHLogo,),
                radius: 14,
              ),

              Spacer(),

              Container(
                height: Get.height/45,
                width: Get.width/4,
                decoration: BoxDecoration(
                  color: AppColors.lighterPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text('Prakash Sethi', style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      fontFamily: AppFonts.nunitoRegular,
                      color: AppColors.vividPurple
                  ),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}