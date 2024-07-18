import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/app_strings/app_strings.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_FloatingActionButton/custom_floatingActionButton.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/Resources/components/app_colors.dart';

import '../../Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/Assets/app_Icons.dart';
import '../../Resources/app_textstyles/app_textstyle2.dart';
import '../../Resources/components/Cards/LeadList_screen_card/leadlist_screen_card.dart';
import '../../View_model/controllers/save_token/save_token.dart';

class LeadListScreen extends StatefulWidget {
  const LeadListScreen({super.key});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = "";

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
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
        bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(
            onPressed: () {},
            imageIcon: AppIcons.navSearch3,
            backgroundColor: AppColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _globalKey,
        backgroundColor: AppColors.whiteColor,


        drawer: AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),

        body: Stack(
          children: [
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 109,
                    ),
                    Leadlist_screen_card(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),
                    Leadlist_screen_card(
                        title: 'Lokesh Kumar', companyName: 'Biophar Pharma'),
                    Leadlist_screen_card(
                        title: 'Rahul Choudhary', companyName: 'Tata Pharma'),
                    Leadlist_screen_card(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),
                    Leadlist_screen_card(
                        title: 'Mukesh',
                        companyName: 'Prelims Pharma Private Limited'),
                  ],
                ),
              ),
            ),

            //==================================================================
            //Custom App Bar

            CustomAppBar(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      child:
                      Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AppTextStyle2.w700_17(color: AppColors.blackColor,
                      context, AppStrings.LeadList_LeadList),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.filter_list_outlined,
                          color: AppColors.lightGrey, size: 17),
                      SizedBox(
                        width: 5,
                      ),
                      AppTextStyle2.w400_14(color: AppColors.blackColor,
                          context, AppStrings.LeadList_Filter),
                      SizedBox(
                        width: 10,
                      ),
                      AppTextStyle2.w400_13(color: AppColors.blackColor,
                          context, AppStrings.LeadList_Lastweek),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 34,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
