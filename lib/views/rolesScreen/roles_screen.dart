import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Responsive/Custom_Drawer.dart';
import 'package:websuites/data/models/responseModels/roles/roles_response_model.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/views/rolesScreen/widgets/rolesScreenCard/roles_screen_card.dart';
import '../../viewModels/roles/roles_viewModel.dart';
import '../../viewModels/saveToken/save_token.dart';
import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../utils/responsive/bodies/Responsive.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewModels/roles/roles_viewModel.dart';
import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';

import '../homeScreen/home_screen.dart';
import 'widgets/rolesScreenCard/roles_screen_card.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  final ScreenController _screenController = Get.put(ScreenController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final RolesViewModel rolesViewModel = Get.put(RolesViewModel());

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
    rolesViewModel.rolesListApi(context); // Fetch roles when the screen initializes
  }

  Future<void> fetchUserData() async {
    try {
      // Fetch user data from preferences
      final LoginResponseModel response = await SaveUserData().getUser();
      setState(() {
        userName = response.user?.firstName ?? 'No Name';
        userEmail = response.user?.email ?? 'No Email';
      });
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() {
        if (rolesViewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (rolesViewModel.roles.isEmpty) {
          return const Center(child: Text('No roles available'));
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: rolesViewModel.roles.map((role) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to RoleDetailsScreen with role data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoleDetailsScreen(role: role),
                        ),
                      );
                    },
                    child: RolesScreenCard(
                      title: role.name ?? 'No Title',
                      description: role.description ?? 'No Description',
                      members: role.users.length.toString(),
                      firstLetters: role.users.map((user) {
                        return user.firstName?.substring(0, 1) ?? 'N';
                      }).toList(),
                      count: '+${role.users.length}',
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      }),
    );
  }
}



class RoleDetailsScreen extends StatelessWidget {
  final RolesResponseModel role;

  const RoleDetailsScreen({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTabletOrDesktop = MediaQuery.of(context).size.width >= 500;
    final controller = Get.put(HomeScreenController());

    return Scaffold(
        drawer: !isTabletOrDesktop
            ? Drawer(
          child: Obx(() => CustomDrawer(
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: (index) => controller.onDrawerItemTapped(index, context),
            isCollapsed: controller.isCollapsed.value,
            onCollapseToggle: controller.toggleDrawerCollapse,
            isTabletOrDesktop: isTabletOrDesktop,
          )),
        )
            : null,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(role.name ?? 'Role Details'),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child:
            Column(
              children: [
                // Display details for each user in the role
                ...role.users.asMap().entries.map((entry) {
                  final int index = entry.key; // Index of the current user
                  final user = entry.value;

                  // Define your custom color logic here based on index
                  Color backgroundColor;
                  Color textColor;

                  if (index % 4 == 0) {
                    backgroundColor = AllColors.lightRed;
                    textColor = AllColors.vividRed;
                  } else if (index % 4 == 1) {
                    backgroundColor = AllColors.lighterPurple;
                    textColor = AllColors.mediumPurple;
                  } else if (index % 4 == 2) {
                    backgroundColor = AllColors.lightBlue;
                    textColor = AllColors.vividBlue;
                  } else {
                    backgroundColor = AllColors.lightYellow;
                    textColor = AllColors.darkYellow;
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Increased CircleAvatar size
                        Container(
                          height: screenHeight / 16, // Increased height for bigger circle
                          width: screenWidth / 9, // Increased width for bigger circle
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              user.firstName?.substring(0, 1).toUpperCase() ?? 'N',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16, // Increased font size to match the bigger circle
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.firstName ?? ''} ${user.lastName ?? ''}".trim().isNotEmpty
                                  ? "${user.firstName ?? ''} ${user.lastName ?? ''}".trim()
                                  : "No Name",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              role.name ?? 'No Role Name',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            )
          ),
        )


    );
  }
}



