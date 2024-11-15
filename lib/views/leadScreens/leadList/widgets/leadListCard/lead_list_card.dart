import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';

class LeadListScreenCard extends StatelessWidget {
  final String title;
  final String companyName;
  final String contact;
  final String createdDate;
  final String source;

  const LeadListScreenCard({
    Key? key,
    required this.title,
    required this.companyName,
    required this.contact,
    required this.createdDate,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10), // Add padding to the container
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.06),
            spreadRadius: 0.5,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Name
          Text(
            companyName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AllColors.welcomeColor,
            ),
            overflow: TextOverflow.ellipsis, // Prevent overflow
          ),
          // Title and Contact Row
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AllColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
              ),
              Icon(Icons.call_rounded, size: 15, color: AllColors.lightGrey),
              SizedBox(width: 5),
              Text(
                contact,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AllColors.grey,
                ),
                overflow: TextOverflow.ellipsis, // Prevent overflow
              ),
            ],
          ),
          // Created Date and Source Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.calendar_month_rounded, size: 17, color: AllColors.vividPurple),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  createdDate,
                  style: TextStyle(
                    color: AllColors.vividPurple,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
              ),
              Row(
                children: [
                  Icon(Icons.language, size: 16, color: AllColors.lightGrey),
                  SizedBox(width: 5),
                  Text(
                    source,
                    style: TextStyle(
                      color: AllColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ],
              ),
            ],
          ),
          Divider(thickness: 0.5, color: AllColors.lighterGrey),
          // Additional Information Row
          Row(
            children: [
              Expanded(
                child:
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AllColors.lighterPurple,
                  ),
                  child: Center(
                    child: Text(
                      'Manish Jindal',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AllColors.vividPurple,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AllColors.lightBlue,
                  ),
                  child: Center(
                    child: Text(
                      'PharmaHopers',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AllColors.darkBlue,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}