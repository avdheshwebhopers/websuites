import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/appColors/app_colors.dart';
import '../../roles_screen.dart';

class RolesScreenCard extends StatelessWidget {
  final String title;
  final String description;
  final String members;
  final List<String> firstLetters; // List of first letters
  final String count;

  const RolesScreenCard({
    Key? key,
    required this.title,
    required this.description,
    required this.members,
    required this.firstLetters,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: screenHeight / 6, // Adjust height based on screen size
      width: screenWidth * 0.95, // Use a percentage of the screen width
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AllColors.blackColor.withOpacity(0.06),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AllColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'DESCRIPTION - ',
                  style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: AllColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.4),
            Row(
              children: [
                Text(
                  'MEMBERS - ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AllColors.blackColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    members,
                    style: TextStyle(
                      color: AllColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight / 30,
                  width: screenWidth / 3,
                  child: Stack(
                    children: [
                      for (int i = 0; i < firstLetters.take(4).length; i++)
                        Positioned(
                          // right: (i * 27.0),
          right: (i * 26.0),
                          child: Container(
                            height: screenHeight / 30,
                            width: screenWidth / 12,
                            decoration: BoxDecoration(
                              color: i % 4 == 0
                                  ? AllColors.lightRed
                                  : i % 4 == 1
                                  ? AllColors.lighterPurple
                                  : i % 4 == 2
                                  ? AllColors.lightBlue
                                  : AllColors.lightYellow,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                firstLetters[i],
                                style: TextStyle(
                                  color: i % 4 == 0
                                      ? AllColors.vividRed
                                      : i % 4 == 1
                                      ? AllColors .mediumPurple
                                      : i % 4 == 2
                                      ? AllColors.vividBlue
                                      : AllColors.darkYellow,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),


                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RoleDetailsScreen(),));
                  },
                  child: Text(
                    count,
                    style: TextStyle(
                      color: AllColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


