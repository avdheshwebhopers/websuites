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
    return
      Container(
        height: Get.height/5.5,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 10),
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: TextStyle(
                    fontWeight: FontWeight.w500,
                      
                    fontSize: 13,
                    color: AllColors.blackColor
                ),),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: Get.height/46,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AllColors.lightPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(activity, style: TextStyle(
                        color: AllColors.vividPurple,
                        fontSize: 12,
                          
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.vividPurple),

                SizedBox(width: 5,),

                Text('June 26, 2024 at 11:29 AM', style: TextStyle(
                  color: AllColors.grey,
                  fontWeight: FontWeight.w400,
                    
                  fontSize: 12,
                ),),
              ],
            ),

            const Divider(
              thickness: 0.2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyles.w500_universal(fontSize: 13,color: AllColors.blackColor, context, Strings.subtypes),

                SizedBox(width: 5,),

                Icon(Icons.arrow_right_alt, size: 18, color: AllColors.lightGrey,),

                SizedBox(width: 5,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: Get.height/40,
                          // width: Get.width/3.5,
                          decoration: BoxDecoration(
                              color: AllColors.textField2,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Row(
                            children: [
                              Text('Not Interested', style: TextStyle(
                                  color: AllColors.darkGrey,
                                  fontWeight: FontWeight.w400,
                                    
                                  fontSize: 12
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AllColors.lightGrey,)
                            ],
                          ),
                        ),

                        SizedBox(width: 8,),



                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AllColors.textField2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text('Price Issue', style: TextStyle(
                                  color: AllColors.darkGrey,
                                  fontSize: 12,
                                    
                                  fontWeight: FontWeight.w400
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AllColors.lightGrey,)
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AllColors.textField2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Interested', style: TextStyle(
                                  color: AllColors.darkGrey,
                                    
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),

                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AllColors.lightGrey,),

                            ],
                          ),
                        ),

                        SizedBox(width: 8,),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: Get.height/40,
                          decoration: BoxDecoration(
                            color: AllColors.textField2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text('Projection', style: TextStyle(
                                color: AllColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                  
                              ),),
                              SizedBox(width: 5,),

                              Icon(Icons.edit, size: 14, color: AllColors.lightGrey,)
                            ],
                          ),
                        ),

                        SizedBox(width: 8,),

                        Icon(Icons.add_circle_outline, size: 20, color: AllColors.lightGrey,)


                      ],
                    )
                  ],
                )
              ],
            )






          ],
        ),
      );
  }
}