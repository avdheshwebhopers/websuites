import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';

class TrashLeadScreenCard extends StatelessWidget {
  final String title;
  final String email;
  final String mobile;
  final String date;
  final String remark;
  final String deleteBy;
  final String leadType;

  const TrashLeadScreenCard({
    Key? key,
    required this.title,
    required this.email,
    required this.mobile,
    required this.date,
    required this.remark,
    required this.deleteBy,
    required this.leadType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                color: AllColors.welcomeColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),

            // Email and Phone Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    email,
                    style: TextStyle(
                      color: AllColors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Icon(Icons.phone_in_talk,
                        color: AllColors.lightGrey,
                        size: 16
                    ),
                    const SizedBox(width: 4),
                    Text(
                      mobile,
                      style: TextStyle(
                        color: AllColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Date and Remark Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                        size: 16,
                        color: AllColors.vividPurple,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(
                          color: AllColors.vividPurple,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: [



                    Image.asset('assets/icons/remark.png',height: 12,color: AllColors.lightGrey,)
                    ,
                    SizedBox(width: 5,),
                    Text(
                      remark,
                      style: TextStyle(
                        color: AllColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const Divider(height: 24, thickness: 0.5),

            // Chips Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // DeleteBy Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4
                  ),
                  decoration: BoxDecoration(
                    color: AllColors.lighterPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    deleteBy,
                    style: TextStyle(
                      color: AllColors.vividPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                // LeadType Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4
                  ),
                  decoration: BoxDecoration(
                    color: AllColors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    leadType,
                    style: TextStyle(
                      color: AllColors.darkBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
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