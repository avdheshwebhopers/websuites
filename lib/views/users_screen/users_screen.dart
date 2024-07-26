import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/resources/icon_strings/icon_strings.dart';
import 'package:websuites/utils/components/widgets/app_bar/custom_appBar.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/components/widgets/nav_bar/custom_navBar.dart';
import 'package:websuites/utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import 'package:websuites/view_models/save_token/save_token.dart';
import 'package:websuites/views/users_screen/widgets/users_card.dart';
import '../../Resources/all_fonts/all_fonts.dart';
import '../../Utils/app_colors/app_colors.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

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
        userName = first_name!;
        userEmail = email!;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(onPressed: (){},
            imageIcon: IconStrings.navSearch3, backgroundColor: AllColors.mediumPurple),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        backgroundColor: AllColors.whiteColor,
        drawer: CustomDrawer(
            userName: userName, phoneNumber: userEmail, version: '1.0.12'),
        body: Stack(
          children: [
            const SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      UsersScreenCard(
                          title: 'Dinesh Kumar', subtitle: 'Development TL'),
                      UsersScreenCard(
                          title: 'Dinesh Kumar', subtitle: 'Development TL'),
                      UsersScreenCard(
                          title: 'Dinesh Kumar', subtitle: 'Development TL'),
                      UsersScreenCard(
                          title: 'Dinesh Kumar', subtitle: 'Development TL'),
                      UsersScreenCard(
                          title: 'Dinesh Kumar', subtitle: 'Development TL'),
                    ],
                  ),
                ),
              ),
            ),
            //================================================================
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
                    'Users',
                    style: TextStyle(
                        color: AllColors.blackColor,
                        fontFamily: AllFonts.nunitoRegular,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 15,
                    color: AllColors.mediumPurple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: AllColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: AllFonts.nunitoRegular
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
