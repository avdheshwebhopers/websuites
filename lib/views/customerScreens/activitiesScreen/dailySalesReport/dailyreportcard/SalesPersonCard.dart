// activity_report_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/appColors/app_colors.dart';

class ActivityReportController extends GetxController {
  final RxBool isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}

// activity_report_model.dart
class ActivityReportSalesPerson {
  final String name;
  final String email;
  final int answered;
  final int notAnswered;
  final int wrongNumber;
  final int numberBusy;
  final int physicalMeeting;
  final int virtualMeeting;
  final int total;
  final int totalMeeting;

  ActivityReportSalesPerson({
    required this.name,
    required this.email,
    required this.answered,
    required this.notAnswered,
    required this.wrongNumber,
    required this.numberBusy,
    required this.physicalMeeting,
    required this.virtualMeeting,
    required this.total,
    required this.totalMeeting,
  });
}



class ActivitiesDailySalesReportCard extends StatelessWidget {
  final ActivityReportSalesPerson salesPerson;
  final ActivityReportController controller = Get.put(ActivityReportController());

  ActivitiesDailySalesReportCard({Key? key, required this.salesPerson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(color: Colors.grey, fontSize: 12);
    TextStyle contentStyle = const TextStyle(color: Colors.black, fontSize: 13);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with name and edit icon
            Row(
              children: [
                Text(
                  salesPerson.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/Edit.png',
                  height: 14,
                  color: const Color(0xFF6E6A7C),
                ),
                Obx(() => IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    controller.isExpanded.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 16,
                    color: AllColors.blackColor,
                  ),
                  onPressed: controller.toggleExpansion,
                )),
              ],
            ),
            const SizedBox(height: 2),
            // Email row
            Row(
              children: [
                const Icon(Icons.email_outlined, color: Colors.grey, size: 12),
                const SizedBox(width: 4),
                Text(salesPerson.email, style: subtitleStyle),
              ],
            ),
            const Divider(height: 8),
            // Summary row
            Row(
              children: [
                const Icon(Icons.phone_in_talk_outlined, color: Colors.green, size: 14),
                const SizedBox(width: 4),
                Text(
                  "Total: ${salesPerson.total}",
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const Spacer(),
                const Icon(Icons.group_sharp, color: Colors.blue, size: 14),
                const SizedBox(width: 4),
                Text(
                  "Total Meetings: ${salesPerson.totalMeeting}",
                  style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            Obx(() => controller.isExpanded.value
                ? Column(
              children: [
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Answered: ${salesPerson.answered}", style: contentStyle),
                          Text("Not Answered: ${salesPerson.notAnswered}", style: contentStyle),
                          Text("Wrong Number: ${salesPerson.wrongNumber}", style: contentStyle),
                          Text("Number Busy: ${salesPerson.numberBusy}", style: contentStyle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Physical Meeting: ${salesPerson.physicalMeeting}", style: contentStyle),
                          Text("Virtual Meeting: ${salesPerson.virtualMeeting}", style: contentStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}