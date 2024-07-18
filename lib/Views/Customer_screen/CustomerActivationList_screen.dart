import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../../Resources/Assets/app_fonts.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10w.dart';
import '../../Resources/components/app_colors.dart';

class CustomerActivationListScreen extends StatefulWidget {
  const CustomerActivationListScreen({super.key});

  @override
  State<CustomerActivationListScreen> createState() => _CustomerActivationListScreenState();
}

class _CustomerActivationListScreenState extends State<CustomerActivationListScreen> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData () async {
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });

    }catch (e){
      print('Error fetching userData: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColors.whiteColor,

      drawer: AppDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),

      body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 130,),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/6,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.06),
                                spreadRadius: 2,
                                blurRadius: 4,

                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              children: [
                                Text('Pharmahopers', style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular
                                ),),
                                Spacer(),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: Get.height/40,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('View', style: TextStyle(
                                      color: AppColors.darkBlue,

                                    ),),
                                  ),
                                )
                              ],
                            ),

                            Text('RealNova Healthcare', style: TextStyle(
                                color: AppColors.welcomeColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                            ),),

                            Row(children: [
                              Icon(Icons.calendar_month_outlined, size: 14, color: AppColors.mediumPurple,),
                              SizedBox_5w(),
                              Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                                  color: AppColors.mediumPurple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular
                              ),)
                            ],),

                            Row(
                              children: [
                                Icon(Icons.inventory, size: 14, color: AppColors.vividBlue,),
                                SizedBox_5w(),
                                Text('Invalid Date', style: TextStyle(
                                    color: AppColors.vividBlue,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13
                                ),),

                                Spacer(),


                                Container(
                                  height: Get.height/40,
                                  width: Get.width/4,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Nitin Sharma', style: TextStyle(
                                        color: AppColors.darkBlue,
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
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/6,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4,

                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              children: [
                                Text('Pharmahopers', style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular
                                ),),
                                Spacer(),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: Get.height/40,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('View', style: TextStyle(
                                      color: AppColors.darkBlue,

                                    ),),
                                  ),
                                )
                              ],
                            ),

                            Text('RealNova Healthcare', style: TextStyle(
                                color: AppColors.welcomeColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                            ),),

                            Row(children: [
                              Icon(Icons.calendar_month_outlined, size: 14, color: AppColors.mediumPurple,),
                              SizedBox_5w(),
                              Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                                  color: AppColors.mediumPurple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular
                              ),)
                            ],),

                            Row(
                              children: [
                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.lighterOrange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Approval Date', style: TextStyle(
                                        color: AppColors.vividOrange,
                                        fontSize: 12,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                ),
                                SizedBox_10w(),

                                Text('Invalid Date', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12,
                                ),),

                                Spacer(),

                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Roshan jha', style: TextStyle(
                                        color: AppColors.mediumPurple,
                                        fontSize: 12,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                )

                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //================================================================
              // CUSTOM APP BAR

              CustomAppBar(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            _globalKey.currentState?.openDrawer();
                          },
                          child: Icon(Icons.menu_sharp, size: 25,)),
                      SizedBox_10w(),
                      Text('Activation List', style: TextStyle(
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: AppColors.blackColor
                      ),
                      ),

                      Spacer(),
                      
                      Icon(Icons.filter_list_outlined, size: 14, color: AppColors.lightGrey,),
                      SizedBox_5w(),
                      Text('Filter', style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular
                      ),),




                    ],

                  ))


            ],
          )


    );
  }
}
