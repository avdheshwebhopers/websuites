import 'package:flutter/material.dart';

import '../../../../appColors/app_colors.dart';
import 'expandedListTile.dart';

class CustomListTile extends StatelessWidget {
  final String leadIconImage;
  final String title;
  final Function() onTap;
  final bool isCollapsed;
  final int selectedIndex;

  const CustomListTile({
    Key? key,
    required this.leadIconImage,
    required this.title,
    required this.onTap,
    this.isCollapsed = false,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Update the selection logic to highlight the "Dashboard" when selectedIndex is 0
    bool isSelected = (selectedIndex == 0 && title == 'Dashboard') || SelectedMenuItems.selectedChild == title;

    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
      leading: Image.asset(leadIconImage),
      title: isCollapsed
          ? null
          : Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: isSelected ? AllColors.mediumPurple : AllColors.welcomeColor,
        ),
      ),
      onTap: () {
        SelectedMenuItems.selectedChild = title; // Update selected child
        onTap(); // Call the onTap function
      },
    );
  }
}




