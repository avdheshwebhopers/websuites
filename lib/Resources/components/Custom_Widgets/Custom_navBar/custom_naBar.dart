import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/Views/leadMaster_Screen.dart';
import 'package:websuites/Views/leadlist_screen.dart';
import 'package:websuites/Views/new_LeadList_screen.dart';
import 'package:websuites/Views/upcoming_screen.dart';
import '../../../Assets/app_Icons.dart';
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

  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
    Get.offAll(() => _screens[index]);
  }


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shadowColor: AppColors.blackColor,
      height: Get.height/15,
      color: AppColors.lighterPurple,
      shape: CircularNotchedRectangle(),
      notchMargin: 0,
      child:
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => _onItemTapped(0),
            child: Image.asset(AppIcons.navDashboard, scale: 22 ,
              color: selectedIndex == 0 ? AppColors.mediumPurple : AppColors.grey,),
          ),
          InkWell(
            onTap: ()=> _onItemTapped(1),
            child: Image.asset(AppIcons.navChat, scale: 22,
                color: selectedIndex == 1 ? AppColors.mediumPurple : AppColors.grey),
          ),
          SizedBox(width: 10), // The space for the floating action button
          InkWell(
            onTap: ()=> _onItemTapped(2),
            child: Image.asset(AppIcons.navNotification2, scale: 22,
                color: selectedIndex == 2 ? AppColors.mediumPurple : AppColors.grey),
          ),
          InkWell(
            onTap: ()=> _onItemTapped(3),
            child:  Image.asset(AppIcons.navAccount3, scale: 22,
                color: selectedIndex == 3 ? AppColors.mediumPurple : AppColors.grey),
          )
        ],
      ),
    );

  }
}