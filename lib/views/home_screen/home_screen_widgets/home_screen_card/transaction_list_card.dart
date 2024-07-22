import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../../../Utils/components/app_colors.dart';

class TransactionListCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String amount;
  final String name;


  const TransactionListCard({
    Key? key,

    required this.title,
    required this.name,
    required this.amount,
    required this.subtitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return
          // Container(
          // height: Get.height / 9.5,
          // width: Get.width / 1.05,
          // decoration: BoxDecoration(
          //   color: App_Colors.whiteColor,
          //   borderRadius: BorderRadius.circular(10),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black45.withOpacity(0.06),
          //       spreadRadius: 0.5,
          //       blurRadius: 4,
          //       offset: Offset(0, 0),
          //     ),
          //   ],
          // ),
          Container(
            margin: EdgeInsets.only(right: 12, left: 10, top: 4, bottom: 4),
            height: Get.height / 9.5,
            width: Get.width / 1.05,
            decoration: BoxDecoration(
              color: AllColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(0.06),
                  spreadRadius: 0.5,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],),
            child: Row(
              children: [
                Container(
                  // color: Colors.greenAccent,
                  height: Get.height/8.4,


                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 13,
                          color: AllColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AllColors.mediumPurple,
                          ),
                          SizedBox(width: 5),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: AllFonts.nunitoRegular,
                              fontSize: 12,
                              color: AllColors.mediumPurple,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(

                  // color: Colors.green,
                  height: Get.height / 9.4,
                  width: Get.width / 4.5,
                  padding: EdgeInsets.only(right: 5,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 15,
                          color: AllColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 10,
                          color: AllColors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );


  }
}


class AppCardsThreeTab extends StatelessWidget {

  final String title;
  final String subtitle;
  final String amount;
  final String name;


  const AppCardsThreeTab({
    Key? key,

    required this.title,
    required this.name,
    required this.amount,
    required this.subtitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
      // Container(
      // height: Get.height / 9.5,
      // width: Get.width / 1.05,
      // decoration: BoxDecoration(
      //   color: App_Colors.whiteColor,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black45.withOpacity(0.06),
      //       spreadRadius: 0.5,
      //       blurRadius: 4,
      //       offset: Offset(0, 0),
      //     ),
      //   ],
      // ),
      Container(
        margin: EdgeInsets.only(right: 12, left: 10, top: 5, bottom: 5),
        height: screenSize.height / 7.5,
        width: screenSize.width / 1.05,
        decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],),
        child: Row(
          children: [
            Container(
              // color: Colors.greenAccent,
              height: Get.height/8.4,


              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 18,
                      color: AllColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: AllColors.mediumPurple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 16,
                          color: AllColors.mediumPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(

              // color: Colors.green,
              // height: Get.height / 9.4,
              // width: Get.width / 4.5,
              padding: EdgeInsets.only(right: 12,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 19,
                      color: AllColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 15,
                      color: AllColors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );


  }
}





