import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../app_colors.dart';

class OrderActivityScreenCard extends StatelessWidget {
  final String title;

  const OrderActivityScreenCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/7,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ]
        ),
        child:
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Serviceable', style: TextStyle(
                    color: AllColors.grey,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  ),
                  Spacer(),
                  Text('₹35,300', style: TextStyle(
                      color: AllColors.blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: AllFonts.nunitoRegular
                  ),
                  ),
                ],
              ),

              Text(title, style: TextStyle(
                  color: AllColors.blackColor,
                  fontFamily: AllFonts.nunitoRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 17
              ),),

              Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.mediumPurple,),
                  SizedBox5w(),
                  Text('June 25, 2024', style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: AllFonts.nunitoRegular
                  ),),
                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: AllColors.lighterPurple,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('Count-02', style: TextStyle(
                          color: AllColors.mediumPurple,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 12
                      ),),
                    ),
                  ),

                ],

              )



            ],
          ),
        ),

      );
  }
}