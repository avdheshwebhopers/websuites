import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class CustomerList_Card extends StatelessWidget {
  final String title;

  const CustomerList_Card({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/6.5,
        width: Get.width*1,
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
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    fontFamily: AppFonts.nunitoRegular,
                  ),),
                  Text('harishsharma@gmail.com', style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: AppColors.grey,
                      fontFamily: AppFonts.nunitoRegular
                  ),)
                ],
              ),

              Text('Eskos Pharma / Eskos Vedic', style: TextStyle(
                  color: AppColors.welcomeColor,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),),

              Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Icon(Icons.call_rounded, size: 15, color: AppColors.grey,),

                  SizedBox(width: 10,),

                  Text('+91-8810923456',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular,color: AppColors.grey
                    ),),

                  Spacer(),

                  Container(
                    height: Get.height/40,
                    decoration: BoxDecoration(
                      color: AppColors.lighterPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Center(
                        child: Text('PritPal Singh', style: TextStyle(
                            color: AppColors.mediumPurple,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),),
                      ),
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