import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10h.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_20h.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10w.dart';
import '../Resources/components/app_colors.dart';

class CustomerPaymentReminders extends StatefulWidget {
  const CustomerPaymentReminders({super.key});

  @override
  State<CustomerPaymentReminders> createState() =>
      _CustomerPaymentRemindersState();
}

class _CustomerPaymentRemindersState extends State<CustomerPaymentReminders> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();


  String? userName = '';
  String? userEmail = '';

  @override
  void initState(){
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name;
        userEmail = email;
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.mediumPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Reminder to',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: AppFonts.nunitoRegular,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.textfield2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'By Status',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.textfield2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Division',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox_20h(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 3.5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Mr. Saurav Dhiman',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox_10w(),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: Get.height / 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.lighterOrange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Paid',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: AppFonts.nunitoRegular,
                                          color: AppColors.vividOrange),
                                    ),
                                  )),
                              Spacer(),
                              Text(
                                '₹31,998',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Ritelife Healthcare',
                                style: TextStyle(
                                    color: AppColors.welcomeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 25,
                              ),
                            ],
                          ),
                          Text(
                            'Product Super 50(Quaterly)',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontFamily: AppFonts.nunitoRegular,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            children: [
                              Text(
                                'ORDER ID',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'REMINDER TO',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '#002572',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'Shubham Saini',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox_10h(),
                          Row(
                            children: [
                              Text(
                                'CREATED BY',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'CREATED AT',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: Get.height / 40,
                                decoration: BoxDecoration(
                                    color: AppColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Manish Jindal',
                                    style: TextStyle(
                                        color: AppColors.vividPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: AppFonts.nunitoRegular),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                'May 31, 2024, 10:47 AM',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox_10h(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CHEQUE',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Text(
                                'CHEQUE/REMINDER',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Aug-5bf9.jpg',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              Text(
                                'May 31, 2024, 10:47AM',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height / 6,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Mr. Sourav Dhiman',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular),
                              ),
                              SizedBox_10w(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                height: Get.height / 40,
                                decoration: BoxDecoration(
                                  color: AppColors.lighterOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(
                                        color: AppColors.vividOrange,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₹45,678',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    fontFamily: AppFonts.nunitoRegular),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ritelife Healthcare',
                                style: TextStyle(
                                    color: AppColors.welcomeColor,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              )
                            ],
                          ),
                          Text(
                            'Product Super 50(Quarterly)',
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: AppFonts.nunitoRegular,
                            ),
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call_rounded,
                                size: 20,
                                color: AppColors.lightGrey,
                              ),
                              Text(
                                '+91-9876512345',
                                style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                height: Get.height / 40,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Manish jindal',
                                    style: TextStyle(
                                        color: AppColors.darkGreen,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: AppFonts.nunitoRegular),
                                  ),
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

            //================================================================
            //CUSTOM APP BAR

            CustomAppBar(
                child: Row(
              children: [
                InkWell(
                  onTap: (){
                    _globalKey.currentState?.openDrawer();
                  },
                  child: Icon(
                    Icons.menu_sharp,
                    size: 25,
                  ),
                ),
                SizedBox_10w(),
                Text(
                  'Payment Reminder',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppFonts.nunitoRegular,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.lightGrey,
                ),
                SizedBox_10w(),
                Container(
                    height: Get.height / 30,
                    width: Get.width / 12,
                    decoration: BoxDecoration(
                        color: AppColors.mediumPurple,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Icon(
                        Icons.upload,
                        size: 22,
                        color: AppColors.whiteColor,
                      ),
                    ))
              ],
            ))
          ],
        ));
  }
}
