import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controler/viewModels/leadScreens/lead_activity/lead_activity.dart';
import '../../../controler/viewModels/saveToken/save_token.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../utils/appColors/app_colors.dart';
import 'widgets/leadActivitiesCard/lead_activities_card.dart';

class LeadActivitiesScreen extends StatefulWidget {
  const LeadActivitiesScreen({super.key});

  @override
  State<LeadActivitiesScreen> createState() => _LeadActivitiesScreenState();
}

class _LeadActivitiesScreenState extends State<LeadActivitiesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final LeadActivityViewModel _leadActivityViewModel = Get.put(LeadActivityViewModel());
  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    if (_leadActivityViewModel.leadActivityResponse.value.items == null ||
        _leadActivityViewModel.leadActivityResponse.value.items!.isEmpty) {
      _leadActivityViewModel.leadActivityList(context);
    }
  }

  Future<void> _fetchUserData() async {
    try {
      LoginResponseModel response = await SaveUserData().getUser();
      userEmail = response.user?.email;
      userName = response.user?.first_name;
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  String formatReminderDate(String? reminder) {
    if (reminder == null || reminder.isEmpty) {
      return '';
    }
    try {
      DateTime dateTime = DateTime.parse(reminder);
      return DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      print('Error parsing date: $e');
      return reminder;
    }
  }

  Widget _buildLeadActivityCard(item) {
    return LeadActivitiesScreenCard(
      title: '${item.lead?.firstName ?? "Unknown"}',
      companyName: '${item.lead?.organization ?? "Unknown Company"}',
      actionDate: formatReminderDate(item.createdAt),
      activity: item.activity ?? 'Unknown Activity',
      info: item.remark ?? 'No Remark',
      request_Location: 'View',
      action_by: item.createdBy?.firstName ?? 'Unknown',
      status: item.subActivity?.name ?? 'Unknown Status',
      created_Date: formatReminderDate(item.reminder),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,


      body: Obx(() {
        if (_leadActivityViewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_leadActivityViewModel.leadActivityResponse.value.items?.isEmpty ?? true) {
          return Center(child: Text("No leads found"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final items = _leadActivityViewModel.leadActivityResponse.value.items!;
                  if (constraints.maxWidth > 800) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (items.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final firstItem = items[index * 2];
                        final secondItem = (index * 2 + 1 < items.length) ? items[index * 2 + 1] : null;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: _buildLeadActivityCard(firstItem)),
                            const SizedBox(width: 15),
                            if (secondItem != null) Expanded(child: _buildLeadActivityCard(secondItem)),
                          ],
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return _buildLeadActivityCard(items[index]);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
