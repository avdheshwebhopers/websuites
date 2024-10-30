import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/appColors/app_colors.dart';


class LeadListScreenCard extends StatelessWidget {
  final String title;
  final String companyName;

  const LeadListScreenCard({
    Key? key,
    required this.title,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(top: 10),
        height: Get.height/4.3,
        width: Get.width/1,
        decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [




              Text(companyName, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,

                  color: AllColors.welcomeColor
              ),),

              Row(

                children: [
                  Expanded(
                    child: Text(title, style: TextStyle(
                        color: AllColors.grey,

                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),


                    ),
                  ),
                  Icon(Icons.call_rounded, size: 15, color: AllColors.lightGrey,),

                  SizedBox(width: 5,),

                  Text('+91-88105399221', style: TextStyle(
                      fontWeight: FontWeight.w400,

                      fontSize: 12,
                      color: AllColors.grey
                  ),),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month_rounded, size: 17, color: AllColors.vividPurple, ),
                  SizedBox(width: 8,),
                  Text('Wed 26, June 2024 at 12:09 pm', style: TextStyle(
                    color: AllColors.vividPurple,

                    fontSize: 12,
                  ), ),
                  Spacer(),

                  Row(
                    children: [
                      Icon(Icons.language, size: 16,color: AllColors.lightGrey,),

                      SizedBox(width: 5,),

                      Text('Google', style: TextStyle(
                          color: AllColors.grey,
                          fontSize: 12,

                          fontWeight: FontWeight.w400
                      ),)
                    ],
                  )
                ],
              ),
              Divider(thickness: 0.5, color: AllColors.lighterGrey,),
              Row(
                children: [



                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                      height: Get.height / 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AllColors.lighterPurple
                      ),
                      child: Center(
                        child: Text('Manish Jindal', style: TextStyle(
                            fontSize: 12,

                            fontWeight: FontWeight.w400,
                            color: AllColors.vividPurple
                        ),),
                      )
                  ),
                  Spacer(),
                  Container(
                      height: Get.height / 40,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AllColors.lightBlue
                      ),
                      child: Center(
                        child: Text('PharmaHopers', style: TextStyle(
                            fontSize: 12,

                            fontWeight: FontWeight.w400,
                            color: AllColors.darkBlue
                        ),
                        ),
                      )
                  ),

                ],
              ),




            ],

          ),

        ),
      );

  }
}