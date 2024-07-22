import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_icons/all_Icons.dart';
import '../../Resources/all_strings/all_strings.dart';
import '../../Resources/all_textStyles/all_textStyles.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../utils/components/custom_widgets/custom_navBar/custom_navBar.dart';
import '../../utils/components/custom_widgets/custom_navBar/floating_action_button/floating_action_button.dart';
import '../../view_models/save_token/save_token.dart';
import 'widgets/lead_activities_screen_card/lead_activities_screen_card.dart';

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
        backgroundColor: AllColors.whiteColor,
        bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
            imageIcon: AllIcons.navSearch3,
            backgroundColor: AllColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        drawer:
        CustomDrawer(
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
                    LeadActivitiesScreenCard(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivitiesScreenCard(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivitiesScreenCard(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivitiesScreenCard(
                        title: 'Dr. Nitasha Gupta',
                        companyName: 'Nitasha Gupta (Infertility Specialist)'),
                    LeadActivitiesScreenCard(
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
                    onTap: (){
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
                 AllTextStyles.w600_universal(fontSize: 18, color: AllColors.blackColor, context, AllStrings.LeadActivity_leadList),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.filter_list_outlined,
                        size: 15,
                        color: AllColors.lightGrey,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      AllTextStyles.w400_13(color: AllColors.lightGrey, context, AllStrings.LeadList_Filter),
                      const SizedBox(
                        width: 13,
                      ),
                     AllTextStyles.w400_13(color: AllColors.blackColor, context, AllStrings.LeadActivity_details),
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