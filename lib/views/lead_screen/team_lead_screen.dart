import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';

import '../../Resources/all_strings/all_strings.dart';
import '../../Resources/all_textStyles/all_textStyles.dart';

import '../../utils/components/app_colors.dart';
import '../../utils/components/cards/team_lead_screen_card/team_lead_screen_card.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../view_models/controllers/save_token/save_token.dart';

class TeamLeadScreen extends StatefulWidget {
  const TeamLeadScreen({super.key});

  @override
  State<TeamLeadScreen> createState() => _TeamLeadScreenState();
}

class _TeamLeadScreenState extends State<TeamLeadScreen> {
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
      backgroundColor: AllColors.whiteColor,
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
                    height: 130,
                  ),
                  TeamLeadScreenCard(
                      title: 'Shakshi Shakya',
                      email: 'shakshi@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Rahul Mahajan',
                      email: 'rahul@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Sherpal Singh',
                      email: 'sherpalbairagi@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Pushpek Kumar',
                      email: 'pushpek@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Rohil Pathak',
                      email: 'rohila99@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Gucci mane',
                      email: 'guccigagamane@gmail.com'),
                  TeamLeadScreenCard(
                      title: 'Great Khali',
                      email: 'khalibali999@gmail.com'),
                ],
              ),
            ),
          ),

          //================================================================
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:
                  AllTextStyles.w700_17(color: AllColors.blackColor, context, AllStrings.TeamLead_myTeamLead),
                ),
                const Spacer(),
                Icon(
                  Icons.filter_list_outlined,
                  size: 16,
                  color: AllColors.lightGrey,
                ),
                const SizedBox(
                  width: 5,
                ),
                AllTextStyles.w400_14(color: AllColors.lightGrey, context, AllStrings.TeamLead_filter),
              ],
            ),
          )
        ],
      ),
    );
  }
}
