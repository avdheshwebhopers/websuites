import 'package:flutter/material.dart';
import 'package:get/get.dart';
  
import '../../../../../utils/app_colors/app_colors.dart';

class TrashLeadScreenCard extends StatelessWidget {
  final String title;
  final String email;

  const TrashLeadScreenCard({
    Key? key,
    required this.title,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      height: Get.height/4.5,
      width: Get.width*1,
      decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 3,
                blurRadius: 4
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(email, style: TextStyle(
                color: AllColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                  
            ),),


            Text(title, style: TextStyle(
                color: AllColors.welcomeColor,
                  
                fontWeight: FontWeight.w700,
                fontSize: 19
            ),),

            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15, color: AllColors.vividPurple,),
                SizedBox(width: 5,),
                Text('Wed June 26, 2024 at 11:39 AM', style: TextStyle(
                    color: AllColors.vividPurple,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                      
                ),)
              ],
            ),

            Row(
              children: [
                Icon(Icons.call, size: 15, color: AllColors.lightGrey,),
                SizedBox(width: 5,),
                Text('+91-9999333456', style: TextStyle(
                    color: AllColors.lightGrey,
                      
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                ),),
                Spacer(),

                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  height: Get.height/40,
                  // width: Get.width/3.5,
                  decoration: BoxDecoration(
                    color: AllColors.lighterPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text('Siddharth Kapoor', style: TextStyle(
                        color: AllColors.vividPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                          
                    ),),
                  ),
                ),
              ],
            ),

            const Divider(
              thickness: 0.2,
            ),

            Row(
              children: [
                Text(
                  'REMARK',
                  style: TextStyle(
                    color: AllColors.blackColor,
                      
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                ),),

                Icon(Icons.arrow_right_alt, size: 25, color: AllColors.lightGrey,),

                Text('No Use',style: TextStyle(
                    color: AllColors.lightGrey,
                    fontWeight: FontWeight.w400,
                      
                    fontSize: 13
                ),),

                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height/40,
                  decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('Hot', style: TextStyle(
                        color: AllColors.darkBlue,
                        fontSize: 13,
                          
                        fontWeight: FontWeight.w400
                    ),),
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