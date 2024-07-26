import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Resources/all_fonts/all_fonts.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/text_styles/text_styles.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/components/widgets/sized_boxes/sizedBox_5w.dart';


class LeadActivitiesScreenCard extends StatelessWidget {
  final String title;
  final String companyName;

  const LeadActivitiesScreenCard({
    Key? key,
    required this.title,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
      margin: EdgeInsets.only(top: 10),
      height: Get.height/3.6,
      width: Get.width/1,
      decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AllColors.blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 0)
            )]),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,style: TextStyle(
                color: AllColors.grey,
                fontSize: 12,
                fontFamily: AllFonts.nunitoRegular,
                fontWeight: FontWeight.w400
            ),),

            Text(companyName, style: TextStyle(
                color: AllColors.welcomeColor,
                fontWeight: FontWeight.w700,
                fontFamily: AllFonts.nunitoRegular,
                fontSize: 18
            ),),

            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15,color: AllColors.mediumPurple,),

                SizedBox(width: 7,),

                Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontSize: 12,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w400
                ),)
              ],
            ),

            Row(
              children: [
                Text('CALL', style: TextStyle(
                    color: AllColors.blackColor,
                    fontFamily: AllFonts.nunitoRegular,
                    fontSize: 12,
                  fontWeight: FontWeight.w500
                ),),

                SizedBox5w(),

                Icon(Icons.arrow_right_alt, size: 15,),

                SizedBox5w(),
                Text('Number Busy', style: TextStyle(
                  color: AllColors.lightGrey,
                  fontSize: 12,
                  fontFamily: AllFonts.nunitoRegular,
                ),),
                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height/40,
                  decoration: BoxDecoration(
                      color: AllColors.lighterPurple,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('Manish Jindal',style: TextStyle(
                        color: AllColors.mediumPurple,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 12
                    ),),
                  ),
                ),
              ],
            ),

            Divider(
              thickness: 0.09,
              color: AllColors.blackColor,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       TextStyles.w500_12(color: AllColors.blackColor, context, Strings.LeadActivity_remark),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.arrow_right_alt, size: 20, color: AllColors.lightGrey,),
                        ),

                        Text('Not Answered', style: TextStyle(
                            color: AllColors.lightGrey,
                            fontFamily: AllFonts.nunitoRegular,
                            fontSize: 12
                        ),)
                      ],
                    ),

                    SizedBox(height: 5,),

                    Row(
                      children: [
                        TextStyles.w500_12(color: AllColors.blackColor, context, Strings.LeadActivity_reminder),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.arrow_right_alt, size: 20, color: AllColors.lightGrey,),
                        ),

                        Text('28/06/2024 11:59 am', style: TextStyle(
                            color: AllColors.vividBlue,
                            fontWeight: FontWeight.w500,
                            fontFamily: AllFonts.nunitoRegular,
                            fontSize: 12
                        ),
                        )
                      ],
                    )
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: Get.height/40,
                      decoration: BoxDecoration(
                          color: AllColors.lightBlue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('View', style: TextStyle(
                            color: AllColors.vividBlue,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),),
                      ),
                    )

                  ],
                )
              ],
            )



          ],
        ),
      ),
    );
  }
}