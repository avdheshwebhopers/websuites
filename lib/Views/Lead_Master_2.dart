import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class LeadMaster2 extends StatefulWidget {
  const LeadMaster2({super.key});

  @override
  State<LeadMaster2> createState() => _LeadMaster2State();
}

class _LeadMaster2State extends State<LeadMaster2> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.vividPurple,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Types',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular,
                                color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Source',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.textfield2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Status',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Available Lead Status',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cold',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: Get.height / 42,
                                width: Get.width / 7,
                                decoration: BoxDecoration(
                                    color: AppColors.lightPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: AppColors.mediumPurple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jun 26, 2024 at 11:09 AM',
                                style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB TYPES',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 20,
                                color: AppColors.mediumGrey,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Not Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.edit,
                                                size: 12,
                                                color: AppColors.mediumGrey),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Price Issue',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Projection',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cold',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: Get.height / 42,
                                width: Get.width / 7,
                                decoration: BoxDecoration(
                                    color: AppColors.lightPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: AppColors.mediumPurple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jun 26, 2024 at 11:09 AM',
                                style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB TYPES',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 20,
                                color: AppColors.mediumGrey,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Not Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.edit,
                                                size: 12,
                                                color: AppColors.mediumGrey),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Price Issue',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Projection',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cold',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: Get.height / 42,
                                width: Get.width / 7,
                                decoration: BoxDecoration(
                                    color: AppColors.lightPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: AppColors.mediumPurple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jun 26, 2024 at 11:09 AM',
                                style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB TYPES',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 20,
                                color: AppColors.mediumGrey,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Not Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.edit,
                                                size: 12,
                                                color: AppColors.mediumGrey),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Price Issue',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Projection',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cold',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: Get.height / 42,
                                width: Get.width / 7,
                                decoration: BoxDecoration(
                                    color: AppColors.lightPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: AppColors.mediumPurple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jun 26, 2024 at 11:09 AM',
                                style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB TYPES',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 20,
                                color: AppColors.mediumGrey,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Not Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.edit,
                                                size: 12,
                                                color: AppColors.mediumGrey),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Price Issue',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Projection',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5,
                    width: Get.width / 1,
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
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Cold',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: Get.height / 42,
                                width: Get.width / 7,
                                decoration: BoxDecoration(
                                    color: AppColors.lightPurple,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 15,
                                color: AppColors.mediumPurple,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jun 26, 2024 at 11:09 AM',
                                style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUB TYPES',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 20,
                                color: AppColors.mediumGrey,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Not Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.edit,
                                                size: 12,
                                                color: AppColors.mediumGrey),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColors.textfield2,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Price Issue',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Interested',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: Get.height / 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.textfield2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Projection',
                                              style: TextStyle(
                                                  color: AppColors.mediumGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      AppFonts.nunitoRegular,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 12,
                                              color: AppColors.mediumGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //====================================================================
          //CUSTOM APP BAR

          CustomAppBar(
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Lead Master',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 17,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.lightGrey,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: Get.height / 30,
                  width: Get.width / 4,
                  decoration: BoxDecoration(
                    color: AppColors.mediumPurple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Add Lead Type',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
