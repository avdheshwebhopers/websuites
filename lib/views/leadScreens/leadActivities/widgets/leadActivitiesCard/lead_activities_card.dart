import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/components/widgets/sizedBoxes/sizedBox_5w.dart';

class LeadActivitiesScreenCard extends StatelessWidget {
  final String title;
  final String companyName;
  final String actionDate;
  final String activity;
  final String info;
  final String action_by;
  final String status;
  final String created_Date;
  final String request_Location;

  LeadActivitiesScreenCard({
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 200, // Set a fixed height for the card
      width: Get.width,
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
        child: Column(
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
            Flexible(
              child:
              Text(
                title,
                style: TextStyle(color: AllColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5),

            // Date and Activity Info
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15, color: AllColors.mediumPurple),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    actionDate,
                    style: TextStyle(color: AllColors.mediumPurple, fontSize: 10, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            // Activity Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    activity,
                    style: TextStyle(color: AllColors.blackColor, fontSize: 10, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.visible,
                    maxLines: 2, // Allow activity to take up to 2 lines
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_right_alt, size: 15),
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
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: Get.height / 40,
                  decoration: BoxDecoration(color: AllColors.lighterPurple, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      action_by,
                      style: TextStyle(color: AllColors.mediumPurple, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            // Divider
            Divider(thickness: 0.09, color: AllColors.blackColor),

            // Remark and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextStyles.w500_12(color: AllColors.blackColor, context, Strings.remark),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Icon(Icons.arrow_right_alt, size: 20, color: AllColors.lightGrey),
                          ),
                          Flexible(
                            child: Text(
                              status,
                              style: TextStyle(color: AllColors.lightGrey, fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          TextStyles.w500_12(color: AllColors.blackColor, context, Strings.reminder),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Icon(Icons.arrow_right_alt, size: 20, color: AllColors.lightGrey),
                          ),

                          Text(created_Date, style: TextStyle(
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: Get.height / 40,
                  decoration: BoxDecoration(
                    color: AllColors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      request_Location,
                      style: TextStyle(color: AllColors.vividBlue, fontWeight: FontWeight.w400, fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
