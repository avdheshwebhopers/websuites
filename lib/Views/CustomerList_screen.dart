import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Cards/CustomerListScreen_Card/customerListScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/app_strings/app_strings.dart';
import '../Resources/app_textstyles/app_textstyle2.dart';
import '../Resources/components/app_colors.dart';

class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState(){
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
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
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
                      child: const Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AppTextStyle2.w700_16(color: AppColors.blackColor, context, AppStrings.CustomerList_Customer),
                  const Spacer(),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 13,
                    decoration: BoxDecoration(
                      color: AppColors.mediumPurple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.upload,
                      size: 15,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                        color: AppColors.mediumPurple,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 16,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                       AppTextStyle2.w400_12(color: AppColors.whiteColor, context, AppStrings.CustomerList_customer2),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
