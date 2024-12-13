import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert'; // Import this for JSON decoding
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/order/list/order_list_request_model.dart';
import '../../../data/models/responseModels/order/list/order_list_response_model.dart';

class OrderListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Item> orders = <Item>[].obs; // Specify type for better type safety

  Future<void> orderList() async {
    loading.value = true; // Set loading to true before making the API call

    // Create the request model with default or non-null values
    OrderListRequestModel orderRequest = OrderListRequestModel(
      btnLabel: "Submit",
      createdBy: null,
      customer: null,
      dateRange: null,
      fiscalYearLabel: null,
      isModalShow: false,
      isTaxable: "No",
      limit: 15,
      modalType: "Add",
      page: 1,
      paymentType: null,
      product: null,
      productType: null,
      search: "",
      source: null,
      status: null,
    );

    try {
      // Make the API call
      var response = await _api.orderList(orderRequest.toJson());

      // Check if the response is of type OrderListResponseModel
      if (response is OrderListResponseModel) {
        // Assign fetched items to the list
        if (response.items.isNotEmpty) {
          orders.assignAll(response.items); // Assign fetched items to the list
          // Utils.snackbarSuccess('Order list fetched successfully');
          print('Order list fetched successfully');
        } else {
          // Utils.snackbarFailed('No orders found');
          print('No orders found');
        }
      } else {
        Utils.snackbarFailed('Unexpected response type');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching order list: ${error.toString()}'); // Log the error
      }
      Utils.snackbarFailed('An error occurred while fetching the order list');
    } finally {
      loading.value = false; // Set loading to false after the API call
    }
  }
}
