import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../../data/models/requestModels/role/edit_role/RoleListEditRequestModel.dart';
import '../../../data/models/responseModels/customers/orderProducts/services/order_product_services.dart';
import '../../../data/models/responseModels/roles/roles_response_model.dart';
import '../../../data/models/responseModels/userList/list/update/RolesListUpdateResponseModel.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../viewModels/userlistViewModel/roles/edit/RoleListEditViewModel.dart';
import '../../../viewModels/userlistViewModel/roles/update_role/RoleListUpdateViewModel.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class UserUpdateRolescreen extends StatefulWidget {

  final RolesResponseModel role; // Change this line

  const UserUpdateRolescreen({super.key,required this.role});

  @override
  State<UserUpdateRolescreen> createState() => _UserUpdateRolescreenState();
}

class _UserUpdateRolescreenState extends State<UserUpdateRolescreen> {

  final RoleListUpdateViewModel roleViewModel = Get.put(RoleListUpdateViewModel());
  final RoleListEditViewModel roleNamDscViewModel = Get.put(RoleListEditViewModel());

  Map<String, List<bool>> permissionCheckboxes = {};
  bool isSelectAll = false;
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.role.name ?? '');
    descriptionController = TextEditingController(text: widget.role.description ?? '');

    // Fetch the role data with permissions
    roleViewModel.roleUpdateListApi(context).then((_) {
      setState(() {
        permissionCheckboxes.clear();
        for (var role in roleViewModel.roleData.value) {
          if (role.permissions != null) {
            permissionCheckboxes[role.id!] = List.generate(role.permissions!.length, (index) => false);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            const Expanded(child: Text('Edit Role')),
            CustomButton(
              width: 70,
              height: 25,
              borderRadius: 54,
              onPressed: () async {
                // Create an object to send the updated role data to the API
                RoleListEditRequestModel updatedRole = RoleListEditRequestModel(
                  name: nameController.text,
                  description: descriptionController.text,
                );

                // Send the updated role information to the API
                await roleNamDscViewModel.roleListEditApi(
                  widget.role.id!,
                  name: nameController.text,
                  description: descriptionController.text,
                );

                // Send updated permissions
                await _saveUpdatedPermissions();

                // Close the screen after saving
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
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
        return Stack(
          children: [
            if (roleViewModel.loading.value)
              const Center(child: CircularProgressIndicator()),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Search Role'),
                    const SizedBox(height: 8),
                    CreateNewLeadScreenCard(
                      controller: roleViewModel.searchController,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.grey.shade500,
                      ),
                      hintText: 'Search',
                    ),
                    const SizedBox(height: 8),
                    const Text('Role Name'),
                    const SizedBox(height: 8),
                    CreateNewLeadScreenCard(
                      controller: nameController,
                      hintText: 'Enter role name',
                    ),
                    const SizedBox(height: 10),
                    const Text('Role Description'),
                    CreateNewLeadScreenCard(
                      controller: descriptionController,
                      hintText: 'Description',
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(15),
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
                              Text(
                                'Role Permissions',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.sfPro,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                'assets/svg/role_update.svg',
                                semanticsLabel: 'Role Update SVG',
                                height: 15,
                                width: 15,
                                color: AllColors.grey,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Module Access',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.sfPro,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.error, color: Colors.grey, size: 18),
                              const Spacer(),
                              SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            isSelectAll = !isSelectAll;
                                            permissionCheckboxes.forEach((key, checkboxes) {
                                              for (int i = 0; i < checkboxes.length; i++) {
                                                checkboxes[i] = isSelectAll;
                                              }
                                            });
                                          });
                                        },
                                        icon: Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: isSelectAll ? AllColors.mediumPurple : Colors.transparent,
                                            border: Border.all(
                                              color: isSelectAll ? AllColors.mediumPurple! : Colors.grey,
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: isSelectAll
                                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Select All',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.sfPro,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (roleViewModel.filteredCategories.isNotEmpty)
                      ...roleViewModel.filteredCategories.value
                          .where((role) => role.permissions != null)
                          .map((role) {
                        String roleId = role.id ?? 'defaultRoleId';
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(15),
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
                              Text(
                                role.displayName ?? 'Module',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.sfPro,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                children: role.permissions!.map((permission) {
                                  String permissionName = permission.name ?? 'Permission';
                                  int firstUnderscoreIndex = permissionName.indexOf('_');
                                  if (firstUnderscoreIndex != -1) {
                                    permissionName = permissionName.substring(firstUnderscoreIndex + 1);
                                  }
                                  var parts = permissionName.split('_');
                                  var formattedParts = parts.map((part) {
                                    return part[0].toUpperCase() + part.substring(1).toLowerCase();
                                  }).toList();
                                  String formattedLabel = formattedParts.join(' ');

                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              setState(() {
                                                int index = role.permissions!.indexOf(permission);
                                                permissionCheckboxes[roleId]![index] = !permissionCheckboxes[roleId]![index];

                                                bool allSelected = true;
                                                permissionCheckboxes.forEach((key, checkboxes) {
                                                  if (checkboxes.contains(false)) {
                                                    allSelected = false;
                                                  }
                                                });
                                                isSelectAll = allSelected;
                                              });
                                            },
                                            icon: Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: permissionCheckboxes[roleId]![role.permissions!.indexOf(permission)]
                                                    ? AllColors.mediumPurple
                                                    : Colors.transparent,
                                                border: Border.all(
                                                  color: permissionCheckboxes[roleId]![role.permissions!.indexOf(permission)]
                                                      ? AllColors.mediumPurple!
                                                      : Colors.grey,
                                                  width: 0.5,
                                                ),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: permissionCheckboxes[roleId]![role.permissions!.indexOf(permission)]
                                                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          formattedLabel,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.sfPro,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }


  Future<void> _saveUpdatedPermissions() async {
    List<Map<String, dynamic>> updatedPermissions = [];
    permissionCheckboxes.forEach((roleId, permissions) {
      for (int i = 0; i < permissions.length; i++) {
        if (permissions[i]) {
          updatedPermissions.add({
            'roleId': roleId,  // roleId will be passed here
            'permissionId': roleViewModel.roleData.value
                .firstWhere((role) => role.id == roleId)
                .permissions![i]
                .id,
            'isGranted': true,
          });
        }
      }
    });

    // Ensure you are passing the roleId along with the permissions
    await roleViewModel.saveUpdatedPermissions(widget.role.id!, updatedPermissions);
  }



  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
