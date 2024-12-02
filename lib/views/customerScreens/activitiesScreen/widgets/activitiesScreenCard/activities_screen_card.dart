import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/components/widgets/sizedBoxes/sizedBox_5w.dart';

class  CustomerActivitiesScreenCard extends StatelessWidget {
  final String title;
  final String companyName;
  final String actionDate;
  final String activity;
  final String info;
  final String action_by;
  final String status;
  final String created_Date;
  final String request_Location;

  CustomerActivitiesScreenCard({
    Key? key,
    required this.title,
    required this.companyName,
    required this.actionDate,
    required this.activity,
    required this.info,
    required this.action_by,
    required this.status,
    required this.created_Date,
    required this.request_Location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.only(top: 10),
      height: 188,
      width: Get.width ,
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AllColors.blackColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and company name
            Flexible(
              child:
              Text(
                companyName,
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w700, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),

            ),
        SizedBox(height: 5,),
            Row(
 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: AllColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.calendar_month_outlined, size: 15, color: AllColors.mediumPurple),
                ),
                SizedBox(width: 5,),
                Text(
                actionDate,
                  style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )

              ],
            ),

            SizedBox(height: 5),
            Divider(thickness: 0.09, color: AllColors.blackColor),

            // Date and Activity Info


            // Activity Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child:
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.phone_in_talk,size: 12,color: AllColors.lightGrey,),
                  ),

                ),
                // SizedBox(width: 5),

                SizedBox(width: 5),
                Expanded(
                  flex: 70,
                  child: Text(
                    info,
                    style: TextStyle(color: AllColors.lightGrey, fontSize: 10),
                    overflow: TextOverflow.visible,
                    maxLines: 2, // Allow info to take up to 2 lines
                  ),
                ),
                SizedBox(width: 5,),
                Spacer(),
               Padding(
                 padding: const EdgeInsets.only(top: 1.5),
                 child: Image.asset('assets/icons/menuRemark.png',height: 10,),
               ),
                SizedBox(width: 5,),
                Text(
                  status,
                  style: TextStyle(color: AllColors.lightGrey, fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

              ],
            ),
            SizedBox(height: 5),

            // Divider


            // Remark and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.notifications_active_outlined,color: AllColors.vividBlue,size: 14,),

                          SizedBox(width: 5,),
                          Text(actionDate, style: TextStyle(
                              color: AllColors.vividBlue,
                              fontWeight: FontWeight.w500,

                              fontSize: 12
                          ),

                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Location Button

              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: Get.height / 40,
                  decoration: BoxDecoration(color: AllColors.lighterPurple, borderRadius: BorderRadius.circular(20)),
                  child:

                  Center(
                    child: Text(
                      action_by,
                      style: TextStyle(color: AllColors.mediumPurple, fontSize: 10),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Action to be executed when the button is pressed
                  },
                  icon: Icon(
                    Icons.remove_red_eye_outlined, // Correct usage of Icon widget
                    color: AllColors.vividBlue, // Set the icon color
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


