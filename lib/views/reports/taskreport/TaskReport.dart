import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/reports/taskreport/taskdetails/TaskDetailsScreen.dart';
import '../../../Utils/utils.dart';
import '../../../data/models/responseModels/reports/taskdetails/TaskDetailsResponseModel.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../utils/paginationdropdownwidget/PaginationDropdownWidget.dart';
import '../../../viewModels/reports/task_report/report_task_view_model.dart';


class TaskReportScreen extends StatefulWidget {
  const TaskReportScreen({super.key});

  @override
  State<TaskReportScreen> createState() => _TaskReportScreenState();
}

class _TaskReportScreenState extends State<TaskReportScreen> {
  static const Map<String, String> _priorityImages = {
    'highest': 'assets/icons/Highest.png',
    'high': 'assets/icons/High.png',
    'medium': 'assets/icons/Mediums.png',
    'low': 'assets/icons/Low.png',
    'lowest': 'assets/icons/Lowest.png',
    'n/a': '',
  };
  final TaskReportsListViewModel _viewModel =
  Get.put(TaskReportsListViewModel());
  String selectedLimit = '15'; // Default limit

  late DateTime _startTime;
  late Timer _timer;
  int _elapsedSeconds = 0;

  // Store the user data
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _fetchTaskReports();
  }

  void _fetchTaskReports() {
    try {
      _viewModel.fetchTaskReports({
        "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "limit": int.parse(selectedLimit),
        "report_of": null,
        "page": 1
      }, context).then((_) {
        // Assuming the fetchTaskReports method updates the taskReportResponse
        // and you can access the first item to get user data
        if (_viewModel.taskReportResponse.value.items != null &&
            _viewModel.taskReportResponse.value.items!.isNotEmpty) {
          userName = _viewModel.taskReportResponse.value.items![0].user;
          userEmail = _viewModel.taskReportResponse.value.items![0].email;
        }
        setState(() {}); // Update the UI
      });
    } catch (e) {
      print('Error fetching task reports: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Obx(() {
                if (_viewModel.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (_viewModel.taskReportResponse.value.items == null ||
                    _viewModel.taskReportResponse.value.items!.isEmpty) {
                  return const Center(child: Text('No task reports found.'));
                }

                // Collect user data for the first card
                List<String> userCategories = _viewModel.taskReportResponse.value.items!
                    .map((item) => item.user ?? 'Unknown User')
                    .toList();

                return Column(
                  children: [

                    Row(
       mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonButton(
                          width: 80,
                          height: 30,
                          title: 'Filter',
                          onPress: () {
                            // Show the dialog when the button is pressed
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white, // Set the background color of the dialog
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CreateNewLeadScreenCard(
                                                hintText: 'ok',
                                                categories: userCategories, // Assuming userCategories is defined in your context
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: CreateNewLeadScreenCard(
                                                hintText: 'ok',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),

                       CreateNewLeadScreenCard(
                            hintText: 'ok',
                            categories: userCategories,
                          ),

                        SizedBox(width: 10,),
                      CreateNewLeadScreenCard(

                            hintText: 'ok',



                    ),
                    const SizedBox(height: 10), // Add some spacing between cards
                    // Second SliverToBoxAdapter for ongoing task report
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ongoing Task Report',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Divider(thickness: 1, color: Colors.grey),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _viewModel.taskReportResponse.value.items!.length,
                              itemBuilder: (context, index) {
                                final item = _viewModel.taskReportResponse.value.items![index];
                                final createdAt = item.currentTask?.createdAt;
                                _startTime = createdAt != null
                                    ? DateTime.parse(createdAt)
                                    : DateTime.now();
                                _elapsedSeconds =
                                    DateTime.now().difference(_startTime).inSeconds;

                                _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                                  setState(() {
                                    _elapsedSeconds = DateTime.now().difference(_startTime).inSeconds;
                                  });
                                });

                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.user ?? 'Unknown User',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.timer, size: 16, color: Colors.green),
                                              const SizedBox(width: 5),
                                              Text(
                                                _formatElapsedTime(_elapsedSeconds),
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.email ?? 'No email',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          Text(
                                            item.currentTask?.createdAt != null
                                                ? formatDateWithTime(item.currentTask!.createdAt)
                                                : 'N/A',
                                            style: const TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () async {
                                          String taskId = item.currentTask?.task?.id ?? 'N/A';
                                          var taskDetails;

                                          try {
                                            taskDetails = await _viewModel.fetchTaskDetails(taskId);
                                          } catch (error) {
                                            print("Error fetching task details: $error");
                                          }

                                          // Prepare the task details or use default values if not available
                                          String assignedTo = 'N/A'; // Default value
                                          String duration = 'N/A';
                                          String startOn = 'N/A';
                                          String endOn = 'N/A';
                                          String taskType = ' N/A';
                                          String status = 'N/A';
                                          String deadline = 'N/A';
                                          String priority = item.currentTask?.task?.priority ?? 'N/A';
                                          String createdBy = 'N/A';
                                          String projectName = 'N/A';
                                          String projectStartDate = 'N/A';
                                          String projectEndDate = 'N/A';
                                          String projectId = 'N/A';

                                          if (taskDetails != null) {
                                            // Prepare assignedTo string if taskDetails is not null
                                            if (taskDetails.taskInfo.assigned.isNotEmpty) {
                                              Assigned assignedUser  = taskDetails.taskInfo.assigned[0];
                                              assignedTo = '${assignedUser .assignedTo.firstName} ${assignedUser .assignedTo.lastName}';
                                            }

                                            // Update values with taskDetails if available
                                            duration = formatHoursMinutes(taskDetails.hours.toDouble(), taskDetails.minutes.toDouble());
                                            startOn = taskDetails.taskInfo.timeTracker.where((tracker) => tracker.action == 'start').isNotEmpty
                                                ? formatDateWithTime(taskDetails.taskInfo.timeTracker.lastWhere((tracker) => tracker.action == 'start').dateTime)
                                                : 'N/A';
                                            endOn = taskDetails.taskInfo.timeTracker.where((tracker) => tracker.action == 'end').isNotEmpty
                                                ? formatDateWithTime(taskDetails.taskInfo.timeTracker.lastWhere((tracker) => tracker.action == 'end').dateTime)
                                                : 'N/A';
                                            projectId = taskDetails.taskInfo.project.id ?? 'N/A';
                                            taskType = taskDetails.taskInfo.taskType?.name ?? 'N/A';
                                            status = taskDetails.taskInfo.status?.name ?? 'N/A';
                                            deadline = taskDetails.taskInfo.deadline != null
                                                ? formatShortDate(taskDetails.taskInfo.deadline.toString())
                                                : 'N/A';
                                            createdBy = '${taskDetails.taskInfo.createdBy.firstName} ${taskDetails.taskInfo.createdBy.lastName}';
                                            projectName = taskDetails.taskInfo.project.projectName ?? '';
                                            projectStartDate = taskDetails.taskInfo.project.startDate != null
                                                ? formatShortDate(taskDetails.taskInfo.project.startDate.toString())
                                                : 'N/A';
                                            projectEndDate = taskDetails.taskInfo.project.deadline != null
                                                ? formatShortDate(taskDetails.taskInfo.project.deadline.toString())
                                                : 'N/A';
                                          } else {
                                            // Handle the case where task details are not fetched
                                            Utils.snackbarFailed('Failed to fetch task details.');
                                          }

                                          // Navigate to TaskDetailsScreen regardless of success or failure
                                          Get.to(() => TaskDetailsScreen(taskItem: {
                                            'subject': item.currentTask?.task?.subject ?? 'No task subject',
                                            'duration': duration,
                                            'startOn': startOn,
                                            'endOn': endOn,
                                            'taskType': taskType,
                                            'status': status,
                                            'deadline': deadline,
                                            'priority': priority,
                                            'assignedTo': assignedTo,
                                            'createdBy': createdBy,
                                            'projectName': projectName,
                                            'projectStartDate': projectStartDate,
                                            'projectEndDate': projectEndDate,
                                            'projectId': projectId,
                                          }));
                                        },
                                        child: Text(
                                          item.currentTask?.task?.subject ?? 'No task subject',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.access_time, size: 16, color: Colors.orange),
                                          const SizedBox(width: 5),
                                          Text(
                                            item.currentTask?.task?.estimatedMinutes != null
                                                ? '${item.currentTask!.task!.estimatedMinutes} min'
                                                : 'No time estimate',
                                            style: const TextStyle(color: Colors.orange),
                                          ),
                                        ],
                                      ),
                                      const Divider(thickness: 1, color: Colors.grey),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Today Task Report',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Obx(() {
                        if (_viewModel.loading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (_viewModel.taskReportResponse.value.items == null ||
                            _viewModel
                                .taskReportResponse.value.items!.isEmpty) {
                          return const Center(
                              child: Text('No task reports found.'));
                        }
                        final item =
                        _viewModel.taskReportResponse.value.items![0];

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _viewModel
                                .taskReportResponse.value.items!.length,
                            itemBuilder: (context, index) {
                              final item = _viewModel
                                  .taskReportResponse.value.items![index];
                              final createdAt = item.currentTask?.createdAt;
                              _startTime = createdAt != null
                                  ? DateTime.parse(createdAt)
                                  : DateTime.now();
                              _elapsedSeconds = DateTime.now()
                                  .difference(_startTime)
                                  .inSeconds;

                              _timer = Timer.periodic(
                                  const Duration(seconds: 1), (timer) {
                                setState(() {
                                  _elapsedSeconds = DateTime.now()
                                      .difference(_startTime)
                                      .inSeconds;
                                });
                              });

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row containing name and totalTime
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.user ?? 'Unknown User',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.alarm,
                                            color: Color(0xFFEBA801),
                                            size: 14,
                                          ),
                                          const SizedBox(width: 6.0),
                                          Text(
                                            item.currentTask?.task?.startDate !=
                                                null
                                                ? formatTimeDifference(item
                                                .currentTask!
                                                .task!
                                                .startDate!)
                                                : 'No task subject',
                                            // You can replace this with actual data if available
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFEBA801),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Email below the name
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    item.email ?? 'No email',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.timer,
                                        color: Color(0xFF8E9711),
                                        size: 12,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        item.currentTask?.task
                                            ?.estimatedMinutes !=
                                            null
                                            ? '${(item.currentTask!.task!.estimatedMinutes! / 60).floor()} hours'
                                            : 'N/A',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF8E9711),
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.assignment,
                                        color: AllColors.mediumPurple,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Container(
                                        // Remove fixed width for dynamic sizing
                                        height: 17.0,
                                        // Keep the fixed height
                                        decoration: BoxDecoration(
                                          color: AllColors.lighterPurple,
                                          borderRadius: BorderRadius.circular(
                                              12), // Optional: Add rounded corners
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        // Add horizontal padding to adjust the content
                                        child: Text(
                                          item.taskList != null &&
                                              item.taskList!.isNotEmpty
                                              ? '${item.taskList!.length}' // Displays the count of tasks in taskList
                                              : '0',
                                          // If no tasks are available, display a default message
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            // Font size for better visibility
                                            fontWeight: FontWeight.bold,
                                            color: AllColors
                                                .mediumPurple, // Use the specified color
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.taskList != null &&
                                        item.taskList!.isNotEmpty
                                        ? '${item.taskList!.length}' // Displays the count of tasks in taskList
                                        : '0',
                                    // If no tasks are available, display a default message
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        // Font size for better visibility
                                        fontWeight: FontWeight.bold,
                                        color: AllColors
                                            .darkRed // Use the specified color
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        item.currentTask?.task?.subject ??
                                            'No task subject',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            item.currentTask?.task?.startDate !=
                                                null
                                                ? formatDateWithDay(item
                                                .currentTask!
                                                .task!
                                                .startDate!)
                                                : 'No task subject',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicWidth(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 20,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      // Adds padding on both left and right sides
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          // Get the image based on the task's priority
                                          Image.asset(
                                            _priorityImages[item
                                                .currentTask?.task?.priority
                                                ?.toLowerCase()] ??
                                                _priorityImages[
                                                'N/A'] ?? // Fallback to 'Low' if still not found
                                                'assets/svg/error.svg',
                                            height: 10,
                                            width: 20,
                                          ),
                                          Text(
                                            (item.currentTask?.task?.priority ??
                                                'N/A')
                                                .isNotEmpty
                                                ? '${(item.currentTask?.task?.priority ?? 'N/A')[0].toUpperCase()}${(item.currentTask?.task?.priority ?? 'N/A').substring(1)}'
                                                : 'N/A',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(thickness: 1.0, height: 20.0),
                                ],
                              );
                            });
                      }),
                      PaginationDropdownWidget(
                        maxNumber: 100,
                        initialDropdownValue: selectedLimit,
                        onDropdownChanged: (newValue) {
                          setState(() {
                            selectedLimit = newValue;
                            _fetchTaskReports();
                          });
                        },
                        onPageChanged: (newPage) {
                          print('Selected page: $newPage');
                        },
                        selectedPageColor: Colors.white,
                        unselectedPageColor: Colors.transparent,
                        selectedPageTextColor: Colors.black,
                        unselectedPageTextColor: Colors.black,
                        dropdownBorderColor: Colors.grey,
                        dropdownBorderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _formatElapsedTime(int seconds) {
    if (seconds <= 0) {
      return 'N/A';
    }
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
