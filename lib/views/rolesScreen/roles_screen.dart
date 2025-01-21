import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websuites/data/models/responseModels/roles/roles_response_model.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/rolesScreen/role_details/RoleDetailsScreen.dart';
import '../../data/models/requestModels/role/add_role/UserAddRoleRequestModel.dart';

import '../../data/models/responseModels/customers/orderProducts/services/order_product_services.dart';
import '../../data/models/responseModels/roles/roles_response_model.dart';
import '../../data/models/responseModels/roles/roles_response_model.dart';
import '../../data/models/responseModels/userList/list/add_role/UserAddRoleResponseModel.dart';
import '../../utils/button/CustomButton.dart';
import '../../utils/fontfamily/FontFamily.dart';

import '../../viewModels/saveToken/save_token.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../utils/appColors/app_colors.dart';

import '../../viewModels/userlistViewModel/roles/add_role/UserAddRoleViewModel.dart';
import '../../viewModels/userlistViewModel/roles/roles_viewModel.dart';
import '../usersScreen/list/UserUpdateRoleScreen.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final RolesViewModel rolesViewModel = Get.put(RolesViewModel());

  final UserAddRoleViewModel userAddRoleViewModel =
      Get.put(UserAddRoleViewModel());

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
    rolesViewModel.fetchRoles(context);
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      // drawer: CustomDrawer(
      //   userName: '$userName',
      //   phoneNumber: '$userEmail',
      //   version: '1.0.12',
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Role',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: FontFamily.sfPro),
            ),
            const Spacer(),
            CustomButton(
              width: 120,
              height: 22,
              borderRadius: 54,
              onPressed: () {
                UserAddRoleResponseModel addRole = UserAddRoleResponseModel(
                  id: null,
                  name: '',
                  description: '',
                  isDefault: true,
                );

                _showDialog(
                    addRole); // Open the dialog to add/edit a department
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AllColors.whiteColor, size: 18),
                  const SizedBox(width: 5),
                  const Text(
                    'Add New Role',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.sfPro,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
                List<String> firstLetters = role.users
                    .map((user) => user.firstName?.substring(0, 1) ?? 'N')
                    .toList();

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
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: screenHeight / 6,
                    // Adjust height based on screen size
                    width: screenWidth * 0.95,
                    // Use a percentage of the screen width
                    decoration: BoxDecoration(
                      color: AllColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AllColors.blackColor.withOpacity(0.06),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  role.name ?? 'No Title',
                                  style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserUpdateRolescreen(
                                        role: role, // You can pass RolesResponseModel directly now
                                      ),
                                    ),
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/edit.png',
                                  height: 17,
                                  width: 16,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'DESCRIPTION - ',
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  role.description ?? 'No Description',
                                  style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(thickness: 0.4),
                          Row(
                            children: [
                              Text(
                                'MEMBERS - ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AllColors.blackColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  role.users.length.toString(),
                                  style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                height: screenHeight / 30,
                                width: screenWidth / 3,
                                child: Stack(
                                  children: [
                                    for (int i = 0;
                                        i < firstLetters.take(4).length;
                                        i++)
                                      Positioned(
                                        right: (i * 26.0),
                                        child: Container(
                                          height: screenHeight / 30,
                                          width: screenWidth / 12,
                                          decoration: BoxDecoration(
                                            color: i % 4 == 0
                                                ? AllColors.lightRed
                                                : i % 4 == 1
                                                    ? AllColors.lighterPurple
                                                    : i % 4 == 2
                                                        ? AllColors.lightBlue
                                                        : AllColors.lightYellow,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              firstLetters[i],
                                              style: TextStyle(
                                                  color: i % 4 == 0
                                                      ? AllColors.vividRed
                                                      : i % 4 == 1
                                                          ? AllColors
                                                              .mediumPurple
                                                          : i % 4 == 2
                                                              ? AllColors
                                                                  .vividBlue
                                                              : AllColors
                                                                  .darkYellow,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to members list if needed
                                },
                                child: Text(
                                  '+${role.users.length}',
                                  style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
      }),
    );
  }

  // Show dialog method
  void _showDialog(UserAddRoleResponseModel addRole) {
    // Fixed method signature
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    // Pre-fill controllers if editing existing role
    if (addRole.id != null) {
      nameController.text = addRole.name ?? '';
      descriptionController.text = addRole.description ?? '';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Add New Role',
              style: TextStyle(
                  fontFamily: FontFamily.sfPro,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Role Name'),
              SizedBox(height: 8),
              CreateNewLeadScreenCard(
                hintText: 'Enter role name',
                controller: nameController,
              ),
              SizedBox(height: 8),
              Text('Role Description'),
              SizedBox(height: 8),
              CreateNewLeadScreenCard(
                hintText: 'Enter role description',
                controller: descriptionController,
              ),
              SizedBox(height: 15),
              CustomButton(
                width: double.infinity,
                height: 35,
                borderRadius: 8,
                onPressed: () async {
                  UserAddRoleRequestModel newRole = UserAddRoleRequestModel(
                    name: nameController.text,
                    description: descriptionController.text,
                  );

                  // Use the correct ViewModel method for roles
                  await userAddRoleViewModel.addRole(context, newRole);

                  // Refresh the roles list
                  await rolesViewModel.fetchRoles(context);

                  Navigator.pop(context);
                },
                child:
                    Text('Save', style: TextStyle(color: AllColors.whiteColor)),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
