import 'package:flutter/material.dart';


import '../../Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_icons/all_Icons.dart';
import '../../Resources/all_strings/all_strings.dart';
import '../../Resources/all_textStyles/all_textStyles.dart';

import '../../utils/components/app_colors.dart';
import '../../utils/components/cards/leadList_screen_card/leadlist_screen_card.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../utils/components/custom_widgets/custom_navBar/custom_navBar.dart';
import '../../utils/components/custom_widgets/floating_action_button/floating_action_button.dart';
import '../../view_models/controllers/save_token/save_token.dart';

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
            imageIcon: AllIcons.navSearch3,
            backgroundColor: AllColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _globalKey,
        backgroundColor: AllColors.whiteColor,


        drawer: CustomDrawer(
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
                    LeadListScreenCard(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),
                    LeadListScreenCard(
                        title: 'Lokesh Kumar', companyName: 'Biophar Pharma'),
                    LeadListScreenCard(
                        title: 'Rahul Choudhary', companyName: 'Tata Pharma'),
                    LeadListScreenCard(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),
                    LeadListScreenCard(
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
                  AllTextStyles.w700_17(color: AllColors.blackColor,
                      context, AllStrings.LeadList_LeadList),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.filter_list_outlined,
                          color: AllColors.lightGrey, size: 17),
                      SizedBox(
                        width: 5,
                      ),
                      AllTextStyles.w400_14(color: AllColors.blackColor,
                          context, AllStrings.LeadList_Filter),
                      SizedBox(
                        width: 10,
                      ),
                      AllTextStyles.w400_13(color: AllColors.blackColor,
                          context, AllStrings.LeadList_Lastweek),
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
