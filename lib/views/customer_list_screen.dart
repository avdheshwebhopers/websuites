import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';


import '../Resources/all_strings/all_strings.dart';
import '../Resources/all_textStyles/all_textStyles.dart';


import '../utils/components/app_colors.dart';
import '../utils/components/cards/customer_list_screen_card/customer_list_screen_card.dart';
import '../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../view_models/controllers/save_token/save_token.dart';

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
                      height: 130,
                    ),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
                    CustomerListScreenCard(title: 'Harish Sharma'),
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
                  AllTextStyles.w700_16(color: AllColors.blackColor, context, AllStrings.CustomerList_Customer),
                  const Spacer(),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 13,
                    decoration: BoxDecoration(
                      color: AllColors.mediumPurple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.upload,
                      size: 15,
                      color: AllColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                        color: AllColors.mediumPurple,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 16,
                          color: AllColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                       AllTextStyles.w400_12(color: AllColors.whiteColor, context, AllStrings.CustomerList_customer2),
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
