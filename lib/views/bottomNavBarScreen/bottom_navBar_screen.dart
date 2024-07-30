import 'package:flutter/material.dart';

import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';



class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,

      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton:

      FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        backgroundColor: AllColors.vividPurple,
        child: Icon(Icons.search, size: 27, color: AllColors.whiteColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
