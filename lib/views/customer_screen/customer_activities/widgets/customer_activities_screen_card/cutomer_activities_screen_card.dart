import 'package:flutter/material.dart';
import 'package:get/get.dart';
  
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/text_styles/text_styles.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/components/widgets/sized_boxes/sizedBox_5w.dart';

class CustomerActivitiesScreenCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomerActivitiesScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/4,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4
              ),
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                color: AllColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                  
              ),),

              Text(subtitle, style: TextStyle(
                color: AllColors.welcomeColor,
                  
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 17, color: AllColors.mediumPurple,),
                  SizedBox(width: 10,),
                  Text('Wed, Jun 26, 2024 at 11:39 AM', style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                      
                  ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('Call', style: TextStyle(
                      color: AllColors.blackColor,
                        
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),),

                  SizedBox5w(),

                  Icon(Icons.arrow_right_alt, size: 20,),

                  SizedBox5w(),

                  Text('Number Busy', style: TextStyle(
                    color: AllColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                      
                  ),),

                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: Get.height/40,
                    decoration: BoxDecoration(
                      color: AllColors.lighterPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Roshan Jha', style: TextStyle(
                          color: AllColors.mediumPurple,
                            
                          fontWeight: FontWeight.w400,
                          fontSize: 13
                      ),),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 0.4,
              ),

              Row(children: [
              TextStyles.w500_universal(fontSize: 13, color: AllColors.blackColor, context, Strings.remark),
                SizedBox5w(),
                Icon(Icons.arrow_right_alt, size: 15, color: AllColors.lightGrey,),

                SizedBox5w(),

                Text('Not Answered', style: TextStyle(
                    color: AllColors.lightGrey,
                      
                    fontWeight: FontWeight.w400,
                    fontSize: 13
                ),),


              ],),

              Row(
                children: [
                 TextStyles.w500_universal(fontSize: 13,color: AllColors.blackColor, context, Strings.reminderTo),
                  SizedBox5w(),
                  Icon(Icons.arrow_right_alt, size: 15, color: AllColors.lightGrey,),
                  SizedBox5w(),

                  Text('Anil Kumar', style: TextStyle(
                      color: AllColors.darkBlue,
                        
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  ),
                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AllColors.lightBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('View', style: TextStyle(
                          color: AllColors.vividBlue,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                            
                      ),
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