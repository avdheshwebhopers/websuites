import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Cards/TrashLeadScreen_Card/trashLeadScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/app_strings/app_strings.dart';
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
        drawer: AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.10'),
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
            //CUSTOM APP BAR


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
                  AppTextStyle.TrashLeads_TrashLeads(context, AppStrings.TrashLead_trashLeads),

                  Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 14,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                AppTextStyle.TrashLeads_Filter(context, AppStrings.TrashLead_Filter),
                ],
              ),
            ),

          ],
        )
    );
  }
}
