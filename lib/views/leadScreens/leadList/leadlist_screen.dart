import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/leadScreens/leadList/widgets/leadListCard/lead_list_card.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../../viewModels/saveToken/save_token.dart';
import 'diliougeBoxFilter/filter.dart';

class LeadListScreen extends StatefulWidget {
  const LeadListScreen({super.key});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  // Controllers for filter text fields
  List<TextEditingController> filterControllers = List.generate(
    10,
        (index) => TextEditingController(),
  );

  String? userName = '';
  String? userEmail = "";

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all text controllers
    for (var controller in filterControllers) {
      controller.dispose();
    }
    super.dispose();
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

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FilterDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveScaffold(
      scaffoldKey: _scaffoldKey,
      key: _globalKey,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
          onPressed: () {},
          imageIcon: IconStrings.navSearch3,
          backgroundColor: AllColors.mediumPurple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AllColors.whiteColor,
      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: screenWidth > 900 ? 20 : 80),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth > 900 ? 2 : 1,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      List<Map<String, String>> leadData = [
                        {'title': 'Sanjay Kumar', 'companyName': 'Prelims Pharma Private Limited'},
                        {'title': 'Lokesh Kumar', 'companyName': 'Biophar Pharma'},
                        {'title': 'Rahul Choudhary', 'companyName': 'Tata Pharma'},
                        {'title': 'Sanjay Kumar', 'companyName': 'Prelims Pharma Private Limited'},
                        {'title': 'Mukesh', 'companyName': 'Prelims Pharma Private Limited'},
                        {'title': 'Mukesh', 'companyName': 'Prelims Pharma Private Limited'},
                        {'title': 'Mukesh', 'companyName': 'Prelims Pharma Private Limited'},
                        {'title': 'Sunil', 'companyName': 'Prelims Pharma Private Limited'},
                      ];

                      return LeadListScreenCard(
                        title: leadData[index]['title']!,
                        companyName: leadData[index]['companyName']!,
                      );
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          CustomAppBar(
            child: Row(
              children: [
                if(Get.width < 500)
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_sharp,
                      size: 25,
                    ),
                  ),
                const SizedBox(width: 10),
                TextStyles.w700_17(
                    color: AllColors.blackColor,
                    context,
                    Strings.leadList
                ),
                const Spacer(),
                Row(
                  children: [
                    // And in your InkWell, change to:
                    InkWell(
                      onTap: () => _showFilterDialog(), // Remove the parentheses from _showFilterDialog
                      child: Row(
                        children: [
                          Icon(
                              Icons.filter_list_outlined,
                              color: AllColors.lightGrey,
                              size: 17
                          ),
                          const SizedBox(width: 5),
                          TextStyles.w400_14(
                              color: AllColors.blackColor,
                              context,
                              Strings.filter
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextStyles.w400_13(
                        color: AllColors.blackColor,
                        context,
                        Strings.lastWeek
                    ),
                    const Icon(Icons.arrow_drop_down, size: 34),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}