import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/leadScreens/createNewLead/create_newLead_screen.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../../data/models/responseModels/master/departments/master_departments_response_model.dart';

import '../../../Utils/utils.dart';
import '../../../data/models/requestModels/userlist/department/add/UserDepartmentAddRequestModel.dart';
import '../../../data/models/requestModels/userlist/department/update/UserDepartmentUpdateRequestModel.dart';
import '../../../data/models/responseModels/userList/add/UserDepartmentAddResponsetModel.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../viewModels/master/departments/master_departments_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../../viewModels/userlistViewModel/department/UserDepartmentViewModel.dart';
import '../../../viewModels/userlistViewModel/department/add/UserAddDepartmentViewModel.dart';

class UsersDepartmentsScreen extends StatefulWidget {
  const UsersDepartmentsScreen({super.key});

  @override
  State<UsersDepartmentsScreen> createState() => _UsersDepartmentsScreenState();
}

class _UsersDepartmentsScreenState extends State<UsersDepartmentsScreen> {
  final MasterDepartmentsViewModel _masterViewModel =
      Get.put(MasterDepartmentsViewModel());

  final UserDepartmentViewModel _userDepartmentViewModel =
      Get.put(UserDepartmentViewModel()); // Use UserDepartmentViewModel

  final UserAddDepartmentViewModel _userAddDepartmentViewModel =
  Get.put(UserAddDepartmentViewModel()); // Use UserDepartmentViewModel

  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();

    _masterViewModel.masterDepartments(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              'Departments',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: FontFamily.sfPro),
            ),
            const Spacer(),
            Icon(Icons.search, color: AllColors.lightGrey),
            const SizedBox(width: 15),
            CustomButton(
              width: 70,
              height: 22,
              borderRadius: 54,
              onPressed: () {

                UserDepartmentAddResponseModel addDepartment = UserDepartmentAddResponseModel(
                  id: null,  // Set this as null or leave empty for a new department
                  name: '', // Leave blank or populate with user input
                  description: '',  // Leave blank or populate with user input
                  isDefault: true,   // Default value, or get it dynamically
                  createdAt: null,  // Set to null initially for a new department
                  updatedAt: null,  // Set to null initially for a new department
                );

                // Pass the correct model to the dialog
                _showDialog2(addDepartment); // Open the dialog to add/edit a department
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AllColors.whiteColor, size: 18),
                  const SizedBox(width: 5),
                  const Text(
                    'Add',
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
        // Show loading indicator while fetching data
        if (_masterViewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if departments list is empty
        if (_masterViewModel.departments.isEmpty) {
          return const Center(child: Text('No departments found'));
        }


        return ListView.builder(
          itemCount: _masterViewModel.departments.length,
          itemBuilder: (context, index) {
            MasterDepartmentsResponseModel department =
                _masterViewModel.departments[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Text(
                          department.name ?? 'N/A',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        department.description ?? 'No description available',
                        style: TextStyle(
                            fontSize: 14,
                            color: AllColors.figmaGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/date.png',
                          height: 14, width: 14),
                      const SizedBox(width: 5),
                      Text(
                        formatDateWithDay('${department.createdAt ?? 'N/A'}'),
                        style: TextStyle(
                            fontSize: 14,
                            color: AllColors.mediumPurple,
                            fontFamily: FontFamily.sfPro,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          _showDialog(department);
                        },
                        icon: Image.asset('assets/icons/edit.png',
                            height: 17, width: 16),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _showDialog(MasterDepartmentsResponseModel department) {
    final TextEditingController nameController =
        TextEditingController(text: department.name);
    final TextEditingController descriptionController =
        TextEditingController(text: department.description);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AllColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child:
          Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Edit Department',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CreateNewLeadScreenCard(
                        hintText: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),
                      CreateNewLeadScreenCard(
                        hintText: 'Description',
                        controller: descriptionController,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        onPressed: () async {
                          // Create the request model with updated values
                          UserDepartmentUpdateRequestModel updatedDepartment =
                              UserDepartmentUpdateRequestModel(
                            name: nameController.text,
                            description: descriptionController.text,
                          );

                          await _userDepartmentViewModel
                              .updateUserDepartmentApi(
                                  context, updatedDepartment, department.id);

                          // Close the dialog
                          Navigator.pop(context);
                        },
                        child: Text('Save',
                            style: TextStyle(color: AllColors.whiteColor)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon:
                        const Icon(Icons.close, color: Colors.black, size: 14),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDialog2(UserDepartmentAddResponseModel addDepartment) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AllColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add Department',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CreateNewLeadScreenCard(
                        hintText: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),
                      CreateNewLeadScreenCard(
                        hintText: 'Description',
                        controller: descriptionController,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        onPressed: () async {
                          // Create the request model with entered values
                          UserDepartmentAddRequestModel newDepartment =
                          UserDepartmentAddRequestModel(
                            name: nameController.text,
                            description: descriptionController.text,
                          );

                          // Call the ViewModel to add the department
                          await _userAddDepartmentViewModel.usersAddDepartmentApi(
                            context,
                            newDepartment,
                          );

                          // Close the dialog after creating the department
                          Navigator.pop(context);
                        },
                        child: Text('Save', style: TextStyle(color: AllColors.whiteColor)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black, size: 14),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
