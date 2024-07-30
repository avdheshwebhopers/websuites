import 'package:flutter/material.dart';
import 'package:websuites/views/lead_screen/lead_list/widgets/leadList_screen_card/leadlist_screen_card.dart';
import '../../../data/models/responseModels/login.dart';
import '../../../resources/icon_strings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/text_styles/text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/nav_bar/custom_navBar.dart';
import '../../../utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import '../../../view_models/save_token/save_token.dart';

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
            imageIcon: IconStrings.navSearch3,
            backgroundColor: AllColors.mediumPurple
        ),
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
                      height: 125,
                    ),
                    LeadListScreenCard(title: 'Sanjay Kumar', companyName: 'Prelims Pharma Private Limited'),
                    LeadListScreenCard(title: 'Lokesh Kumar', companyName: 'Biophar Pharma'),
                    LeadListScreenCard(title: 'Rahul Choudhary', companyName: 'Tata Pharma'),
                    LeadListScreenCard(title: 'Sanjay Kumar', companyName: 'Prelims Pharma Private Limited'),
                    LeadListScreenCard(title: 'Mukesh', companyName: 'Prelims Pharma Private Limited'),
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
                      const Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextStyles.w700_17(color: AllColors.blackColor,
                      context, Strings.leadList),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.filter_list_outlined,
                          color: AllColors.lightGrey, size: 17),
                      const SizedBox(
                        width: 5,
                      ),
                      TextStyles.w400_14(color: AllColors.blackColor,
                          context, Strings.filter),
                      const SizedBox(
                        width: 10,
                      ),
                      TextStyles.w400_13(color: AllColors.blackColor,
                          context, Strings.lastWeek),
                      const Icon(
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
