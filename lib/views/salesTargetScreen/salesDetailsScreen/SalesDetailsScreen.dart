import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../utils/appColors/app_colors.dart';
import 'package:websuites/viewModels/sales/target_detail/target_detail_view_model.dart';

import '../../../utils/datetrim/DateTrim.dart';


class Salesdetailsscreen extends StatefulWidget {
  const Salesdetailsscreen({super.key});

  @override
  State<Salesdetailsscreen> createState() => _SalesdetailsscreenState();
}

class _SalesdetailsscreenState extends State<Salesdetailsscreen> {
  final TargetDetailViewModel viewModel = Get.put(TargetDetailViewModel());

  @override
  void initState() {
    super.initState();
    viewModel.targetDetail(context); // Fetch the target details when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Dinesh Thakur October Sale Target",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Image.asset('assets/svg/report.svg', height: 18, width: 18),
          ],
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final targetIncentive = viewModel.targetDetailResponse.value.targetIncentive;

        if (targetIncentive == null) {
          return Center(child: Text("No data available"));
        }

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                // User Selection
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Select User"),
                          Text("(7)", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                      SizedBox(height: 15),
                      CreateNewLeadScreenCard(
                        hintText: 'Select User',
                        categories: [targetIncentive.teamHead?.firstName ?? "Unknown User"],
                        // selectedValue: targetIncentive.teamHead?.firstName ?? "Unknown User", // Set the default selected value
                        // borderRadius:8,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                // User Details
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(targetIncentive.teamHead?.firstName ?? "Unknown User", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Icon(Icons.edit, size: 18),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset('assets/icons/email.png', height: 14, width: 14),
                          SizedBox(width: 10),
                          Text(targetIncentive.teamHead?.email ?? "No Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AllColors.grey)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [

                          Image.asset('assets/icons/date.png', height: 14, width: 14),
                          const SizedBox(width: 5),
                          Text(formatDateWithCustomFormat(targetIncentive.createdAt),
                            style: TextStyle(
                              color: AllColors.mediumPurple,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Target : ',
                            style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 12, color: AllColors.blackColor),
                          ),
                          Text(
                            '₹${targetIncentive.saleTarget ?? 0}',
                            style: TextStyle(fontWeight: FontWeight.w400, color: AllColors.greenJungle, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                // Incentive Breakdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('INCENTIVE BREAKDOWN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                          Spacer(),
                          Icon(Icons.add_box_outlined, color: AllColors.grey),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 0.5, height: 30),
                      // Use ListView.builder here
                      SizedBox(
                        height: 200, // Set a fixed height for the ListView
                        child: ListView.builder(
                          itemCount: targetIncentive.teamHead?.key?.achieveBreakdown?.length ?? 0,
                          itemBuilder: (context, index) {
                            final breakdown = targetIncentive.teamHead?.key?.achieveBreakdown?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Incentive Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                                      SizedBox(width: 15),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: breakdown?.incentiveType != 'flat'
                                                ? AllColors.yellowGoogleForm
                                                : AllColors.mediumPurple,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Text(
                                            breakdown?.incentiveType ?? 'N/A',
                                            style: TextStyle(
                                              color: breakdown?.incentiveType != null
                                                  ? AllColors.whiteColor // White text when there's incentiveType
                                                  : AllColors.blackColor, // Black text for 'N/A' or when null
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),

                                      Spacer(),
                                      Icon(Icons.edit, size: 18),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Image.asset('assets/icons/date.png', height: 12, width: 12),
                                      const SizedBox(width: 5),
                                      Text(
                                        breakdown?.createdAt != null
                                            ? formatDateWithCustomFormat(breakdown?.createdAt)
                                            : 'Date not available',
                                        style: TextStyle(
                                          color: AllColors.darkOrange,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(children: [
                                    Text('Achieve % -  ', style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Text('${breakdown?.achievePercentage ?? 0}%', style: TextStyle(color: AllColors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Spacer(),
                                    Text('Incentive % -  ', style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Text('${breakdown?.incentive ?? 0}%', style: TextStyle(color: AllColors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
                                  ]),
                                  Divider(thickness: 0.5, height: 20),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                // Product for Sale
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('PRODUCT FOR SALE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                          Spacer(),
                          Icon(Icons.add_box_outlined, color: AllColors.grey),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(thickness: 0.5, height: 8),
                      SizedBox(
                        height: 900,
                        child: ListView.builder(
                          itemCount: targetIncentive.teamHead?.key?.achieveBreakdown?.length ?? 0,
                          itemBuilder: (context, index) {
                            final breakdownList = targetIncentive.teamHead?.key?.achieveBreakdown ?? [];

                            breakdownList.sort((a, b) {
                              if (a.updatedAt == null && b.updatedAt == null) return 0;
                              if (a.updatedAt == null) return 1;
                              if (b.updatedAt == null) return -1;
                              return b.updatedAt!.compareTo(a.updatedAt!);
                            });

                            final breakdown = breakdownList[index];
                            final defaultDate = DateTime.now().toString();
                            final dateToFormat = breakdown.updatedAt?.toString() ?? defaultDate;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        targetIncentive?.minimumProduct?.first?.product?.name ?? 'N/A',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                                      ),
                                      Spacer(),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AllColors.background_green,
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Text(
                                            'Active',
                                            style: TextStyle(
                                              color: AllColors.text__green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text('Incentive Type    ', style: TextStyle(color: AllColors.grey, fontSize: 14, fontWeight: FontWeight.w700)),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: Get.width * 0.21),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: targetIncentive.product?.first.incentiveType == 'flat'
                                                ? AllColors.mediumPurple  // Background color is medium purple if 'flat'
                                                : AllColors.yellowGoogleForm,  // Default background color
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Text(
                                            targetIncentive.product?.first.incentiveType?.toString() ?? 'N/A', // Default 'N/A' if null
                                            style: TextStyle(
                                              color: targetIncentive.product?.first.incentiveType == 'flat'
                                                  ? AllColors.whiteColor  // Text color is white if 'flat'
                                                  : AllColors.whiteColor,  // Default text color
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      )
,
                                      Spacer(),
                                      Image.asset('assets/icons/date.png', height: 12, width: 12),
                                      const SizedBox(width: 5),
                                      Text(
                                        formatDateWithCustomFormat(dateToFormat),
                                        style: TextStyle(color: AllColors.mediumPurple, fontSize: 12, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(children: [
                                    Text('Min. Sale Price - ', style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Text('${targetIncentive.product?[0].minimumSalePrice ?? 0}', style: TextStyle(color: AllColors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Spacer(),
                                    Text('Incentive - ', style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Text('${targetIncentive.product?[0].incentive ?? 0}', style: TextStyle(color: AllColors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
                                  ]),
                                  SizedBox(height: 8),
                                  Row(children: [
                                    Text('Is On Sale? - ', style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Text(targetIncentive.product?[0].isSale == true ? 'YES' : 'NO', style: TextStyle(color: AllColors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
                                    Spacer(),
                                    Icon(Icons.edit, size: 18),
                                  ]),
                                  SizedBox(height: 15),
                                  Divider(thickness: 0.5, height: 40),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}