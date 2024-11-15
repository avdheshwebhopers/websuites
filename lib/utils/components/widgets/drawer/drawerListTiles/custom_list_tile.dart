import 'package:flutter/material.dart';
import '../../../../appColors/app_colors.dart';

// Static class to manage selected menu items
class SelectedMenuItems {
  static String? selectedChild;
}

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
    // Check if this item is selected
    bool isSelected = (selectedIndex == 0 && title == 'Dashboard') ||
        SelectedMenuItems.selectedChild == title;

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      leading: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isSelected ? AllColors.mediumPurple : AllColors.welcomeColor,
          BlendMode.srcIn,
        ),
        child: Image.asset(
          leadIconImage,
          width: 24,
          height: 24,
        ),
      ),
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
      // Add hover effect
      hoverColor: AllColors.mediumPurple.withOpacity(0.1),
      // Add selected background color
      tileColor: isSelected ? AllColors.mediumPurple.withOpacity(0.1) : null,
    );
  }
}