import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/LeadMasterScreen_card/LeadMasterScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

class LeadMasterScreen extends StatefulWidget {
  const LeadMasterScreen({super.key});

  @override
  State<LeadMasterScreen> createState() => _LeadMasterScreenState();
}

class _LeadMasterScreenState extends State<LeadMasterScreen> {
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
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.search, size: 27, color: AppColors.whiteColor,),
        backgroundColor: AppColors.vividPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



      key: _globalKey,
      backgroundColor: AppColors.whiteColor,
      drawer: Container(
        height: Get.height / 1,
        width: Get.width / 1.8,
        color: AppColors.whiteColor,
        child: AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.mediumPurple,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Types',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Source',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AppColors.textfield2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Status',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Available Lead Status',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.nunitoRegular),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LeadMaster_screen_card(title: 'Cold', activity: 'Active'),
                  LeadMaster_screen_card(title: 'Hot', activity: 'In Progress'),
                  LeadMaster_screen_card(title: 'Hot', activity: 'Completed'),
                  LeadMaster_screen_card(title: 'Cold', activity: 'Active'),
                  LeadMaster_screen_card(title: 'Cold', activity: 'Active'),
                  LeadMaster_screen_card(
                      title: 'Cold', activity: 'In Progress'),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),

          //====================================================================
          //AppBAr Below

          CustomAppBar(
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu_sharp,
                      size: 25,
                    )),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Lead Master',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.lightGrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height / 30,
                  decoration: BoxDecoration(
                      color: AppColors.mediumPurple,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Add Lead Type',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.nunitoRegular),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
