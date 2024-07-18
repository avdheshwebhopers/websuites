import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/Assets/app_Icons.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_FloatingActionButton/custom_floatingActionButton.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/app_strings/app_strings.dart';
import '../Resources/app_textstyles/app_textstyle2.dart';
import '../Resources/components/Cards/Activities_screen_card/activities_screen_card.dart';
import '../Resources/components/app_colors.dart';

class LeadActivities_Screen extends StatefulWidget {
  const LeadActivities_Screen({super.key});

  @override
  State<LeadActivities_Screen> createState() => _LeadActivities_ScreenState();
}

class _LeadActivities_ScreenState extends State<LeadActivities_Screen> {
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
        bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
            imageIcon: AppIcons.navSearch3,
            backgroundColor: AppColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        drawer:
        AppDrawer(
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
                      height: 120,
                    ),
                    LeadActivities_screen_card(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivities_screen_card(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivities_screen_card(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivities_screen_card(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivities_screen_card(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                  ],
                ),
              ),
            ),

            //==================================================================
            //CUSTOM APP BAR

            CustomAppBar(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_sharp,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                 AppTextStyle2.w600_universal(fontSize: 18, color: AppColors.blackColor, context, AppStrings.LeadActivity_leadList),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.filter_list_outlined,
                        size: 15,
                        color: AppColors.lightGrey,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      AppTextStyle2.w400_13(color: AppColors.lightGrey, context, AppStrings.LeadList_Filter),
                      const SizedBox(
                        width: 13,
                      ),
                     AppTextStyle2.w400_13(color: AppColors.blackColor, context, AppStrings.LeadActivity_details),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
