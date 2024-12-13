import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/order/order_payment/order_payment_request_model.dart';
import '../../../data/models/responseModels/order/payments/order_payments_response_model.dart';


class OrderPaymentsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> orderPayments = <Items>[].obs; // Add this line

  Future<void> orderPayment() async {
    loading.value = true;
    OrderPaymentRequestModel request = OrderPaymentRequestModel(
      createdBy: null,
      customerId: null,
      dateRange: DateRange(
        from: "2024-11-01 00:00:00.000",
        to: "2024-11-30 23:59:59.999",
      ),
      divisionId: null,
      limit: 15,
      page: 1,
      paymentMode: null,
      paymentType: null,
      product: null,
      search: "",
      status: null,
    );

    try {
      final response = await _api.orderPaymentList(request.toJson());
      print('API Response order payment: ${response.toJson()}'); // Debug the entire response

      if (response.items != null && response.items!.isNotEmpty) {
        orderPayments.value = response.items!;
        Utils.snackbarSuccess('Order list fetched');
      } else {
        Utils.snackbarFailed('Order list not fetched');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching order payments: $error'); // Debug: Print error
      }
    } finally {
      loading.value = false;
    }
  }
}