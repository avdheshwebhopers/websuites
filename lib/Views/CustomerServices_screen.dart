import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/AllServices_screen_card/allServices_screen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/CustomTextStyle/CustomTextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
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
        userName = first_name;
        userEmail = email;
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
                      height: 130,
                    ),
                    AllServicesScreenCard(
                        title: 'Events Pharmaceuticals Pvt ltd'),
                    AllServicesScreenCard(
                        title: 'Events Pharmaceuticals Pvt ltd'),
                    AllServicesScreenCard(
                        title: 'Events Pharmaceuticals Pvt ltd'),
                    AllServicesScreenCard(
                        title: 'Events Pharmaceuticals Pvt ltd'),
                    AllServicesScreenCard(
                        title: 'Events Pharmaceuticals Pvt ltd'),
                  ],
                ),
              ),
            ),

            //============================================================
            // CUSTOM APP BAR

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
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'All Services',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 17),
                  ),

                  const Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 15,
                    color: AppColors.lightGrey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        )

    );
  }
}
