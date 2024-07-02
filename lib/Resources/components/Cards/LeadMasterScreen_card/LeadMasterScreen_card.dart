import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class LeadMaster_screen_card extends StatelessWidget {
  final String title;
  final String activity;

  const LeadMaster_screen_card({
    Key? key,
    required this.title,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
        height: Get.height/5.5,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 12,
                    color: AppColors.blackColor
                ),),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: Get.height/46,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(activity, style: TextStyle(
                        color: AppColors.vividPurple,
                        fontSize: 12,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 16, color: AppColors.vividPurple,),

                SizedBox(width: 5,),

                Text('June 26, 2024 at 11:29 AM', style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 12,
                ),),
              ],
            ),

            Divider(
              thickness: 0.2,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SUB TYPES', style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w500
                ),),

                SizedBox(width: 5,),

                Icon(Icons.arrow_right_alt, size: 18, color: AppColors.lightGrey,),

                SizedBox(width: 5,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: Get.height/40,
                          // width: Get.width/3.5,
                          decoration: BoxDecoration(
                              color: AppColors.textfield2,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Row(
                            children: [
                              Text('Not Interested', style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AppColors.lightGrey,)
                            ],
                          ),
                        ),

                        SizedBox(width: 8,),



                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text('Price Issue', style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AppColors.lightGrey,)
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Interested', style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AppColors.lightGrey,),

                            ],
                          ),
                        ),

                        SizedBox(width: 8,),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text('Projection', style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.nunitoRegular,
                              ),),
                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AppColors.lightGrey,)
                            ],
                          ),
                        ),

                        SizedBox(width: 8,),

                        Icon(Icons.add_circle_outline, size: 22, color: AppColors.lightGrey,)


                      ],
                    )
                  ],
                )
              ],
            )






          ],
        ),
      );
  }
}