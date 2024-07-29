import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/login.dart';
import 'package:websuites/views/customer_screen/customer_activities/widgets/customer_activities_screen_card/cutomer_activities_screen_card.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/text_styles/text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../view_models/save_token/save_token.dart';

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
        backgroundColor: AllColors.whiteColor,
        key: _globalKey,
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
                      height: 120,
                    ),
                    CustomerActivitiesScreenCard(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActivitiesScreenCard(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActivitiesScreenCard(
                        title: 'Ms. Komal Sharma',
                        subtitle: 'Medisys biotech Private Limited'),
                    CustomerActivitiesScreenCard(
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
                 TextStyles.w700_17(color: AllColors.blackColor, context, Strings.CustomerActivities_customerActivity),
                  const Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 17,
                    color: AllColors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TextStyles.w400_14(color: AllColors.lightGrey, context, Strings.CustomerActivities_filter),
                  const SizedBox(
                    width: 10,
                  ),
                  TextStyles.w400_14(color: AllColors.blackColor, context, Strings.CustomerActivities_details),
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
