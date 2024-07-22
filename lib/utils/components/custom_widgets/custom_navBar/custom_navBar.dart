import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Views/Lead_screen/lead_master_screen.dart';
import 'package:websuites/Views/Lead_screen/leadlist_screen.dart';
import 'package:websuites/Views/Lead_screen/create_newLead_screen.dart';
import 'package:websuites/Views/upcoming_screen.dart';
import '../../../../Resources/all_icons/all_Icons.dart';
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
    CreateNewLeadScreen(),
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
      color: AllColors.whiteColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 0,
      child:
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => _onItemTapped(0),
            child: Image.asset(AllIcons.navDashboard, scale: 22 ,
              color: selectedIndex == 0 ? AllColors.mediumPurple : AllColors.grey,),
          ),
          InkWell(
            onTap: ()=> _onItemTapped(1),
            child: Image.asset(AllIcons.navChat, scale: 22,
                color: selectedIndex == 1 ? AllColors.mediumPurple : AllColors.grey),
          ),
          SizedBox(width: 10), // The space for the floating action button
          InkWell(
            onTap: ()=> _onItemTapped(2),
            child: Image.asset(AllIcons.navNotification2, scale: 22,
                color: selectedIndex == 2 ? AllColors.mediumPurple : AllColors.grey),
          ),
          InkWell(
            onTap: ()=> _onItemTapped(3),
            child:  Image.asset(AllIcons.navAccount3, scale: 22,
                color: selectedIndex == 3 ? AllColors.mediumPurple : AllColors.grey),
          )
        ],
      ),
    );

  }
}