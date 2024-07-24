import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../../../Utils/components/app_colors.dart';

class SalesTargetScreenCard extends StatelessWidget {
  final String title;

  const SalesTargetScreenCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height / 5.3,
        width: Get.width / 1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'START DATE - ',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w500,
                      color: AllColors.blackColor,
                    ),
                  ),
                  Text(
                    'Oct 1, 2023',
                    style: TextStyle(
                        color: AllColors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 13),
                  ),
                  const Spacer(),
                  Text(
                    '₹11,55,000',
                    style: TextStyle(
                        color: AllColors.blackColor,
                        fontSize: 13,
                        fontFamily: AllFonts.nunitoRegular,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: AllFonts.nunitoRegular,
                    fontSize: 18),
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 16,
                    color: AllColors.mediumPurple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Dec 14, 2023, 11:38 AM',
                    style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontSize: 13,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'DEADLINE - ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 13,
                        color: AllColors.blackColor),
                  ),
                  Text(
                    'Oct 31, 2023',
                    style: TextStyle(
                        color: AllColors.grey,
                        fontSize: 13,
                        fontFamily: AllFonts.nunitoRegular),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.4,
              ),
              Row(
                children: [
                  Text(
                    'MEMBERS - ',
                    style: TextStyle(
                        color: AllColors.blackColor,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '07',
                    style: TextStyle(
                        color: AllColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: AllFonts.nunitoRegular),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.report,
                    size: 20,
                    color: AllColors.mediumPurple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'REPORT',
                    style: TextStyle(
                        color: AllColors.blackColor,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}