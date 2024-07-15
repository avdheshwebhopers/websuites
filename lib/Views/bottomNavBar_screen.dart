import 'package:flutter/material.dart';

import '../Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import '../Resources/components/app_colors.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton:

      FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.search, size: 27, color: AppColors.whiteColor,),
        backgroundColor: AppColors.vividPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
