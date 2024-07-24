import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Resources/all_fonts/all_fonts.dart';
import '../../Utils/components/app_colors.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                height: Get.height/5,
                width: Get.width/1,
                decoration: BoxDecoration(
                  color: AllColors.lighterPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Graphic Designer', style: TextStyle(
                          color: AllColors.blackColor,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),),

                        Icon(Icons.edit_calendar_outlined, size: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        Text('DESCRIPTION - ', style: TextStyle(
                          color: AllColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          fontFamily: AllFonts.nunitoRegular,
                        ),),

                        Text('Graphic Designer', style: TextStyle(
                          color: AllColors.grey,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),

                    Divider(
                      thickness: 0.4,
                    ),

                    Row(
                      children: [
                        Text('MEMBERS - ', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          fontFamily: AllFonts.nunitoRegular,
                          color: AllColors.blackColor,
                        ),),

                        Text('12',style: TextStyle(
                          color: AllColors.blackColor,
                          fontFamily: AllFonts.nunitoRegular
                        ),)
                      ],
                    )



                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
