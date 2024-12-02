import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';

class CustomerListScreenCard extends StatelessWidget {
  final String name;
  final String email;
  final String title;
  final String mobile;
  final String created_by;

  const CustomerListScreenCard({
    Key? key,
    required this.title,
    required this.email,
    required this.name,
    required this.mobile,
    required this.created_by,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width * 1,
        decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AllColors.blackColor.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 4,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start, // Align children to the start
            children: [
              // Title: Allows wrapping and grows according to content
              Text(
                title,
                style: TextStyle(
                  color: AllColors.welcomeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                softWrap: true, // Allow wrapping
              ),
              SizedBox(height: 8), // Adding some space between title and next row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name: Text will grow with content and wrap if necessary
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AllColors.grey,
                      ),
                      softWrap: true, // Wrap text if needed
                    ),
                  ),
                  // Email: Text will grow with content and wrap if necessary
                  Flexible(
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: AllColors.grey,
                      ),
                      softWrap: true, // Wrap text if needed
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align all row items to the top
                children: [
                  // Align the icon with the text

                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.phone_in_talk_outlined,
                      size: 14,
                      color: AllColors.grey,
                    ),
                  ),

                  SizedBox(width: 7),
                  // Mobile: Text will grow with content and wrap if necessary

                  Text(
                    mobile,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AllColors.grey,
                    ),
                    softWrap: true, // Wrap text if needed
                  ),

                  Spacer(), // Pushes the next container to the right
                  // Created by: This container also grows based on content
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.4), // Optional: max width
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                      color: AllColors.lighterPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        created_by,
                        style: TextStyle(
                          color: AllColors.mediumPurple,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        softWrap: true, // Wrap text if needed
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
