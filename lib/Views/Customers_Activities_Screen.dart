import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Cards/CutomerActivitiesScreen_card/cutomer_activities_screen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';
import '../Resources/app_strings/app_strings.dart';
import '../Resources/app_textstyles/app_textstyle2.dart';
import '../Resources/components/app_colors.dart';

class CustomersActivitiesScreen extends StatefulWidget {
  const CustomersActivitiesScreen({super.key});

  @override
  State<CustomersActivitiesScreen> createState() =>
      _CustomersActivitiesScreenState();
}

class _CustomersActivitiesScreenState extends State<CustomersActivitiesScreen> {
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
        backgroundColor: AppColors.whiteColor,
        key: _globalKey,
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
                    CustomerActvities_Card(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActvities_Card(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActvities_Card(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActvities_Card(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
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
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                 AppTextStyle2.w700_17(color: AppColors.blackColor, context, AppStrings.CustomerActivities_customerActivity),
                  const Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 17,
                    color: AppColors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AppTextStyle2.w400_14(color: AppColors.lightGrey, context, AppStrings.CustomerActivities_filter),
                  const SizedBox(
                    width: 10,
                  ),
                  AppTextStyle2.w400_14(color: AppColors.blackColor, context, AppStrings.CustomerActivities_details),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
