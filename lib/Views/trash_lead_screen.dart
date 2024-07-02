import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/TrashLeadScreen_Card/trashLeadScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class TrashLeadScreen extends StatefulWidget {
  const TrashLeadScreen({super.key});

  @override
  State<TrashLeadScreen> createState() => _TrashLeadScreenState();
}

class _TrashLeadScreenState extends State<TrashLeadScreen> {
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
        drawer: Container(
          height: Get.height * 1,
          width: Get.width / 1.8,
          color: AppColors.whiteColor,
          child: AppDrawer(
              userName: '$userName',
              phoneNumber: '$userEmail',
              version: '1.0.10'),
        ),
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
                    TrashLeadScreen_Card(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreen_Card(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreen_Card(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreen_Card(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreen_Card(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                  ],
                ),
              ),
            ),

            //====================================================================
            //AppBar Below


            CustomAppBar(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Trash Leads',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 17),
                  ),
                  Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 14,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 14,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),

          ],
        ));
  }
}
