import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/Views/leadMaster_Screen.dart';
import 'package:websuites/Views/leadlist_screen.dart';
import 'package:websuites/Views/new_LeadList_screen.dart';
import 'package:websuites/Views/upcoming_screen.dart';

import '../../app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {


  int selectedIndex = 0;

  final List<Widget> _screens = [
    UpcomingScreen(),
    LeadListScreen(),
    LeadMasterScreen(),
    New_LeadList_screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    Get.to((_screens[index]));
  }


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: AppColors.blackColor,
      height: Get.height/15,
      color: AppColors.lightPurple,
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child:
      Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(Icons.dashboard, size: 25,
                color: selectedIndex == 0 ? AppColors.whiteColor : AppColors.lightGrey,
              ),
              onPressed:() => _onItemTapped(0)
          ),
          IconButton(
              icon: Icon(Icons.chat_outlined, size: 25,
                color: selectedIndex == 1 ? AppColors.whiteColor : AppColors.lightGrey,
              ),
              onPressed: ()=> _onItemTapped(1)
          ),
          SizedBox(width: 40), // The space for the floating action button
          IconButton(
            icon: Icon(Icons.notifications_outlined, size: 25,
              color: selectedIndex == 2 ? AppColors.whiteColor : AppColors.lightGrey,
            ),
            onPressed: () => _onItemTapped(2),

          ),
          IconButton(
            icon: Icon(Icons.person_2_outlined, size: 25,
              color: selectedIndex == 3 ? AppColors.whiteColor : AppColors.lightGrey,
            ),
            onPressed: () => _onItemTapped(3),
          ),
        ],
      ),
    );






  }
}