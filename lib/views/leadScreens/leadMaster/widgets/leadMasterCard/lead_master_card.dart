import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';

class LeadMasterScreenCard extends StatelessWidget {
  final String title;
  final String activity;

  const LeadMasterScreenCard({
    Key? key,
    required this.title,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5.5,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AllColors.blackColor.withOpacity(0.06),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AllColors.blackColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: Get.height / 46,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AllColors.lightPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    activity,
                    style: TextStyle(
                      color: AllColors.vividPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.vividPurple),
              const SizedBox(width: 5),
              Text(
                'June 26, 2024 at 11:29 AM',
                style: TextStyle(
                  color: AllColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.w500_universal(fontSize: 13, color: AllColors.blackColor, context, Strings.subtypes),
              const SizedBox(width: 5),
              Icon(Icons.arrow_right_alt, size: 18, color: AllColors.lightGrey),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSubtypesRow(context, 'Not Interested', 'Price Issue'),
                  const SizedBox(height: 8),
                  _buildSubtypesRow(context, 'Interested', 'Projection'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubtypesRow(BuildContext context, String text1, String text2) {
    return Row(
      children: [
        _buildChip(text1),
        const SizedBox(width: 8),
        _buildChip(text2),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Container(
      height: Get.height / 35,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AllColors.lightPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: AllColors.vividPurple,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
