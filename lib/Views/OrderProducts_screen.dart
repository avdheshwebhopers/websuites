import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class OrderProductsScreen extends StatefulWidget {
  const OrderProductsScreen({super.key});

  @override
  State<OrderProductsScreen> createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body:
          Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height/5.6,
                        width: Get.width/1,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.blackColor.withOpacity(0.06),
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
                                      color: AppColors.mediumGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AppFonts.nunitoRegular
                                  ),),

                                  Spacer(),

                                  Container(
                                    height: Get.height/40,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.lighterOrange,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Services', style: TextStyle(
                                          color: AppColors.vividOrange
                                      ),),
                                    ),
                                  )
                                ],
                              ),

                              Text('Lifecare Neuro', style: TextStyle(
                                color: AppColors.welcomeColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )
                              ),

                              Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined, size: 18, color: AppColors.mediumPurple,),
                                  SizedBox(width: 10,),
                                  Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
                                      color: AppColors.mediumPurple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AppFonts.nunitoRegular
                                  ),),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    height: Get.height/40,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBlue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Pharmahopers', style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontFamily: AppFonts.nunitoRegular,
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
                                      color: AppColors.lighterPurple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Nitin Sharma', style: TextStyle(
                                          color: AppColors.mediumPurple,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AppFonts.nunitoRegular
                                      ),),
                                    ),
                                  )


                                ],
                              )


                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                height: Get.height/8,
                width: Get.width/1,
                decoration: BoxDecoration(
                  color: AppColors.lighterPurple,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.06),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ]
                ),
              )

            ],
          )




    );
  }
}
