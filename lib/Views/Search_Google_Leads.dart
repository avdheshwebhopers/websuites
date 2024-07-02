import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_20h.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_images.dart';
import '../Resources/components/Cards/create_new_lead_screen_Card/create_new_lead_screen_Widget.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_15h.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_22h.dart';
import '../Resources/components/app_colors.dart';

class SearchGoogleLeads extends StatefulWidget {
  const SearchGoogleLeads({super.key});

  @override
  State<SearchGoogleLeads> createState() => _SearchGoogleLeadsState();
}

class _SearchGoogleLeadsState extends State<SearchGoogleLeads> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String? userEmail = "";

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
        userName = first_name!;
        userEmail = email!;
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
            Padding(
              padding: EdgeInsets.only(top: 130),
              child: Image.asset(
                AppImages.World_Map,
                scale: 1,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: Text(
                      'Find Active Small Business Leads',
                      style: TextStyle(
                          color: AppColors.vividPurple,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Center(
                    child: Text(
                      'And Places on Google Map',
                      style: TextStyle(
                          color: AppColors.vividPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: AppFonts.nunitoRegular),
                    ),
                  ),
                  SizedBox_22h(),
                  Text(
                    'Search Lead',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  CreateNewLeadScreenWidget(hintText: 'Search'),
                  SizedBox_15h(),
                  Text(
                    'By Location',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: AppFonts.nunitoRegular),
                  ),
                  CreateNewLeadScreenWidget(hintText: 'Enter Location'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: Get.height / 24,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                          color: AppColors.mediumPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Search',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //====================================================================
            //AppBar

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
                        color: AppColors.blackColor,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Search Google Leads',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
