import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/app_strings/app_strings.dart';
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
                      height: 110,
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
                 AppTextStyle.LeadActivity_LeadList(context, AppStrings.LeadActivity_leadList),
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
                      AppTextStyle.LeadActivity_Filter(context, AppStrings.LeadList_Filter),
                      const SizedBox(
                        width: 13,
                      ),
                     AppTextStyle.LeadActivity_Details(context, AppStrings.LeadActivity_details),
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
