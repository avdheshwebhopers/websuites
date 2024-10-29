import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Responsive/Custom_Drawer.dart';
import '../../../controler/viewModels/leadScreens/lead_activity/lead_activity.dart';
import '../../../controler/viewModels/saveToken/save_token.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../../utils/responsive/bodies/Responsive.dart';
import '../../../utils/responsive/bodies/responsive scaffold.dart';


import 'widgets/leadActivitiesCard/lead_activities_card.dart';

class LeadActivitiesScreen extends StatefulWidget {
  const LeadActivitiesScreen({super.key});

  @override
  State<LeadActivitiesScreen> createState() => _LeadActivitiesScreenState();
}

class _LeadActivitiesScreenState extends State<LeadActivitiesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();
  final LeadActivityViewModel _leadActivityViewModel = Get.put(LeadActivityViewModel());
  final ScreenController _screenController = Get.put(ScreenController());
  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    // Check if the lead activity response already has data
    if (_leadActivityViewModel.leadActivityResponse.value.items == null || _leadActivityViewModel.leadActivityResponse.value.items!.isEmpty) {
      _leadActivityViewModel.leadActivityList(context); // Fetch data once during initialization
    }
  }

  Future<void> _fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser ();
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

  // Helper method to create a LeadActivitiesScreenCard
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
      // scaffoldKey: _globalKey,
      backgroundColor: AllColors.whiteColor,
      // bottomNavigationBar: CustomBottomNavBar(),
      // drawer:   CustomDrawer(
      //   selectedIndex: 0, // Customize as needed
      //   // onItemSelected: (index) {
      //   //   // Handle item selection
      //   // },
      //   isCollapsed: false,
      //   onCollapseToggle: () {
      //     // Handle drawer collapse/expand
      //   },
      //   isTabletOrDesktop: screenWidth >= 500, userName: '', phoneNumber: '', version: '', onTap: (int ) {  },
      // ),
      body: Obx(() {
        if (_leadActivityViewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_leadActivityViewModel.leadActivityResponse.value.items?.isEmpty ?? true) {
          return Center(child: Text("No leads found"));
        }

        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    // const SizedBox(height: 125),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 800) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (_leadActivityViewModel.leadActivityResponse.value.items!.length / 2).ceil(),
                            itemBuilder: (context, index) {
                              final firstItem = _leadActivityViewModel.leadActivityResponse.value.items![index * 2];
                              final secondItem = (index * 2 + 1 < _leadActivityViewModel.leadActivityResponse .value.items!.length)
                                  ? _leadActivityViewModel.leadActivityResponse.value.items![index * 2 + 1]
                                  : null;

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _buildLeadActivityCard(firstItem),
                                  ),
                                  const SizedBox(width: 15),
                                  if (secondItem != null)
                                    Expanded(
                                      child: _buildLeadActivityCard(secondItem),
                                    ),
                                ],
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _leadActivityViewModel.leadActivityResponse.value.items!.length,
                            itemBuilder: (context, index) {
                              final item = _leadActivityViewModel.leadActivityResponse.value.items![index];
                              return _buildLeadActivityCard(item);
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // CustomAppBar(
            //   child: Row(
            //     children: [
            //       if (Get.width < 500)
            //         InkWell(
            //           onTap: () => _globalKey.currentState?.openDrawer(),
            //           child: const Icon(Icons.menu_sharp, size: 25),
            //         ),
            //       const SizedBox(width: 12),
            //       TextStyles.w600_universal(fontSize: 18, color: AllColors.blackColor, context, Strings.leadActivities),
            //       const Spacer(),
            //       Row(
            //         children: [
            //           // Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey),
            //           const SizedBox(width: 2),
            //           TextStyles.w400_13(color: AllColors.lightGrey, context, Strings.filter),
            //           const SizedBox(width: 13),
            //           TextStyles.w400_13(color: AllColors.blackColor, context, Strings.details),
            //           const Icon(Icons.keyboard_arrow_right, size: 20),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}