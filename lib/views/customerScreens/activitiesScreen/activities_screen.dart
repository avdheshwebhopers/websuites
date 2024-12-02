import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../viewModels/customerScreens/activities/activities_list/activities_list.dart';
import '../../../viewModels/leadScreens/lead_activity/lead_activity.dart';

import '../../../viewModels/saveToken/save_token.dart';
import '../../../views/customerScreens/activitiesScreen/widgets/ActivitiesScreenCard/activities_screen_card.dart';

import 'dailySalesReport/DailySalesReport.dart';

class CustomersActivitiesScreen extends StatelessWidget {
  final CustomerActivitiesListViewModel viewModel = Get.put(CustomerActivitiesListViewModel());
  final LeadActivityViewModel _leadActivityViewModel = Get.put(LeadActivityViewModel());
  final SaveUserData userPreference = SaveUserData();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final RxString userName = "Guest".obs;
  final RxString userEmail = "guest@example.com".obs;
  final RxString selectedButton = "All".obs;

  final List<Map<String, dynamic>> buttonData = [
    {"text": "All", "icon": Icons.list_alt},
    {"text": "Daily Sales Report", "icon": Icons.bar_chart},
    {"text": "No Activities", "icon": Icons.pending_actions},
    {"text": "Customers Report", "icon": Icons.check_circle_outline},
    {"text": "Unique Meeting", "icon": Icons.schedule},
    {"text": "Status Report", "icon": Icons.group_work},
  ];

  CustomersActivitiesScreen({Key? key}) : super(key: key) {
    fetchUserData();
    viewModel.customerActivityList(Get.context!);
  }

  Future<void> fetchUserData() async {
    try {
      final response = await userPreference.getUser ();
      userName.value = response.user?.first_name ?? 'Guest';
      userEmail.value = response.user?.email ?? 'guest@example.com';
    } catch (e) {
      debugPrint('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      key: _globalKey,
      body: Column(
        children: [
          // Button Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Row(
                  children: buttonData.map((data) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IntrinsicWidth(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: selectedButton.value == data["text"]
                                ? AllColors.background_green
                                : AllColors.lightPurple,
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(19),
                              onTap: () {
                                selectedButton.value = data["text"] as String;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      data["icon"] as IconData,
                                      color: selectedButton.value == data["text"]
                                          ? AllColors.text__green
                                          : AllColors.mediumPurple,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      data["text"] as String,
                                      style: TextStyle(
                                        color: selectedButton.value == data["text"]
                                            ? AllColors.text__green
                                            : AllColors.mediumPurple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          // Content
          Expanded(
            child: Obx(() {
              if (viewModel.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (viewModel.customerActivities.isEmpty) {
                return const Center(child: Text('No activities found'));
              }

              switch (selectedButton.value) {
                case "All":
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: viewModel.customerActivities.map((item) {
                          return CustomerActivitiesScreenCard(
                            companyName: item.customer?.organization ?? 'N/A',
                            title: item.meetingWithName ?? 'No Meeting Contact',
                            actionDate: item.createdAt != null
                                ? DateFormat('EEE, MMM dd, yyyy').format(item.createdAt!)
                                : 'Not Available',
                            activity: item.activity ?? 'Unknown Activity',
                            info: item.remark ?? 'Not Available',
                            request_Location: 'View',
                            action_by: item.createdBy?.firstName ?? 'Unknown',
                            status: item.subActivity?.name ?? 'Unknown Status',
                            created_Date: item.reminder != null &&
                                item.reminder.toString().isNotEmpty
                                ? DateFormat('EEE, MMM dd, yyyy')
                                .format(DateTime.parse(item.reminder.toString()))
                                : 'Not Available',
                          );
                        }).toList(),
                      ),
                    ),
                  );
                case "Daily Sales Report":
                  return ActivityDailySalesReportScreen();
                case "No Activities":
                  return const Center(child: Text("Pending Activities"));
                case "Customers Report":
                  return const Center(child: Text("Completed Activities"));
                case "Unique Meeting":
                  return const Center(child: Text("Scheduled Activities"));
                case "Status Report":
                  return const Center(child: Text("Team Activities Overview"));
                default:
                  return const Center(child: Text("Unknown section"));
              }
            }),
          ),
        ],
      ),
    );
  }
}