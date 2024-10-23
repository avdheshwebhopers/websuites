import 'package:flutter/material.dart';

import '../../../../utils/appColors/app_colors.dart';


class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Hello from Status Tab!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AllColors.blackColor,
            ),
          ),
          // Add your status-specific content here
        ],
      ),
    );
  }
}
