import 'package:flutter/material.dart';

import '../../Assets/app_fonts.dart';
import '../app_colors.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
      leading: Icon(icon, size: 16, color: AppColors.lightGrey,),
      title: Text(title,
          style: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.nunitoRegular,
              fontWeight: FontWeight.w300,
              color: AppColors.welcomeColor)),
      onTap: onTap,
      );
  }
}

class CustomListTileTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTileTab({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
        leading: Icon(icon, size: 20, color: AppColors.lightGrey,),
        title: Text(title,
            style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.nunitoRegular,
                fontWeight: FontWeight.w300,
                color: AppColors.blackColor)),
        onTap: onTap,

      );
  }
}



