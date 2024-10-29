import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/customerScreens/companiesScreen/all_companies_screen.dart';
import 'package:websuites/views/customerScreens/customerList/list_screen.dart';
import 'package:websuites/views/leadScreens/Setting/SettingScreen.dart';
import 'package:websuites/views/leadScreens/leadActivities/lead_activities_screen.dart';
import 'package:websuites/views/leadScreens/leadList/leadlist_screen.dart';
import 'package:websuites/views/leadScreens/leadMaster/lead_master_screen.dart';
import '../resources/iconStrings/icon_strings.dart';
import '../resources/strings/strings.dart';
import '../resources/textStyles/text_styles.dart';
import '../views/leadScreens/createNewLead/create_newLead_screen.dart';
import '../views/Dashboard/DashboardScreen.dart';
import '../views/leadScreens/searchGoogleLeads/search_google_leads.dart';
import '../views/leadScreens/trashLead/trash_lead_screen.dart';
import 'Custom_Drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        return 'Create New Lead';
      case 2:
        return 'Search Google Leads';
      case 3:
        return 'Lead List';
      case 4:
        return 'Lead Activities';
      case 5:
        return 'Trash Lead';
      case 6:
        return 'Settings';
      case 7:
        return 'Lead Master';
      case 8:
        return 'Customer List';
      case 9:
        return 'Customer Companies';
      default:
        return 'Dashboard';
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
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    if (selectedIndex > 0)
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                      ),
                    Text(
                      getAppBarTitle(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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

    return Scaffold(
      appBar: !isTabletOrDesktop
          ? AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          getAppBarTitle(),
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
        color : Colors.white,
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
    );
  }
}