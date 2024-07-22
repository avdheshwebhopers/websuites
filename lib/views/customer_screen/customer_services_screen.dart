import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_fonts/all_fonts.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../view_models/save_token/save_token.dart';
import 'widgets /customer_services_screen_card/customer_services_screen_card.dart';

class CustomerServicesScreen extends StatefulWidget {
  const CustomerServicesScreen({super.key});

  @override
  State<CustomerServicesScreen> createState() => _CustomerServicesScreenState();
}

class _CustomerServicesScreenState extends State<CustomerServicesScreen> {
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
                        color: AllColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 17),
                  ),

                  const Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 15,
                    color: AllColors.lightGrey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: AllColors.lightGrey,
                        fontSize: 15,
                        fontFamily: AllFonts.nunitoRegular,
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