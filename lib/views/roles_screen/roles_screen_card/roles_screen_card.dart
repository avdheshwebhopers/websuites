import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Resources/all_fonts/all_fonts.dart';
import '../../../utils/app_colors/app_colors.dart';

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
        margin: const EdgeInsets.only(bottom: 10),
        height: Get.height/6,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4
              )
            ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(
                      color: AllColors.blackColor,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),

                  const Icon(Icons.edit_calendar_outlined, size: 20,)
                ],
              ),

              Row(
                children: [
                  Text('DESCRIPTION - ', style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: AllFonts.nunitoRegular,
                  ),),

                  Text('Graphic Designer', style: TextStyle(
                      color: AllColors.grey,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),

              const Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Text('MEMBERS - ', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: AllFonts.nunitoRegular,
                    color: AllColors.blackColor,
                  ),),

                  Text('12',style: TextStyle(
                      color: AllColors.grey,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),),

                  Spacer(),

                  Container(
                    height: Get.height/30,
                    width: Get.width/4.3,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height/30,
                          width: Get.width/12,
                          decoration: BoxDecoration(
                              color: AllColors.lightRed,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Text('A', style: TextStyle(
                                color: AllColors.vividRed,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),
                          ),
                        ),

                        Positioned(
                          left: 20,
                          child: Container(
                            height: Get.height/30,
                            width: Get.width/12,
                            decoration: BoxDecoration(
                                color: AllColors.lighterPurple,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text('R', style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12
                              ),),

                            ),
                          ),
                        ),

                        Positioned(
                          left: 40,
                          child: Container(
                            height: Get.height/30,
                            width: Get.width/12,
                            decoration: BoxDecoration(
                                color: AllColors.lightBlue,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text('V', style: TextStyle(
                                color: AllColors.vividBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),),
                            ),
                          ),
                        ),

                        Positioned(
                            left: 60,
                            child: Container(
                              height: Get.height/30,
                              width: Get.width/12,
                              decoration: BoxDecoration(
                                color: AllColors.lightYellow,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text('J', style: TextStyle(
                                    color: AllColors.darkYellow,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12
                                ),),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                  Text('+3', style: TextStyle(
                      color: AllColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: AllFonts.nunitoRegular
                  ),)

                ],
              ),





            ],
          ),
        ),
      );
  }
}