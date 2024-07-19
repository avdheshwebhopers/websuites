import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../Resources/all_fonts/all_fonts.dart';

import '../../utils/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';


class OrderProformaList extends StatefulWidget {
  const OrderProformaList({super.key});

  @override
  State<OrderProformaList> createState() => _OrderProformaListState();
}

class _OrderProformaListState extends State<OrderProformaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      
      body:
          Stack(
            children:[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Container(
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
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('gayatri@bpis.health', style: TextStyle(
                                      color: AllColors.grey,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12
                                  ),),

                                  SizedBox10w(),

                                  Container(
                                    height: Get.height/45,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: AllColors.lighterOrange,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child: Text('Customer', style: TextStyle(
                                          color: AllColors.vividOrange,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AllFonts.nunitoRegular,
                                          fontSize: 12
                                      ),),
                                    ),
                                  ),
                                  Spacer(),

                                  Text('#254', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 12,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),

                              Text('Mr. Ahemad', style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontSize: 18
                              ),),

                              Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined, size: 15, color: AllColors.mediumPurple,),

                                  SizedBox5w(),
                                  Text('Jun 26, 2024', style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w400,
                                      color: AllColors.mediumPurple
                                  ),),
                                  Spacer(),

                                  Container(
                                    height: Get.height/40,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: AllColors.lighterPurple,
                                        borderRadius :BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child: Text('Ashish Mohan', style: TextStyle(
                                          color: AllColors.mediumPurple,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AllFonts.nunitoRegular,
                                          fontSize: 12
                                      ),),
                                    ),
                                  )
                                ],
                              ),

                              Divider(
                                thickness: 0.4,
                              ),

                              Container(
                                height: Get.height/40,
                                width: Get.width/4,
                                decoration: BoxDecoration(
                                  color: AllColors.lightBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('View Proforma', style: TextStyle(
                                      color: AllColors.darkBlue,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 12
                                  ),),
                                ),
                              )





                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(child: Row(
                children: [
                  Icon(Icons.menu_sharp, size: 25,),
                  SizedBox10w(),
                  Text('Proforma List', style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 17,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w700,
                  ),)
                ],
              ))


            ],
          ),


      


    );
  }
}

