import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class TeamLeadScreen_Card extends StatelessWidget {
  final String title;
  final String email;

  const TeamLeadScreen_Card({
    Key? key,
    required this.title,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height / 6,
        width: Get.width * 1,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor),
        child: Padding(
          padding: EdgeInsets.only(
              left: 12, right: 12, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.mediumPurple,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular),
                  )
                ],
              ),
              Divider(
                thickness: 0.5
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'T.Leads',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '8776',
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Cold',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text(
                        '10',
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Hot',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '33',
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Follow Up',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '65',
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Dead',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '11',
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}