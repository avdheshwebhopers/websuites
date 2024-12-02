import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/components/widgets/sizedBoxes/sizedBox_5h.dart';

class OrderListScreenCardController extends GetxController {
  final RxBool isExpanded = false.obs;
  void toggleExpand() {
    isExpanded.toggle();
  }
  @override
  void onInit() {
    super.onInit();
  }

}
class OrderListScreenCard extends StatelessWidget {
  final String title;
  final String name;
  final String service;
  final String createdBy;
  final String pendingAmount;
  final String orderId;
  final String paidAmount;
  final String orderDate;
  final String status;
  final String finalPrice;

  // Now accept the controller as a parameter
  final OrderListScreenCardController controller;

  OrderListScreenCard({
    Key? key,
    required this.title,
    required this.name,
    required this.service,
    required this.createdBy,
    required this. pendingAmount,
    required this.orderId,
    required this.paidAmount,
    required this.orderDate,
    required this.status,
    required this.finalPrice,
    required this.controller, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Obx(() => !controller.isExpanded.value
                        ? Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AllColors.lightYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status,
                          style: TextStyle(
                            color: AllColors.darkYellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox.shrink()),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: controller.toggleExpand,
                      child: Obx(() => Icon(
                        controller.isExpanded.value
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_sharp,
                        size: 30,
                      )),
                    ),
                  ],
                ),
              ],
            ),
            Obx(() => !controller.isExpanded.value
                ? _buildCollapsedContent()
                : _buildExpandedContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                color: AllColors.lightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Text(
              service,
              style: TextStyle(
                color: AllColors.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Get.height / 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AllColors.lighterPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  createdBy,
                  style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Text(
              finalPrice,
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                color: AllColors.lightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Text(
              service,
              style: TextStyle(
                color: AllColors.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CREATED BY',
              style: TextStyle(
                color: AllColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              'PENDING AMOUNT',
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Get.height / 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AllColors.lighterPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  createdBy,
                  style: TextStyle(
                    color: AllColors.mediumPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Text(
              pendingAmount,
              style: TextStyle(
                color: AllColors.vividRed,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox5h(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ORDER ID',
              style: TextStyle(
                color: AllColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              'PAID AMOUNT',
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            )],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderId,
              style: TextStyle(
                color: AllColors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              paidAmount,
              style: TextStyle(
                color: AllColors.darkGreen,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox5h(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SYNC WITH ZOHO',
              style: TextStyle(
                color: AllColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              'ORDERED DATE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AllColors.blackColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Get.height / 40,
              width: Get.width / 6.5,
              decoration: BoxDecoration(
                color: AllColors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.sync,
                      size: 13,
                      color: AllColors.darkBlue,
                    ),
                    Text(
                      'Sync',
                      style: TextStyle(
                        color: AllColors.darkBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              orderDate,
              style: TextStyle(
                color: AllColors.lightGrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const Divider(
          thickness: 0.4,
        ),
        Row(
          children: [
            Container(
              height: Get.height / 40,
              width: Get.width / 6,
              decoration: BoxDecoration(
                color: AllColors.lightYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  status,
                  style: TextStyle(
                    color: AllColors.darkYellow,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              finalPrice,
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
