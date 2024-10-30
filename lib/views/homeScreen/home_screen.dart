import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/customerScreens/companiesScreen/all_companies_screen.dart';
import 'package:websuites/views/customerScreens/customerList/list_screen.dart';
import 'package:websuites/views/leadScreens/Setting/SettingScreen.dart';
import 'package:websuites/views/leadScreens/leadActivities/lead_activities_screen.dart';
import 'package:websuites/views/leadScreens/leadList/leadlist_screen.dart';
import 'package:websuites/views/leadScreens/leadMaster/lead_master_screen.dart';
import '../../Responsive/Custom_Drawer.dart';
import '../../data/models/controller.dart';
import '../../resources/strings/strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/responsive/bodies/responsive scaffold.dart';
import '../Dashboard/DashboardScreen.dart';

import '../leadScreens/createNewLead/create_newLead_screen.dart';
import '../leadScreens/searchGoogleLeads/search_google_leads.dart';
import '../leadScreens/trashLead/trash_lead_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScreenController _screenController = Get.put(ScreenController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;
  bool isCollapsed = false;

  final List<Widget> _screens = [
    Dashboardscreen(),
    CreateNewLeadScreen(),
    SearchGoogleLeads(),
    LeadListScreen(),
    LeadActivitiesScreen(),
    TrashLeadScreen(),
    SettingScreen(),
    LeadMasterScreen(),
    CustomersListScreen(),
    CustomerCompaniesScreen(),
  ];

  void onDrawerItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (MediaQuery.of(context).size.width < 500) {
      Navigator.pop(context);
    }
  }

  void toggleDrawerCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  String getAppBarTitle() {
    switch (selectedIndex) {
      case 1:
        return Strings.createNewLead;
      case 2:
        return Strings.searchGoogleLeads;
      case 3:
        return Strings.leadList;
      case 4:
        return Strings.leadActivities;
      case 5:
        return Strings.leadList;
      case 6:
        return Strings.setting;
      case 7:
        return Strings.leadMaster;
      case 8:
        return Strings.master;
      case 9:
        return 'Customer Companies';
      default:
        return 'Hello, Avdhesh !';
    }
  }

  Widget _buildTabletContent() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back arrow icon on tablet/desktop for non-dashboard screens
                    if (Get.width >= 500 && selectedIndex != 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0; // Navigate back to the dashboard
                          });
                        },
                      ),
                    Expanded(
                      child: Text(
                        getAppBarTitle(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (selectedIndex == 4) // Additional icons for Lead Activities
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.filter_list_sharp, color: AllColors.mediumPurple),
                                onPressed: () {
                                  // Handle filter action
                                },
                              ),
                              Text("Filter"),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Handle details action
                                },
                                child: Text(Strings.details),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios, color: AllColors.mediumPurple, size: 17),
                                onPressed: () {
                                  // Handle forward action
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: IndexedStack(
              index: selectedIndex,
              children: _screens,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTabletOrDesktop = MediaQuery.of(context).size.width >= 500;

    return ResponsiveScaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      scaffoldKey: _scaffoldKey,
      appBar: !isTabletOrDesktop
          ? AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                getAppBarTitle(),
                style: const
                TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        actions: [
          if (selectedIndex == 4)
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Handle notifications
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Handle more options
                  },
                ),
              ],
            ),
        ],
      )
          : null,
      drawer: !isTabletOrDesktop
          ? Drawer(
        child: CustomDrawer(
          selectedIndex: selectedIndex,
          onItemSelected: onDrawerItemTapped,
          isCollapsed: isCollapsed,
          onCollapseToggle: toggleDrawerCollapse,
          isTabletOrDesktop: isTabletOrDesktop,
        ),
      )
          : null,
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            if (isTabletOrDesktop)
              CustomDrawer(
                selectedIndex: selectedIndex,
                onItemSelected: onDrawerItemTapped,
                isCollapsed: isCollapsed,
                onCollapseToggle: toggleDrawerCollapse,
                isTabletOrDesktop: isTabletOrDesktop,
              ),
            Expanded(
              child: isTabletOrDesktop
                  ? _buildTabletContent()
                  : Container(
                color: Colors.grey[100],
                child: IndexedStack(
                  index: selectedIndex,
                  children: _screens,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
