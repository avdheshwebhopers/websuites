import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';

class CustomerCompaniesScreenCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? email;
  final String? mobile;
  final String? parentCompany;
  final String? website;

  const CustomerCompaniesScreenCard({
    Key? key,
    this.title,
    this.subTitle,
    this.email,
    this.mobile,
    this.parentCompany,
    this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Container(
        width: Get.width / 1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Title Row
              if (title != null)
                Row(
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: AllColors.welcomeColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 8,),
              // Subtitle and Email Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: TextStyle(
                          color: AllColors.mediumGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),

                  Spacer(),

                  if (email != null)
                    Text(
                      email!,
                      style: TextStyle(
                          color: AllColors.mediumGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                ],
              ),
              SizedBox(height: 8,),
              // Divider
              const Divider(
                thickness: 0.4,
              ),

              // Phone and Parent Company Label Row
              Row(
                children: [
                  if (mobile != null) ...[
                    Icon(
                      Icons.phone_in_talk_outlined,
                      size: 17,
                      color: AllColors.lighterGrey,
                    ),
                    SizedBox(width: 10),

                    Text(
                      mobile!,
                      style: TextStyle(
                          color: AllColors.lightGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                  ],

                  Spacer(),

                  Text(
                    'PARENT COMPANY',
                    style: TextStyle(
                        color: AllColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              // Website and Parent Company Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Website Icon and Text
                  if (website != null) ...[
                    Icon(
                      Icons.language,
                      size: 17,
                      color: AllColors.darkBlue,
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      flex: 3,
                      child: Text(
                        website!,
                        style: TextStyle(
                          color: AllColors.darkBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],

                  Spacer(),

                  // Parent Company Container
                  if (parentCompany != null)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.4, // Maximum width (40% of screen)
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                        decoration: BoxDecoration(
                          color: AllColors.lighterPurple,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          parentCompany!,
                          style: TextStyle(
                            color: AllColors.mediumPurple,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}