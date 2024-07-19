import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../../Resources/Assets/app_images.dart';
import '../../Resources/app_strings/app_strings.dart';
import '../../Resources/app_textstyles/app_textstyle2.dart';
import '../../Resources/components/Cards/create_new_lead_screen_Card/create_new_lead_screen_Widget.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_15h.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_22h.dart';
import '../../Resources/components/app_colors.dart';

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

        drawer:
        AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),

        body:
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 130, left: 30, right: 20),
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
                    child:
                  AppTextStyle2.w700_16(color: AppColors.vividPurple, context, AppStrings.SearchGoogle_FindActive1),
                  ),
                  Center(
                    child:
                  AppTextStyle2.w700_16(color: AppColors.vividPurple, context, AppStrings.SearchGoogle_FindActive2),
                  ),
                  SizedBox_22h(),
                  AppTextStyle2.w500_14_Black(context, AppStrings.SearchGoogle_SearchLead),

                  CreateNewLeadScreenWidget(hintText: AppStrings.SearchGoogle_Search),
                  SizedBox_15h(),

                  AppTextStyle2.w500_14_Black(context, AppStrings.SearchGoogle_ByLocation),

                  CreateNewLeadScreenWidget(hintText: AppStrings.SearchGoogle_EnterLocation),
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
                          child:
                          AppTextStyle2.w500_14_White(context, AppStrings.SearchGoogle_Search2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //====================================================================
            //CUSTOM APP BAR

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
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:
                   AppTextStyle2.w700_16(color: AppColors.blackColor, context, AppStrings.SearchGoogle_searchGoogleLeads)
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
