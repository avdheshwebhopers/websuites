import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/button/CustomButton.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/components/widgets/navBar/custom_navBar.dart';
import 'package:websuites/utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../Responsive/Custom_Drawer.dart';
import '../../data/models/responseModels/dashboard/main_dashboard/charts/lead-cards/MainDashLeadCardListRespoModel.dart';
import '../../data/models/responseModels/login/login_response_model.dart';

import '../../utils/container/container_Utils/ContainerUtils.dart';
import '../../viewModels/main/dashboard/main_dashboard/MainDashboardListViewModel.dart';
import '../../viewModels/userlistViewModel/userlist_viewModel.dart';
import '../../viewModels/master/divisions/master_divisions_viewModel.dart';
import '../../viewModels/saveToken/save_token.dart';

import '../../utils/fontfamily/FontFamily.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class MainDashBoardScreen extends StatefulWidget {
  const MainDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<MainDashBoardScreen> createState() => _MainDashBoardScreenState();
}

class _MainDashBoardScreenState extends State<MainDashBoardScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  late final MainDashboardListViewModel _dashboardListController;
  late final UserListViewModel userListViewModel;
  late final MasterDivisionsViewModel divisionViewModel;
  String userName = '';
  String? userEmail = "";
  final SaveUserData userPreference = SaveUserData();

  @override
  void initState() {
    super.initState();
    _dashboardListController = Get.put(MainDashboardListViewModel(), permanent: true);
    userListViewModel = Get.put(UserListViewModel(), permanent: true);
    divisionViewModel = Get.put(MasterDivisionsViewModel(), permanent: true);
    fetchUserData().then((_) {
      Future.wait([
        userListViewModel.userListApi(),
        divisionViewModel.masterDivisions(context),
      ]);
    });
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      setState(() {
        userName = response.user?.firstName ?? '';
        userEmail = response.user?.email ??'';
      });
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: CustomDrawer(
      //   userName: userName,
      //   phoneNumber: userEmail ?? '',
      //   version: 'VERSION 1.0.12',
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            const Text("Dashboard"),
            const Spacer(),
            IconButton(
              onPressed: () => _showFilterBottomSheet(context),
              icon: const Icon(Icons.filter_list_sharp),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (_dashboardListController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () => _dashboardListController.fetchDashboardData(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DASHBOARD',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _dashboardListController.selectedDashboardCharts.value?.length ?? 0,
                      itemBuilder: (context, index) {
                        final chart = _dashboardListController.selectedDashboardCharts.value![index];
                        String cleanChart = chart
                            .replaceAll('_', ' ')
                            .replaceAll('*', '')
                            .replaceAll('chart', '')
                            .replaceAll('cards', '')
                            .trim()
                            .toUpperCase();

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ContainerUtils(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cleanChart, style: const TextStyle(fontSize: 18)),

                                if (index == 0 && _dashboardListController.leadCards.isNotEmpty)
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _dashboardListController.leadCards.length, // Use leadSources length
                                      itemBuilder: (context, index) {
                                        final leadCards = _dashboardListController.leadCards[index]; // Get the lead source at the current index
                                        return
                                          Row(

                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: ContainerUtils(
                                                    child:

                                                    Column(
                                                      children: [
                                                        Text("${leadCards.inProgress ?? 'N/A'}"),
                                                        Text("${leadCards.deadLead ?? 'N/A'}"),
                                                        Text("${leadCards.repeat ?? 'N/A'}"),
                                                        Text("${leadCards.toDoLead ?? 'N/A'}"),
                                                        Text("${leadCards.unassigned ?? 'N/A'}"),
                                                        Text("${leadCards.unhandled ?? 'N/A'}"),

                                                      ],
                                                    )


                                                ),
                                              ),
                                            ],
                                          );
                                      },
                                    );
                                  }),
                                if (index == 2 && _dashboardListController.leadReminder.isNotEmpty)
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _dashboardListController.leadReminder.length, // Use leadSources length
                                      itemBuilder: (context, index) {
                                        final leadReminder = _dashboardListController.leadReminder[index]; // Get the lead source at the current index
                                        return
                                          Row(

                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: ContainerUtils(
                                                    child:

                                                    Column(
                                                      children: [
                                                        Text("${leadReminder.today ?? 'N/A'}"),
                                                        Text("${leadReminder.missing ?? 'N/A'}"),
                                                        Text("${leadReminder.upcomming ?? 'N/A'}"),
                                                        Text(leadReminder.data.isEmpty ? 'N/A' : leadReminder.data.toString(),)


                                                      ],
                                                    )


                                                ),
                                              ),
                                            ],
                                          );
                                      },
                                    );
                                  }),


                                if (index == 3 && _dashboardListController.leadCustomer.isNotEmpty)
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _dashboardListController.leadCustomer.length,
                                      itemBuilder: (context, index) {
                                        final leadCustomer = _dashboardListController.leadCustomer[index];
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                                              child: ContainerUtils(
                                                child: Column(
                                                  children: [
                                                    Text("Services Running: ${leadCustomer.servicesRunning ?? 'N/A'}"),
                                                    Text("Project Not Started: ${leadCustomer.projectNotStarted ?? 'N/A'}"),
                                                    Text("Project In Progress: ${leadCustomer.projectInProgress ?? 'N/A'}"),
                                                    Text("Project On Hold: ${leadCustomer.projectOnHold ?? 'N/A'}"),
                                                    Text("No Services: ${leadCustomer.noServices ?? 'N/A'}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }),


                                if (index == 4 && _dashboardListController.leadSources.isNotEmpty)
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _dashboardListController.leadSources.length, // Use leadSources length
                                      itemBuilder: (context, index) {
                                        final leadSource = _dashboardListController.leadSources[index]; // Get the lead source at the current index
                                        return
                                          Row(

                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: ContainerUtils(
                                                  child:

                                                  Text("${leadSource.name ?? 'N/A'}"),


                                                ),
                                              ),
                                            ],
                                          );
                                      },
                                    );
                                  }),

                                if (index == 5 && _dashboardListController.leadCustomerReminder.isNotEmpty)
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: _dashboardListController.leadCustomerReminder.length, // Use leadSources length
                                      itemBuilder: (context, index) {
                                        final leadCustomerReminder = _dashboardListController.leadCustomerReminder[index]; // Get the lead source at the current index
                                        return
                                          Row(

                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: ContainerUtils(
                                                  child:

                                                  Column(
                                                    children: [
                                                      Text("${leadCustomerReminder.missing ?? 'N/A'}"),
                                                      Text("${leadCustomerReminder.today ?? 'N/A'}"),
                                                      Text("${leadCustomerReminder.data.isEmpty ? 'N/A':  leadCustomerReminder.data.toString()}"),

                                                      Text("${leadCustomerReminder.upcomming ?? 'N/A'}"),

                                                    ],
                                                  ),


                                                ),
                                              ),
                                            ],
                                          );
                                      },
                                    );
                                  }),



                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    String? selectedTeamValue = _dashboardListController.isTeamFilter.value ? "With Team" : "Individual";
    String? selectedUser;
    String? selectedDivision;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            final bool isLoading = userListViewModel.userList.isEmpty || divisionViewModel.divisions.isEmpty;
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  CreateNewLeadScreenCard(
                    hintText: '',
                    categories: const ["Individual", "With Team"],
                    value:selectedTeamValue ,
                    // initialValue: selectedTeamValue,  it will optional you can pass parameter when need !
                    onCategoryChanged: (value) => selectedTeamValue = value,
                  ),
                  const SizedBox(height: 10),
                  CreateNewLeadScreenCard(
                    hintText: 'Select User',
                    categories: userListViewModel.userList
                        .map((user) => '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim())
                        .toList(),
                    onCategoryChanged: (value) => selectedUser = value,
                  ),
                  const SizedBox(height: 10),
                  CreateNewLeadScreenCard(
                    hintText: 'Select Division',
                    categories: divisionViewModel.divisions.map((division) => division.name ?? '').toList(),
                    onCategoryChanged: (value) => selectedDivision = value,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        backgroundColor: Colors.grey,
                        width: 80,
                        height: 30,
                        borderRadius: 25,
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro),
                        ),
                      ),
                      CustomButton(
                        width: 80,
                        height: 30,
                        borderRadius: 25,
                        onPressed: () {
                          _dashboardListController.applyFilters(
                            userId: selectedUser,
                            division: selectedDivision,
                            isTeam: selectedTeamValue == "With Team",
                            dateRange: null,
                          );
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: FontFamily.sfPro),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
