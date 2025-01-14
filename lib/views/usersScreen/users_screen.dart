import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

import '../../Utils/utils.dart';
import '../../data/models/requestModels/userlist/list/UserProfileScreen.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../resources/strings/strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/button/CustomButton.dart';

import '../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';
import '../../viewModels/saveToken/save_token.dart';
import '../../viewModels/userlistViewModel/roles/roles_viewModel.dart';
import '../../viewModels/userlistViewModel/status/UserStatusViewModel.dart';
import '../../viewModels/userlistViewModel/user_update/UserUpdateViewModel.dart';
import '../../viewModels/userlistViewModel/userlist_viewModel.dart';
import 'package:websuites/data/models/responseModels/userList/list/UserListResponseModels.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with SingleTickerProviderStateMixin {
  final AssignedLeadToViewModel _assignedLeadToController =
  Get.put(AssignedLeadToViewModel());

  final UserUpdateViewModel userUpdateViewModel = Get.put(UserUpdateViewModel());
  String? selectedDepartment; // Add this line to hold the selected department


  final UserStatusViewModel userStatusViewModel = Get.put(UserStatusViewModel());
  bool isSwitched = true;
  bool isListView = true;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();
  final TransformationController _controller = TransformationController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  double _scale = 1.0;
  final Map<String, bool> userSwitchStates = {};
  final UserListViewModel userListViewModel = Get.put(UserListViewModel());
  final RolesViewModel _rolesViewModel = Get.put(RolesViewModel()); // Add this line
String ? selectedRole;

  @override
  void initState() {
    super.initState();
    _assignedLeadToController.fetchAssignedLeads(context);
    _rolesViewModel.fetchRoles(context);
    userListViewModel.userListApi().then((_) {
      userListViewModel.userList.forEach((user) {
        userSwitchStates[user.id.toString()] = user.status ?? false;
      });
      setState(() {});
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users',
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Icon(Icons.search, color: AllColors.figmaGrey)
          ],
        ),
      ),
      body: Obx(() {
        if (userListViewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (userListViewModel.userList.isEmpty) {
          return Center(child: Text('No users found'));
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  width: 140,
                  height: 22,
                  borderRadius: 54,
                  backgroundColor: isListView ? AllColors.mediumPurple : Colors.grey,
                  onPressed: () {
                    setState(() {
                      isListView = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.list_alt, color: AllColors.whiteColor, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'List',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro,
                          color: AllColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                CustomButton(
                  width: 140,
                  height: 22,
                  borderRadius: 54,
                  backgroundColor: !isListView ? AllColors.mediumPurple : Colors.grey,
                  onPressed: () {
                    setState(() {
                      isListView = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_graph, color: AllColors.whiteColor, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'Graph',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro,
                          color: AllColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: isListView
                  ? ListView.builder(
                itemCount: userListViewModel.userList.length,
                itemBuilder: (context, index) {
                  Item user = userListViewModel.userList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.firstName ?? ''} ${user.lastName ?? ''}',
                            style: TextStyle(
                              color: AllColors.blackColor,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user.email ?? 'N/A',
                                style: TextStyle(
                                  color: AllColors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: Get.height / 45,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: AllColors.lighterOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    user.roleList.first.name ?? 'N/A',
                                    style: TextStyle(
                                      color: AllColors.vividOrange,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.mediumPurple),
                              Text(
                                formatDateToDDMMYYYY(user.createdAt.toString() ?? 'N/A'),
                                style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.group_sharp, color: AllColors.vividBlue, size: 17),
                              Text(
                                '${user.parent?.firstName ?? ''} ${user.parent?.lastName ?? ''}'.trim().isEmpty
                                    ? 'N/A'
                                    : '${user.parent?.firstName ?? ''} ${user.parent?.lastName ?? ''}',
                                style: TextStyle(
                                  color: AllColors.vividBlue,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.call_rounded, size: 15, color: AllColors.lightGrey),
                              Text(
                                user.mobile != null ? '+91-${user.mobile}' : 'N/A',
                                style: TextStyle(
                                  color: AllColors.lightGrey,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'ACTIONS - ',
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showDialogBox(context, user); // Pass the selected user here
                                },
                                child: Icon(Icons.edit_calendar, size: 15),
                              ),
                              Icon(Icons.shield_moon_outlined, size: 15),
                              InkWell(

                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen(),));
                                  },
                                  child: Icon(Icons.remove_red_eye, size: 15)),
                            ],
                          ),
                          const Divider(thickness: 0.4),
                          Row(
                            children: [
                              Text(
                                'DEPARTMENT',
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.arrow_right_alt, size: 20),
                              Text(
                                user.department?.name ?? 'N/A',
                                style: TextStyle(
                                  color: AllColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: Get.height / 40,
                                width: Get.width / 12,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: CupertinoSwitch(
                                    value: userSwitchStates[user.id.toString()] ?? false,
                                    onChanged: (value) async {
                                      setState(() {
                                        userSwitchStates[user.id.toString()] = value;
                                      });

                                      try {
                                        bool updatedStatus = await userStatusViewModel.userStatusUpdate(
                                          user.id.toString(),
                                          value,
                                        );

                                        setState(() {
                                          userSwitchStates[user.id.toString()] = updatedStatus;
                                        });
                                      } catch (error) {
                                        setState(() {
                                          userSwitchStates[user.id.toString()] = !value;
                                        });

                                        Utils.snackbarFailed('Failed to update user status');
                                      }
                                    },
                                    activeColor: AllColors.mediumPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InteractiveViewer(
                  transformationController: _controller,
                  boundaryMargin: const EdgeInsets.all(0),
                  minScale: 0.1,
                  maxScale: 2.0,
                  child: Center(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (userListViewModel.userList.isNotEmpty) ...[
                              OrgChartNode(
                                initials: userListViewModel.userList.firstWhere(
                                      (user) => user.parent == null,
                                ).firstName?.substring(0, 1) ?? 'N',
                                name: '${userListViewModel.userList.firstWhere(
                                      (user) => user.parent == null,
                                ).firstName ?? ''} ${userListViewModel.userList.firstWhere(
                                      (user) => user.parent == null,
                                ).lastName ?? ''}'.trim(),
                                role: userListViewModel.userList.firstWhere(
                                      (user) => user.parent == null,
                                ).roleList.first.name ?? '',
                                backgroundColor: AllColors.mediumPurple,
                                onDelete: () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Container(
                                  width: 0.5,
                                  height: 55,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 800,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 601,
                                      height: 0.5,
                                      color: Colors.black,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        (userListViewModel.userList.length - 1).clamp(0, 4),
                                            (index) => Container(
                                          width: 0.5,
                                          height: 50,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        userListViewModel.userList
                                            .where((user) => user.parent?.id == userListViewModel.userList.firstWhere(
                                              (user) => user.parent == null,
                                        ).id)
                                            .toList()
                                            .length,
                                            (index) {
                                          final user = userListViewModel.userList
                                              .where((user) => user.parent?.id == userListViewModel.userList.firstWhere(
                                                (user) => user.parent == null,
                                          ).id)
                                              .toList()[index];
                                          return OrgChartNode(
                                            initials: user.firstName?.substring(0, 1) ?? 'N',
                                            name: '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim(),
                                            role: user.roleList.first.name ?? '',
                                            backgroundColor: Colors.deepPurple,
                                            onDelete: () {},
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              Text('No users available'),
                            ],
                          ],
                        ),
                        Positioned(
                          top: 38,
                          left: 375,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_circle),
                            color: AllColors.vividRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: !isListView
          ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AllColors.mediumPurple,
            onPressed: () {
              setState(() {
                if (_scale < 2.0) {
                  _scale += 0.1;
                }
              });
              _controller.value = Matrix4.identity()..scale(_scale);
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AllColors.mediumPurple,
            onPressed: () {
              setState(() {
                if (_scale > 0.1) {
                  _scale -= 0.1;
                }
              });
              _controller.value = Matrix4.identity()..scale(_scale);
            },
            child: Icon(Icons.remove, color: AllColors.whiteColor),
          ),
        ],
      )
          : null,
    );
  }

  void _showDialogBox(BuildContext context, Item user) {
    // Create controllers for the text fields
    final TextEditingController firstNameController = TextEditingController(text: user.firstName);
    final TextEditingController lastNameController = TextEditingController(text: user.lastName);
    final TextEditingController emailController = TextEditingController(text: user.email);
    final TextEditingController mobileController = TextEditingController(text: user.mobile);
    final TextEditingController departmentController = TextEditingController(text: user.department?.name);
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Edit',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.sfPro,
            ),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('First Name *'),
                CreateNewLeadScreenCard(
                  hintText: 'Select First Name',
                  controller: firstNameController, // Use the controller
                  onChanged: (newValue) {
                    // Handle first name change
                  },
                 ),
                SizedBox(height: 10),
                Text('Last Name *'),
                CreateNewLeadScreenCard(
                  hintText: 'Select Last Name',
                  controller: lastNameController, // Use the controller
                  onChanged: (newValue) {
                    // Handle last name change
                  },
                ),
                SizedBox(height: 10),
                Text('Email *'),
                CreateNewLeadScreenCard(
                  hintText: 'Select Email',
                  controller: emailController, // Use the controller
                  onChanged: (newValue) {
                    // Handle email change
                  },
                ),
                SizedBox(height: 10),
                Text('Mobile *'),
                CreateNewLeadScreenCard(
                  hintText: 'Select Mobile',
                  controller: mobileController, // Use the controller
                  onChanged: (newValue) {
                    // Handle mobile change
                  },
                ),
                SizedBox(height: 10),
                Text('Department *'),
                CreateNewLeadScreenCard(
                  hintText: 'Select Department',
                  categories: [user.department?.name ?? 'N/A'], // Provide a default value if department name is null
                  onChanged: (newValue) {
                    // Handle department change
                  },
                ),
                SizedBox(height: 10),
                Text('Report to *'),
                Obx(() {
                  if (_assignedLeadToController.loading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    final formattedCategories = _assignedLeadToController.fullCategoriesRxList.map((category) {
                      final parts = category.split('\n')[0].split(' ');
                      if (parts.length >= 2) {
                        return '${parts[0]} ${parts[1]}';
                      }
                      return category;
                    }).toList();

                    return CreateNewLeadScreenCard(
                      hintText: _assignedLeadToController.selectedLeadName.value.isEmpty
                          ? Strings.select
                          : _assignedLeadToController.selectedLeadName.value,
                      categories: formattedCategories,
                      onChanged: (selectedCategory) {
                        final names = selectedCategory.split(' ');
                        if (names.length >= 2) {
                          final firstName = names[0];
                          final lastName = names[1];
                          _assignedLeadToController.selectedLeadName.value = '$firstName $lastName';
                        }
                      },
                    );
                  }
                }),
                SizedBox(height: 10),
                Text('Roles *'),
                Obx(() {
                  if (_rolesViewModel.loading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    // Get the role name of the user being edited
                    String initialRole = user.roleList.isNotEmpty ? user.roleList.first.name ?? 'N/A' : 'N/A';

                    return CreateNewLeadScreenCard(
                      hintText: 'Select Role',
                      value: initialRole, // Set the initial value to the user's role
                      categories: _rolesViewModel.roles.map((role) => role.name ?? 'N/A').toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedRole = newValue; // Update the selected role
                        });
                        print('Selected Role: $newValue');
                      },
                    );
                  }
                }),
                SizedBox(height: 10),
                Text('Change Password *'),
                CreateNewLeadScreenCard(
                  hintText: '************',
                  suffixIcon: Icon(Icons.remove_red_eye, size: 19),
                  controller: passwordController, // Use the controller
                ),
                SizedBox(height: 10),
                Text('Confirm Password *'),
                CreateNewLeadScreenCard(
                  hintText: '************',
                  suffixIcon: Icon(Icons.remove_red_eye, size: 19),
                  controller: confirmPasswordController, // Use the controller
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final result = await userUpdateViewModel.updateUser (
                  user.id!,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  mobile: mobileController.text,
                  department: selectedDepartment ?? 'Default Department',
                  parent: _assignedLeadToController.selectedLeadId.value.isNotEmpty
                      ? _assignedLeadToController.selectedLeadId.value
                      : 'Default Parent ID', // Provide a default value or handle null case
                  roleList: [selectedRole!],
                  password: passwordController.text.isNotEmpty ? passwordController.text : null,
                  cpassword: confirmPasswordController.text.isNotEmpty ? confirmPasswordController.text : null,
                );
                if (result) {
                  Utils.snackbarSuccess("sucess");
                  Navigator.pop(context);
                  await userListViewModel.userListApi(); // Refresh the list
                } else {
                  Utils.snackbarFailed(userUpdateViewModel.error);
                }
              },
              child: Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}

class OrgChartNode extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final Color backgroundColor;
  final VoidCallback onDelete;

  const OrgChartNode({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
    required this.backgroundColor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: getColorFromString(name),
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getColorFromString(String input) {
    int hash = input.hashCode;
    return Color((hash & 0xFFFFFF) + 0xFF000000); // Generate a color based on the hash
  }
}