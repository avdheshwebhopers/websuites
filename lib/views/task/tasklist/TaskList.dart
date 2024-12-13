import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/utils/button/CustomButton.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/task/tasklist/taskdetailsgrid/TaskGridDetailsScreen.dart';
import 'package:websuites/data/models/responseModels/tasks/list/tasks_list_response_model.dart' as task_list;
import 'package:websuites/data/models/requestModels/dashboardScreen/db_latest_task.dart' as dashboard;

import '../../../resources/imageStrings/image_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/capitalize_letter/CapitalLetter.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';
import '../../../viewModels/tasks/list/task_list_view_model.dart';

class TaskListScreen extends StatelessWidget {
  final TaskListViewModel _taskListViewModel = Get.put(TaskListViewModel(), permanent: true);
  final AssignedLeadToViewModel _assignedLeadToController = Get.put(AssignedLeadToViewModel());
  final _selectedTaskIndex = 0.obs;

  TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 25, top: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 30,
                  child: Obx(() => GestureDetector(
                    onTap: () => _selectedTaskIndex.value = 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedTaskIndex.value == 0
                            ? AllColors.mediumPurple
                            : AllColors.textField2,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageStrings.menuDot,
                            height: 12,
                            width: 12,
                            color: _selectedTaskIndex.value == 0
                                ? AllColors.whiteColor
                                : AllColors.blackColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Task List',
                            style: TextStyle(
                              color: _selectedTaskIndex.value == 0
                                  ? AllColors.whiteColor
                                  : AllColors.blackColor,
                              fontFamily: FontFamily.sfPro,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
                const Spacer(),
                SizedBox(
                  width: 140,
                  height: 30,
                  child: Obx(() => GestureDetector(
                    onTap: () => _selectedTaskIndex.value = 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedTaskIndex.value == 1
                            ? AllColors.mediumPurple
                            : AllColors.textField2,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.grid_view_outlined,
                            size: 14,
                            color: _selectedTaskIndex.value == 1
                                ? AllColors.whiteColor
                                : AllColors.blackColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Details',
                            style: TextStyle(
                              color: _selectedTaskIndex.value == 1
                                  ? AllColors.whiteColor
                                  : AllColors.blackColor,
                              fontFamily: FontFamily.sfPro,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (_taskListViewModel.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return _selectedTaskIndex.value == 0
                  ? RefreshIndicator(
                onRefresh: () => _taskListViewModel.refreshData(Get.context!),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular (8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Task",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),
                            SizedBox(width: 10,),
                            CustomButton(
                              height: 20,
                              width: 20,
                              borderRadius: 12,
                              child: Icon(Icons.add, size: 14),
                              onPressed: () {},
                            ),
                            Spacer(),

                            //

                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 250,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular (8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Running Task : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: FontFamily.sfPro,
                                    ),
                                  ),
                                  Text('WH CRM App',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: FontFamily.sfPro,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  CommonButton(
                                    width: 40,
                                    height: 20,
                                    color: AllColors.darkRed,


                                      title: 'Stop', onPress: (){})
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: _taskListViewModel.tasks.isEmpty
                              ? const Center(child: Text("No tasks available"))
                              : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _taskListViewModel.tasks.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _taskListViewModel.tasks[index].subject ?? 'No Subject',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: FontFamily.sfPro,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AllColors.thinOrange,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Mediums.png',
                                                    height: 12,
                                                    width: 13,
                                                    color: AllColors.yellowGoogleForm,
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Text(
                                                    capitalizeFirstLetter(_taskListViewModel.tasks[index].priority),
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                      color: AllColors.yellowGoogleForm,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: AllColors.greenGoogleForm,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    _taskListViewModel.tasks[index].status?.name ?? 'No Subject',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                      color: AllColors.greenishYellow,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Image.asset('assets/icons/Dropdown.png', height: 12, width: 13),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(ImageStrings.dateCalender, height: 14, width: 14),
                                        SizedBox(width: 10,),
                                        Text(
                                           _taskListViewModel.tasks[index].startDate != null
                                              ? formatDateToDDMMYYYY(_taskListViewModel.tasks[index].startDate!)
                                              : 'No Subject',
                                          style: TextStyle(
                                            color: AllColors.mediumPurple,
                                            fontFamily: FontFamily.sfPro,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),


                                        const Spacer(),
                                        Text(
                                          'DEADLINE - ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: FontFamily.sfPro,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          _taskListViewModel.tasks[index].deadline != null
                                              ? formatDateToLongMonth2(
                                            DateTime.tryParse(_taskListViewModel.tasks[index].deadline!) ?? DateTime.now(),
                                          )
                                              : 'No Subject',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.sfPro,
                                            color: AllColors.grey,
                                            fontSize: 12,
                                          ),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 5),

                                    Row(
                                      children: [
                                        Text(
                                          'CREATED - ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: FontFamily.sfPro,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          _taskListViewModel.tasks[index].createdAt != null
                                              ? formatDateToLongMonth2(
                                            DateTime.tryParse(_taskListViewModel.tasks[index].createdAt!) ?? DateTime.now(),
                                          )
                                              : 'No Subject',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.sfPro,
                                            color: AllColors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'ASSIGNEE- ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: FontFamily.sfPro,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          _taskListViewModel.tasks[index].assigned != null &&
                                              _taskListViewModel.tasks[index].assigned!.isNotEmpty
                                              ? '${_taskListViewModel.tasks[index].assigned![0].assignedTo?.firstName} ${_taskListViewModel.tasks[index].assigned![0].assignedTo?.lastName}'
                                              : 'No Subject',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.sfPro,
                                            color: AllColors.mediumPurple,
                                            fontSize: 12,
                                          ),
                                        ),


                                      ],
                                    ),
                                    const SizedBox(height: 5),

                                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ESTIMATED HOURS',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: FontFamily.sfPro,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              _taskListViewModel.tasks[index].estimatedMinutes != null
                                                  ? '${(int.tryParse(_taskListViewModel.tasks[index].estimatedMinutes!.toString()) ?? 0) ~/ 60} Hours'
                                                  : 'No Subject',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontFamily.sfPro,
                                                color: AllColors.mediumPurple,
                                                fontSize: 12,
                                              ),
                                            ),


                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Project - ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontFamily.sfPro,
                                            color: AllColors.mediumPurple,
                                            fontSize: 12,
                                          )
                                        ),
                                        Expanded(
                                          child: Text(
                                            (_taskListViewModel.tasks[index].project?.projectName?.toString() ?? 'No Subject'),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.sfPro,
                                              color: AllColors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(thickness: 0.5,height: 40,),

                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'TASK TYPE - ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: FontFamily.sfPro,
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            _taskListViewModel.tasks[index].taskType?.name.toString() ?? 'No Subject',

                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamily.sfPro,
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  :   SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                      child:
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Entity Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Not started', // Static text for task status
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              ],
                            ),
                            Divider(height: 20),

                            // Scrollable Task List
                            ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 200),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: 2, // Hardcoded task count
                                separatorBuilder: (context, index) => Divider(
                                  thickness: 0.5,
                                  height: 30,
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          IntrinsicWidth(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 20,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Medium.png',
                                                    height: 10,
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    'Medium',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundColor: AllColors.darkBlue,
                                            child: Text(
                                              'R',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        index == 0 ? 'Task 1' : 'Task 2',
                                        style: TextStyle(
                                          color: AllColors.blackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        index == 0
                                            ? 'Details for Task 1'
                                            : 'Details for Task 2',
                                        style: TextStyle(
                                          color: AllColors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: AllColors.mediumPurple,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            index == 0 ? '2 days ago' : '1 day ago',
                                            style: TextStyle(
                                              color: AllColors.mediumPurple,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            'assets/icons/gallery.png',
                                            height: 14,
                                            width: 14,
                                            color: AllColors.grey,
                                          ),
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.comment,
                                            color: Colors.grey,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Obx(
            () => Visibility(
          visible: _selectedTaskIndex.value == 1,
          child: FloatingActionButton(
            backgroundColor: AllColors.mediumPurple,
            child: Icon(
              Icons.person_add_alt_1,
              color: AllColors.whiteColor,
              size: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close, color: AllColors.grey),
                            ),
                          ],
                        ),
                        Text(
                          'Add People',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Name: *'),
                        const SizedBox(height: 10),
                        CreateNewLeadScreenCard(
                          hintText: _assignedLeadToController.selectedLeadName.value.isEmpty
                              ? Strings.select
                              : _assignedLeadToController.selectedLeadName.value,
                          categories: _assignedLeadToController.namesOnlyRxList,
                          onCategoryChanged: (selectedCategory) {
                            final names = selectedCategory.split(' ');
                            if (names.length >= 2) {
                              final firstName = names[0];
                              final lastName = names[1];
                              _assignedLeadToController.selectedLeadName.value =
                              '$firstName $lastName';
                            }
                          },
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CommonButton(
                              height: 30,
                              title: 'Add People',
                              onPress: () {
                                Get.back();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}