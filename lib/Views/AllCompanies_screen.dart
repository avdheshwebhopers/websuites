import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';

import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

class AllCompaniesScreen extends StatefulWidget {
  const AllCompaniesScreen({super.key});

  @override
  State<AllCompaniesScreen> createState() => _AllCompaniesScreenState();
}

class _AllCompaniesScreenState extends State<AllCompaniesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userEmail = email;
        userName = first_name;
      });
    } catch (e) {
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

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(

                children: [
                  SizedBox(height: 117,),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height/5.6,
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
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Pukit Surana', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontSize: 12,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400
                              ),),

                              Spacer(),

                              Text('eraasinternational@gmail.com', style: TextStyle(
                                  color: AppColors.mediumGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),
                            ],
                          ),

                          Text('Eraas international', style: TextStyle(
                              color: AppColors.welcomeColor,
                              fontSize: 17,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w700
                          ),),

                          const Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            children: [
                              Icon(Icons.call, size: 14,color: AppColors.lighterGrey,),
                              SizedBox(width: 10,),

                              Text('+91-9818402350', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Container(
                                height: Get.height/40,
                                width: Get.width/7,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text('N/A', style: TextStyle(
                                    color: AppColors.mediumPurple,
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.language,size: 17, color: AppColors.lightGrey,),
                              SizedBox(width: 10,),
                              Text('https://www.eraasinternational.com', style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 12
                              ),)
                            ],
                          )






                        ],
                      ),
                    ),
                  ),








                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 60, left: 15, right: 15),
            height: Get.height/8,
            width: Get.width/1,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ]
            ),
            child: Row(
              children: [
                InkWell
                  (onTap : (){
                    _globalKey.currentState?.openDrawer();
                },
                    child: Icon(Icons.menu_sharp, size: 25,)),
                SizedBox(width: 10,),
                Text('All Companies', style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w700
                ),),

                Spacer(),

                Icon(Icons.filter_list_outlined, size: 15, color: AppColors.lightGrey,),
                SizedBox(width: 5,),
                Text('Filter', style: TextStyle(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 14
                ),)




              ],
            ),
          )

        ],
      )



    );
  }
}
