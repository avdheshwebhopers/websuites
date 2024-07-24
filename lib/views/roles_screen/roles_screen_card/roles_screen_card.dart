import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../../../Utils/components/app_colors.dart';

class RolesScreenCard extends StatelessWidget {
  final String title;

  const RolesScreenCard({
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
          padding: const EdgeInsets.all(15),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: AllFonts.nunitoRegular,
                  ),),

                  const Icon(Icons.edit_calendar_outlined, size: 20,)
                ],
              ),

              Row(
                children: [
                  Text('DESCRIPTION - ', style: TextStyle(
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AllColors.blackColor
                  ), ),

                  Text('Graphic Designer', style: TextStyle(
                      color: AllColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: AllFonts.nunitoRegular
                  ),),
                ],
              ),

              const Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Text('MEMBERS - ', style: TextStyle(
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AllColors.blackColor
                  ),),

                  Text('06', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: AllFonts.nunitoRegular,
                    color: AllColors.grey,
                  ),),

                  Spacer(),
                  Container(height: Get.height/20,
                    width: Get.width/4.8,
                    child: Stack(
                      children: [

                        SizedBox(height: 10,),

                        Positioned(
                          left: 1,
                          child: Container(
                            height: Get.height/20,
                            width: Get.width/15,
                            decoration: BoxDecoration(
                              color: AllColors.lightRed,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text('A', style: TextStyle(
                                  color: AllColors.vividRed,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: AllFonts.nunitoRegular
                              ),),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Container(
                            height: Get.height/20,
                            width: Get.width/15,
                            decoration: BoxDecoration(
                              color: AllColors.lighterPurple,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text('R', style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: AllFonts.nunitoRegular
                              ),),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            height: Get.height/20,
                            width: Get.width/15,
                            decoration: BoxDecoration(
                              color: AllColors.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text('V', style: TextStyle(
                                  color: AllColors.darkBlue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: AllFonts.nunitoRegular
                              ),),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          child: Container(
                            height: Get.height/20,
                            width: Get.width/15,
                            decoration: BoxDecoration(
                              color: AllColors.lightYellow,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text('J', style: TextStyle(
                                  color: AllColors.darkYellow,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: AllFonts.nunitoRegular
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text('+3', style: TextStyle(
                      color: AllColors.grey,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                  ),)

                ],
              )

            ],
          ),
        ),
      );
  }
}