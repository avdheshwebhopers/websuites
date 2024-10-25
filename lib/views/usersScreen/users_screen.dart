import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
import 'package:websuites/views/usersScreen/widgets/users_card.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../viewModels/saveToken/save_token.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return ResponsiveScaffold(

      scaffoldKey: _scaffoldKey,
        key: _globalKey,
        bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
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
                  if(Get.width<500)

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
                          
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
