import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
import 'package:websuites/views/customerScreens/customerList/widgets/customerListCard/list_screen_card.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../viewModels/saveToken/save_token.dart';

class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return ResponsiveScaffold(
        scaffoldKey: _scaffoldKey,
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
                      height: 135,
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
                  if (Get.width < 500)
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
                  TextStyles.w700_16(
                      color: AllColors.blackColor, context, Strings.customers),
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
                        TextStyles.w400_12(
                            color: AllColors.whiteColor,
                            context,
                            Strings.customer),
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
