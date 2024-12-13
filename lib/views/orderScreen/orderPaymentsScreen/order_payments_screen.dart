import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/orderScreen/orderPaymentsScreen/widget/OrderPaymentScreenCard.dart';

import '../../../utils/appColors/app_colors.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../viewModels/order/payments/order_payments_viewModel.dart';

class OrderPaymentsScreen extends StatelessWidget {
  final OrderPaymentsViewModel controller = Get.put(OrderPaymentsViewModel());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.orderPayment();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // Show loading indicator while fetching data
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Check if order payments list is empty
        if (controller.orderPayments.isEmpty) {
          return Center(
            child: Text('No order payments found'),
          );
        }

        // Main column to contain the row and the list
        return Column(
          children: [
            // Top row with Total, Verified, Cancelled containers
            Padding(
              padding: EdgeInsets.all(16),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: Get.height / 30,
                      decoration: BoxDecoration(
                        color: AllColors.mediumPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Total: 27,87,000',
                          style: TextStyle(
                            color: AllColors.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add some spacing between containers
                  Expanded(
                    child: Container(
                      height: Get.height / 30,
                      decoration: BoxDecoration(
                        color: AllColors.textField2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Verified: 0',
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add some spacing between containers
                  Expanded(
                    child: Container(
                      height: Get.height / 30,
                      decoration: BoxDecoration(
                        color: AllColors.textField2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Cancelled: 0',
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // Expanded ListView to take remaining space
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.orderPayments.length,
                itemBuilder: (context, index) {
                  final payment = controller.orderPayments[index];

                  // Extract division names from the list of divisions
                  String divisionNames = payment.order?.customer?.divisions
                      ?.map((division) => division.name)
                      .join(', ') ??
                      'N/A';

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: OrderPaymentScreenCard(
                      title: payment.order?.customer?.organization ?? 'Unknown Payment',
                      paid: (payment.status ?? 'N/A').isEmpty
                          ? 'N/A'
                          : '${payment.status![0].toUpperCase()}${payment.status!.substring(1).toLowerCase()}',
                      name: '${payment.order?.customer?.firstName ?? ''} ${payment.order?.customer?.lastName ?? ''}'
                          .trim()
                          .isEmpty
                          ? 'Unknown'
                          : '${payment.order?.customer?.firstName ?? ''} ${payment.order?.customer?.lastName ?? ''}',
                      payment: payment.is_fresh == false ? 'Fresh' : 'Old',
                      productRenewal: payment.product?.name ?? 'No Product',
                      paymentMode: payment.payment_mode ?? 'No Transaction ID',
                      uploadDocument: payment.upload_document ?? 'N/A',
                      paidOn: formatDateToLongMonth(payment.created_at) ?? 'N/A',
                      product: payment.product?.productType ?? 'N/A',
                      orderId: payment.order?.orderNumber?.toString() ?? 'N/A',
                      paidProduct: payment.product?.name ?? 'N/A',
                      createdBy: '${payment.created_by?.first_name ?? ''} ${payment.created_by?.last_name ?? ''}'.trim(),
                      division: divisionNames,
                      amount: '₹${payment.amount?.toStringAsFixed(2) ?? '0.00'}',
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}




