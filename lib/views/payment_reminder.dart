import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/all_fonts/all_fonts.dart';
import '../utils/components/app_colors.dart';
import '../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10h.dart';
import '../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';
import '../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_20h.dart';
import '../view_models/controllers/save_token/save_token.dart';

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
        backgroundColor: AllColors.whiteColor,

        drawer: CustomDrawer(
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
                          color: AllColors.mediumPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Reminder to',
                            style: TextStyle(
                              color: AllColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: AllFonts.nunitoRegular,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AllColors.textfield2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'By Status',
                            style: TextStyle(
                                color: AllColors.blackColor,
                                fontFamily: AllFonts.nunitoRegular,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                          color: AllColors.textfield2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Division',
                            style: TextStyle(
                                color: AllColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: AllFonts.nunitoRegular),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox20h(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 3.5,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AllColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AllColors.blackColor.withOpacity(0.06),
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
                                  color: AllColors.blackColor,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox10w(),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: Get.height / 40,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterOrange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Paid',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: AllFonts.nunitoRegular,
                                          color: AllColors.vividOrange),
                                    ),
                                  )),
                              Spacer(),
                              Text(
                                '₹31,998',
                                style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontFamily: AllFonts.nunitoRegular,
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
                                    color: AllColors.welcomeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: AllFonts.nunitoRegular),
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
                                color: AllColors.grey,
                                fontFamily: AllFonts.nunitoRegular,
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
                                    color: AllColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'REMINDER TO',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontFamily: AllFonts.nunitoRegular,
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
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'Shubham Saini',
                                style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox10h(),
                          Row(
                            children: [
                              Text(
                                'CREATED BY',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              Spacer(),
                              Text(
                                'CREATED AT',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontFamily: AllFonts.nunitoRegular,
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
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Manish Jindal',
                                    style: TextStyle(
                                        color: AllColors.vividPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: AllFonts.nunitoRegular),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                'May 31, 2024, 10:47 AM',
                                style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox10h(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CHEQUE',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              Text(
                                'CHEQUE/REMINDER',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontFamily: AllFonts.nunitoRegular,
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
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              Text(
                                'May 31, 2024, 10:47AM',
                                style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontFamily: AllFonts.nunitoRegular,
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
                        color: AllColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
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
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                              SizedBox10w(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                height: Get.height / 40,
                                decoration: BoxDecoration(
                                  color: AllColors.lighterOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(
                                        color: AllColors.vividOrange,
                                        fontFamily: AllFonts.nunitoRegular,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₹45,678',
                                style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    fontFamily: AllFonts.nunitoRegular),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ritelife Healthcare',
                                style: TextStyle(
                                    color: AllColors.welcomeColor,
                                    fontFamily: AllFonts.nunitoRegular,
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
                              color: AllColors.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: AllFonts.nunitoRegular,
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
                                color: AllColors.lightGrey,
                              ),
                              Text(
                                '+91-9876512345',
                                style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                height: Get.height / 40,
                                decoration: BoxDecoration(
                                    color: AllColors.lightGreen,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Manish jindal',
                                    style: TextStyle(
                                        color: AllColors.darkGreen,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: AllFonts.nunitoRegular),
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
                SizedBox10w(),
                Text(
                  'Payment Reminder',
                  style: TextStyle(
                      color: AllColors.blackColor,
                      fontFamily: AllFonts.nunitoRegular,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 25,
                  color: AllColors.lightGrey,
                ),
                SizedBox10w(),
                Container(
                    height: Get.height / 30,
                    width: Get.width / 12,
                    decoration: BoxDecoration(
                        color: AllColors.mediumPurple,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Icon(
                        Icons.upload,
                        size: 22,
                        color: AllColors.whiteColor,
                      ),
                    ))
              ],
            ))
          ],
        ));
  }
}