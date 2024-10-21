import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/iconStrings/icon_strings.dart';
import '../../../../views/leadScreens/createNewLead/create_newLead_screen.dart';
import '../../../../views/leadScreens/leadList/leadlist_screen.dart';
import '../../../../views/leadScreens/leadMaster/lead_master_screen.dart';
import '../../../../views/upcomingScreen/upcoming_screen.dart';
import '../../../appColors/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // Use a static variable to persist the selected index across rebuilds
  static int selectedIndex = 0;

  final List<Widget> _screens = [
    UpcomingScreen(),
    LeadListScreen(),
    LeadMasterScreen(),
    CreateNewLeadScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    Get.offAll(() => _screens[index]);
  }

  Color _getItemColor(int index) {
    return selectedIndex == index ? AllColors.mediumPurple : AllColors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: Get.height / 15,
      color: AllColors.whiteColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => _onItemTapped(0),
            child: Image.asset(
              IconStrings.navDashboard,
              scale: 22,
              color: _getItemColor(0),
            ),
          ),
          InkWell(
            onTap: () => _onItemTapped(1),
            child: Image.asset(
              IconStrings.navChat,
              scale: 22,
              color: _getItemColor(1),
            ),
          ),
          SizedBox(width: 10), // The space for the floating action button
          InkWell(
            onTap: () => _onItemTapped(2),
            child: Image.asset(
              IconStrings.navNotification2,
              scale: 22,
              color: _getItemColor(2),
            ),
          ),
          InkWell(
            onTap: () => _onItemTapped(3),
            child: Image.asset(
              IconStrings.navAccount3,
              scale: 22,
              color: _getItemColor(3),
            ),
          )
        ],
      ),
    );
  }
}