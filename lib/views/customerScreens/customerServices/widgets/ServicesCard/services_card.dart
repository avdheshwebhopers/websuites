import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/resources/textStyles/text_styles.dart';

import '../../../../../utils/appColors/app_colors.dart';

class AllServicesScreenCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String paymentMode;
  final String email;
  final String orderNumber;
  final String date;
  final String status;
  final String price;

  const AllServicesScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.paymentMode,
    required this.email,
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.price,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/4.6,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                color: AllColors.welcomeColor,
                fontWeight: FontWeight.w700,

                fontSize: 17,
              ),),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: AllColors.mediumGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1, // Ensures the text only occupies one line
                      overflow: TextOverflow.ellipsis, // Adds '...' if the text overflows
                    ),
                  ),
                  SizedBox(width: 10),
                  Spacer(),
                  Container(
                    height: Get.height / 45,
                    padding: TextStyles.defaultPadding(context),
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        paymentMode,
                        style: TextStyle(
                          color: AllColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),




              Row(
                children: [
                  Icon(Icons.mail_outline_rounded, size: 16, color: AllColors.lightGrey,),

                  SizedBox(width: 8,),

                  Text(email, style: TextStyle(
                      color: AllColors.mediumGrey,
                      fontSize: 12,
                        
                      fontWeight: FontWeight.w400
                  ),),

                  Spacer(),

                  Text('ORDER NO', style: TextStyle(

                      fontWeight: FontWeight.bold,
                        
                      fontSize: 13
                  ),),
                ],
              ),


              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.mediumPurple,),

                  SizedBox(width: 8,),

                  Text(date, style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontSize: 12,
                        
                      fontWeight: FontWeight.w400
                  ),),
                  Spacer(),

                  Text(orderNumber, style: TextStyle(
                    color: AllColors.lightGrey,
                    fontWeight: FontWeight.w400,
                      
                    fontSize: 12,

                  ),)
                ],
              ),

              Divider(
                thickness: 0.4,
              ),



    Row(
      children: [
        Container(
          height: Get.height/40,
          width: Get.width/3,
          decoration: BoxDecoration(
            color: AllColors.lighterPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(status, style: TextStyle(
                color: AllColors.mediumPurple,
                fontSize: 12,

                fontWeight: FontWeight.w500
            ),),
          ),
        ),
      Spacer(),
      Text(price, style: TextStyle(

          fontSize: 14,

        fontWeight: FontWeight.bold
      ),),
    ],)
            ],
          ),
        ),
      );

  }
}