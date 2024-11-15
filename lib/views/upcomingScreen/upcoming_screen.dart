import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
import 'package:websuites/views/upcomingScreen/widgets/upcomingScreenCard/upcoming_screen_card.dart';
import '../../Responsive/Custom_Drawer.dart';

import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../resources/imageStrings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../utils/responsive/bodies/Responsive.dart';
import '../../viewModels/saveToken/save_token.dart';


class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
 final ScreenController _screenController = Get.put(ScreenController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
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
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // scaffoldKey: _globalKey,
        // bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(
            onPressed: () {},
            imageIcon: IconStrings.navSearch3,
            backgroundColor: AllColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _globalKey,
        backgroundColor: AllColors.whiteColor,
        // drawer: CustomDrawer(
        //   selectedIndex: 0, // Customize as needed
        //   onItemSelected: (index) {
        //     // Handle item selection
        //   },
        //   isCollapsed: false,
        //   onCollapseToggle: () {
        //     // Handle drawer collapse/expand
        //   },
        //   isTabletOrDesktop: screenWidth >= 500, userName: '',
        // ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _globalKey.currentState?.openDrawer();
                            },
                            child: Icon(
                              Icons.menu_sharp,
                              size: 25,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Sunil !',
                              style: TextStyle(
                                color: AllColors.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'May 14, 2024, 12:45 PM',
                              style: TextStyle(
                                color: AllColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: Get.height / 20,
                          width: Get.width / 11,
                          decoration: BoxDecoration(
                            color: AllColors.lighterPurple,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            ImageStrings.welcomeCompanyLogo,
                            scale: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height / 34,
                          width: Get.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AllColors.mediumPurple,
                          ),
                          child: Center(
                              child: TextStyles.w400_14(
                                  color: AllColors.whiteColor,
                                  context,
                                  Strings.upcoming)),
                        ),
                        Container(
                          height: Get.height / 34,
                          width: Get.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AllColors.textField2,
                          ),
                          child: Center(
                            child: TextStyles.w400_14(
                                color: AllColors.blackColor,
                                context,
                                Strings.inProgress),
                          ),
                        ),
                        Container(
                          height: Get.height / 34,
                          width: Get.width / 3.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AllColors.textField2,
                          ),
                          child: Center(
                            child: TextStyles.w400_14(
                                color: AllColors.blackColor,
                                context,
                                Strings.upcomingCompleted),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          size: 20,
                          color: AllColors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextStyles.w500_14_Black(
                            context, Strings.upcomingInCapital),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.filter_list_outlined,
                              color: AllColors.lightGrey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextStyles.w400_14(
                                color: AllColors.lightGrey,
                                context,
                                Strings.filter),
                            SizedBox(
                              width: 10,
                            ),
                            TextStyles.w400_13(
                                color: AllColors.blackColor,
                                context,
                                Strings.lastWeek),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    const UpcomingScreenCard(
                        title: 'SEO - Content Writing',
                        companyName:
                            'Ayurvedic PCD Franchise Company in Nagaland'),
                    const UpcomingScreenCard(
                        title: 'SEO - Content Writing',
                        companyName:
                            'Ayurvedic PCD Franchise Company in Nagaland'),
                    const UpcomingScreenCard(
                        title: 'SEO - Content Writing',
                        companyName:
                            'Ayurvedic PCD Franchise Company in Nagaland'),
                    const UpcomingScreenCard(
                        title: 'SEO - Content Writing',
                        companyName:
                            'Ayurvedic PCD Franchise Company in Nagaland'),
                    const UpcomingScreenCard(
                        title: 'SEO - Content Writing',
                        companyName:
                            'Ayurvedic PCD Franchise Company in Nagaland'),
                  ],
                ),
              ),
            ),
            Container(
              height: Get.height / 16,
              width: Get.width / 1,
              decoration: BoxDecoration(
                color: AllColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.10),
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              right: 16,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  elevation: 2,
                  shape: CircleBorder(),
                  backgroundColor: AllColors.mediumPurple,
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: AllColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
