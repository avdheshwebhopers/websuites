import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/HRM/leave/plan/add/HrmPlanAdd.dart';
import '../../../Utils/utils.dart';
import '../../../data/models/requestModels/HRM/type/add/AddLeaveTypeRequestModel.dart';
import '../../../data/models/requestModels/HRM/type/update/UpdateLeaveTypeRequestModel.dart';
import '../../../data/models/responseModels/hrm/leave/type/hrm_leave_type_response_model.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../viewModels/hrmScreens/leave/plans/hrm_leave_plan_viewModel.dart';
import '../../../viewModels/hrmScreens/leave/type/add/AddLeaveTypeViewModel.dart';
import '../../../viewModels/hrmScreens/leave/type/hrm_leave_type_viewModel.dart';
import '../../../viewModels/hrmScreens/leave/type/update/UpdateLeaveTypeViewModel.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class HrmLeaveController extends GetxController {
  final RxBool showAdditionalFields =
      false.obs; // Observable for additional fields
  final RxBool isChecked =
      false.obs; // Observable for "Is Employee view description"
  final RxBool isCheckeds = false.obs; // Observable for "Classif
  final TextEditingController leaveNameController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController isEmployeeView = TextEditingController();
  final TextEditingController isSickMedical = TextEditingController();

  final AddLeaveTypeViewModel hrmLeaveTypeViewModel =
      Get.put(AddLeaveTypeViewModel());
  final UpdateLeaveTypeViewModel hrmLeaveUpdateTypeViewModel =
      Get.put(UpdateLeaveTypeViewModel());

  final RxInt selectedButtonIndex = 0.obs;

  final LeaveTypeViewModel leaveViewModel =
      Get.put(LeaveTypeViewModel()); // Bind the view model

  final LeavePlanViewModel leavePlanViewModel =
      Get.put(LeavePlanViewModel()); // Bind the view model

  String? selectedLeaveType; // Add this line

  void onButtonPressed(int index) {
    selectedButtonIndex.value = index;
  }

  Future<void> addLeaveType(
      BuildContext context, AddLeaveTypeRequestModel requestModel) async {
    await hrmLeaveTypeViewModel.addLeaveTypeApi(context, requestModel);

    if (hrmLeaveTypeViewModel.leaveAddType.isNotEmpty) {
      // Utils.snackbarSuccess('Leave type added successfully');
    } else {
      // Utils.snackbarFailed('Failed to add leave type');
    }
  } // Trigger leave data fetching

  Future<void> updateLeaveType(
      BuildContext context, UpdateLeaveTypeRequestModel requestModel) async {
    await hrmLeaveUpdateTypeViewModel.updateLeaveTypeApi(context, requestModel);

    // Log the response for debugging
    print(hrmLeaveUpdateTypeViewModel.leaveUpdateType);

    if (hrmLeaveUpdateTypeViewModel.leaveUpdateType.isNotEmpty) {
      Utils.snackbarSuccess('Leave type updated successfully');
    } else {
      Utils.snackbarFailed('Failed to update leave type');
    }
  }

  Future<void> fetchLeaveData(BuildContext context) async {
    await leaveViewModel.leaveApi(context);
  }

  Future<void> fetchLeavePlanData(BuildContext context) async {
    await leavePlanViewModel.leavePlanApi(context);
  }

  @override
  void onInit() {
    super.onInit();
    fetchLeaveData(Get.context!); // Fetch data when controller is initialized
    fetchLeavePlanData(
        Get.context!); // Fetch data when controller is initialized
  }
}

class HrmLeaveScreen extends GetView<HrmLeaveController> {
  const HrmLeaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HrmLeaveController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Leave',
              style: TextStyle(
                fontFamily: 'SFPro',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Obx(() => CommonButton(
                width: 80,
                height: 30,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                icon: Icon(
                  Icons.add,
                  color: AllColors.whiteColor,
                  size: 19,
                ),
                iconSpacing: true,
                title:
                    controller.selectedButtonIndex.value == 0 ? 'Type' : 'Plan',
                onPress: () {
                  if (controller.selectedButtonIndex.value == 0) {
                    _showBottomSheet1(
                        context); // Show bottom sheet for Leave Type
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
backgroundColor: Colors.white,
                          child:
                          HrmPlanDiliouge(), // This is your custom bottom sheet widget
                        );
                      },
                    );
                  }
                }))
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: Column(
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                controller.selectedButtonIndex.value == 0
                                    ? Colors.white
                                    : Colors.black,
                            backgroundColor:
                                controller.selectedButtonIndex.value == 0
                                    ? AllColors.mediumPurple
                                    : AllColors.textField2,
                          ),
                          onPressed: () => controller.onButtonPressed(0),
                          child: const Text('Leave Type'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                controller.selectedButtonIndex.value == 1
                                    ? Colors.white
                                    : Colors.black,
                            backgroundColor:
                                controller.selectedButtonIndex.value == 1
                                    ? AllColors.mediumPurple
                                    : AllColors.textField2,
                          ),
                          onPressed: () => controller.onButtonPressed(1),
                          child: const Text('Leave Plans'),
                        ),
                      ),
                    ),
                  ],
                )),
            Obx(() {
              if (controller.selectedButtonIndex.value == 1) {
                if (controller.leavePlanViewModel.leaveTypeList.isEmpty) {
                  return Center(child: Text("No Leave Plans Available"));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        controller.leavePlanViewModel.leaveTypeList.length,
                    itemBuilder: (context, index) {
                      var leavePlan =
                          controller.leavePlanViewModel.leaveTypeList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 15),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      leavePlan.name ?? 'Leave Plan',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: FontFamily.sfPro,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/date.png',
                                          width: 14,
                                          height: 13,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          formatDateWithTime(
                                              leavePlan.createdAt.toString() ??
                                                  'N/A'),
                                          style: TextStyle(
                                              color: AllColors.mediumPurple,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Start Date : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    formatDateWithDay(
                                      leavePlan.startDate.toString() ?? 'N/A',
                                    ),
                                    style: TextStyle(
                                        color: AllColors.figmaGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: Get.width * 0.4),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AllColors.background_green,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text(
                                        leavePlan.status != null &&
                                                leavePlan.status == true
                                            ? 'Active'
                                            : 'Inactive',
                                        style: TextStyle(
                                          color: AllColors.text__green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(thickness: 0.4),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: FontFamily.sfPro,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      leavePlan.description ?? 'No description',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.sfPro,
                                        color: AllColors.figmaGrey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      // Show ellipsis when the text overflows
                                      maxLines:
                                          1, // Ensure only one line of text
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // Adds spacing between icons
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.settings,
                                      color: AllColors.figmaGrey,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/icons/edit.png',
                                      height: 17,
                                      width: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                if (controller.leaveViewModel.leaveDataList.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.leaveViewModel.leaveDataList.length,
                    itemBuilder: (context, index) {
                      var leave =
                          controller.leaveViewModel.leaveDataList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 15),
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
                                leave.name ?? 'Leave Type',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.sfPro,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Is Paid : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    leave.paidOption ?? 'Unknown',
                                    style: TextStyle(
                                        color: AllColors.figmaGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Code : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    leave.shortCode ?? 'N/A',
                                    style: TextStyle(
                                        color: AllColors.figmaGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const Divider(thickness: 0.4),
                              Row(
                                children: [
                                  Text(
                                    'Type : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    leave.type ?? 'N/A',
                                    style: TextStyle(
                                        color: AllColors.figmaGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      _showBottomSheet2(context, leave);
                                    },
                                    child: Image.asset(
                                      'assets/icons/edit.png',
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  void _showBottomSheet1(BuildContext context) {
    final TextEditingController leaveTypeController = TextEditingController();
    final TextEditingController leaveNameController = TextEditingController();
    final TextEditingController shortCodeController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController marriageController = TextEditingController();
    final TextEditingController reasonController = TextEditingController();

    final HrmLeaveController controller =
        Get.find<HrmLeaveController>(); // Get the controller instance

    // Sample categories for leave types
    List<String> categories = controller.leaveViewModel.leaveDataList
        .map((leave) => leave.type ?? 'Unknown')
        .toSet()
        .toList();

    String noRegularLeaveMessage = 'No Regular Leave Available';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      // Make it scrollable
      isDismissible: true,
      // Allows dismissing by tapping outside

      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          height: MediaQuery.of(context).size.height *
              0.75, // Set height to 75% of screen height
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Add Leave Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AllColors.blackColor,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Leave Type Field
                Text('Select Leave Type *'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  hintText: 'Select',
                  controller: leaveTypeController,
                  categories: categories.isNotEmpty
                      ? categories
                      : [noRegularLeaveMessage],
                  onCategoryChanged: (String selectedCategory) {
                    controller.selectedLeaveType =
                        selectedCategory; // Update the selected value
                  },
                ),
                SizedBox(height: 8),
                // Leave Name Field
                Text('Leave Name *'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  controller: leaveNameController,
                  hintText: 'Jury Duty, Privileged leave etc.',
                ),
                SizedBox(height: 8),
                // Short Code Field
                Text('Short Code'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  controller: shortCodeController,
                  hintText: 'EX: PTO',
                ),
                SizedBox(height: 8),
                // Description Field
                Text('Description *'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  controller: descriptionController,
                  hintText: '',
                ),
                SizedBox(height: 8),

                Obx(() => Row(
                      children: [
                        Checkbox(
                          checkColor: AllColors.whiteColor,
                          activeColor: AllColors.mediumPurple,
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.isChecked.value = value ?? false;
                          },
                        ),
                        Text('Is Employee view description'),
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          checkColor: AllColors.whiteColor,
                          activeColor: AllColors.mediumPurple,
                          value: controller.isCheckeds.value,
                          onChanged: (bool? value) {
                            controller.isCheckeds.value = value ?? false;
                          },
                        ),
                        Text('Classify as Sick/Medical'),
                      ],
                    )),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    controller.showAdditionalFields.value = !controller
                        .showAdditionalFields.value; // Toggle visibility
                  },
                  child: Row(
                    children: [
                      Icon(
                        controller.showAdditionalFields.value
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'More Options',
                        style: TextStyle(
                          fontFamily: FontFamily.sfPro,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                // Conditionally show additional fields
                Obx(() {
                  if (controller.showAdditionalFields.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Limit to Gender Field
                        Text('Limit to Gender'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          controller: genderController,
                          hintText: 'Select...',
                          categories: [
                            'Male',
                            'Female',
                            'Transgender',
                            'Non Binary',
                            'Prefer Not To Respond'
                          ],
                        ),
                        SizedBox(height: 8),
                        // Limit marital status Field
                        Text('Limit marital status'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          hintText: 'Select...',
                          controller: marriageController,
                          categories: [
                            'Single',
                            'Married',
                            'Widowed',
                            'Separated'
                          ],
                        ),
                        SizedBox(height: 8),
                        // Reasons Field
                        Text('Reasons'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          controller: reasonController,
                          hintText: 'Select...',
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }
                  return SizedBox
                      .shrink(); // Return an empty widget if not showing additional fields
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 80,
                      height: 30,
                      borderRadius: 25,
                      onPressed: () async {
                        // Create the request model
                        AddLeaveTypeRequestModel requestModel =
                            AddLeaveTypeRequestModel(
                          type: controller.selectedLeaveType,
                          name: leaveNameController.text,
                          shortCode: shortCodeController.text.isNotEmpty
                              ? shortCodeController.text
                              : '',
                          description: descriptionController.text,
                          isEmployeeView: controller.isChecked.value,
                          isSickMedical: controller.isCheckeds.value,
                        );

                        await controller.addLeaveType(context, requestModel);

                        // Close the bottom sheet after the API call
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro),
                      ),
                    ),
                    CustomButton(
                      backgroundColor: AllColors.textField,
                      width: 80,
                      height: 30,
                      borderRadius: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro,
                            color: AllColors.blackColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet2(
      BuildContext context, HrmLeaveTypeResponseModel leave) {
    final TextEditingController leaveTypeController = TextEditingController();
    final TextEditingController leaveNameController = TextEditingController();
    final TextEditingController shortCodeController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController marriageController = TextEditingController();
    final TextEditingController reasonController = TextEditingController();
    final HrmLeaveController controller =
        Get.find<HrmLeaveController>(); // Get the controller instance

    leaveTypeController.text = leave.type ?? '';
    leaveNameController.text = leave.name ?? '';
    shortCodeController.text = leave.shortCode ?? '';
    descriptionController.text = leave.description ?? '';
    controller.selectedLeaveType = leave.type;

    List<String> leaveTypes = controller.leaveViewModel.leaveDataList
        .map((leave) => leave.type ?? '')
        .toList();

    String noRegularLeaveMessage = 'No Regular Leave Available';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      // Allows the bottom sheet to be scrollable
      isDismissible: true,
      // Allows dismissing the bottom sheet
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          height: MediaQuery.of(context).size.height *
              0.75, // Set height to 75% of screen height
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Update Leave Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AllColors.blackColor,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Leave Type Field
                Text('Select Leave Type *'),
                SizedBox(height: 5),

                CreateNewLeadScreenCard(
                  hintText:
                      controller.selectedLeaveType ?? leave.type ?? 'Select',
                  controller: leaveTypeController,
                  categories: leaveTypes.isNotEmpty
                      ? leaveTypes
                      : [noRegularLeaveMessage],
                  onCategoryChanged: (String selectedCategory) {
                    controller.selectedLeaveType = selectedCategory;
                  },
                ),

                SizedBox(height: 8),
                // Leave Name Field
                Text('Leave Name *'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  controller: leaveNameController,
                  hintText: leave.name ?? '',
                ),
                SizedBox(height: 8),
                // Short Code Field
                Text('Short Code'),
                SizedBox(height: 5),
                CreateNewLeadScreenCard(
                  controller: shortCodeController,
                  hintText: leave.shortCode ?? '',
                ),
                SizedBox(height: 8),
                // Description Field
                Text('Description *'),
                SizedBox(height: 5),

                CreateNewLeadScreenCard(
                  controller: descriptionController,
                  hintText: '',
                ),

                SizedBox(height: 8),

                Obx(() => Row(
                      children: [
                        Checkbox(
                          checkColor: AllColors.whiteColor,
                          activeColor: AllColors.mediumPurple,
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.isChecked.value = value ?? false;
                          },
                        ),
                        Text('Is Employee view description'),
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          checkColor: AllColors.whiteColor,
                          activeColor: AllColors.mediumPurple,
                          value: controller.isCheckeds.value,
                          onChanged: (bool? value) {
                            controller.isCheckeds.value = value ?? false;
                          },
                        ),
                        Text('Classify as Sick/Medical'),
                      ],
                    )),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    controller.showAdditionalFields.value =
                        !controller.showAdditionalFields.value;
                  },
                  child: Row(
                    children: [
                      Icon(
                        controller.showAdditionalFields.value
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'More Options',
                        style: TextStyle(
                          fontFamily: FontFamily.sfPro,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                // Conditionally show additional fields
                Obx(() {
                  if (controller.showAdditionalFields.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Limit to Gender Field
                        Text('Limit to Gender'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          controller: genderController,
                          hintText: 'Select...',
                          categories: [
                            'Male',
                            'Female',
                            'Transgender',
                            'Non Binary',
                            'Prefer Not To Respond'
                          ],
                        ),
                        SizedBox(height: 8),
                        // Limit marital status Field
                        Text('Limit marital status'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          hintText: 'Select...',
                          controller: marriageController,
                          categories: [
                            'Single',
                            'Married',
                            'Widowed',
                            'Separated'
                          ],
                        ),
                        SizedBox(height: 8),
                        // Reasons Field
                        Text('Reasons'),
                        SizedBox(height: 5),
                        CreateNewLeadScreenCard(
                          controller: reasonController,
                          hintText: 'Select...',
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }
                  return SizedBox
                      .shrink(); // Return an empty widget if not showing additional fields
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 80,
                      height: 30,
                      borderRadius: 25,
                      onPressed: () async {
                        // Create the request model
                        UpdateLeaveTypeRequestModel requestModel =
                            UpdateLeaveTypeRequestModel(
                          id: leave.id,
                          // Ensure you pass the ID
                          type: controller.selectedLeaveType ?? '',
                          name: leaveNameController.text.isNotEmpty
                              ? leaveNameController.text
                              : '',
                          shortCode: shortCodeController.text.isNotEmpty
                              ? shortCodeController.text
                              : '',
                          description: descriptionController.text.isNotEmpty
                              ? descriptionController.text
                              : '',
                          isEmployeeView:
                              controller.isChecked.value ? 'true' : 'false',
                          isSickMedical:
                              controller.isCheckeds.value ? 'true' : 'false',
                        );
                        await controller.updateLeaveType(context, requestModel);
                        await controller.fetchLeaveData(
                            context); // Refresh the data after update

                        // Close the bottom sheet after the API call
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro),
                      ),
                    ),
                    CustomButton(
                      backgroundColor: AllColors.textField,
                      width: 80,
                      height: 30,
                      borderRadius: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.sfPro,
                            color: AllColors.blackColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
