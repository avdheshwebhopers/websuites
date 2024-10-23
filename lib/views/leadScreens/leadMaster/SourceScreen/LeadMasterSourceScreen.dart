import 'package:flutter/material.dart';

import '../../../../utils/appColors/app_colors.dart';


class SourceTab extends StatelessWidget {
  const SourceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Hello from Source Tab!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AllColors.blackColor,
            ),
          ),
          // Add your source-specific content here
        ],
      ),
    );
  }
}
