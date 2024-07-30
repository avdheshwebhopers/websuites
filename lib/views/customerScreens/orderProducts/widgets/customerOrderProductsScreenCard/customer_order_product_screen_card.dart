import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/appColors/app_colors.dart';

class CustomerOrderProductScreenCard extends StatelessWidget {
  final String title;

  const CustomerOrderProductScreenCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/6,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4
              )
            ],
            borderRadius: BorderRadius.circular(10)
        ),

        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Premium350 (1Y)', style: TextStyle(
                      color: AllColors.mediumGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                        
                  ),),

                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12,),
                    decoration: BoxDecoration(
                      color: AllColors.lighterOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Services', style: TextStyle(
                          color: AllColors.vividOrange,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                          
                      ),),
                    ),
                  )
                ],
              ),

              Text(title, style: TextStyle(
                color: AllColors.welcomeColor,
                  
                fontWeight: FontWeight.w700,
                fontSize: 16,
              )
              ),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 18, color: AllColors.mediumPurple,),
                  SizedBox(width: 10,),
                  Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                        
                  ),),
                ],
              ),

              Row(
                children: [
                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Pharmahopers', style: TextStyle(
                          color: AllColors.darkBlue,
                            
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),),
                    ),
                  ),

                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AllColors.lighterPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Nitin Sharma', style: TextStyle(
                          color: AllColors.mediumPurple,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                            
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