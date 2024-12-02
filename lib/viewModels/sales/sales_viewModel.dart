import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../data/models/requestModels/sales/SalesListRequestModel.dart';
import '../../data/models/responseModels/sales/sales_response_model.dart'; // Ensure this path is correct

class SalesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Items> salesItems = <Items>[].obs; // Ensure Items is defined

  Future<void> fetchSales({String? notificationTo, int? limit, int? page}) async {
    try {
      loading.value = true;
      errorMessage.value = null;

      // Prepare request model
      SalesListRequestModel requestModel = SalesListRequestModel(
        notificationTo: notificationTo,
        limit: limit,
        page: page,
      );

      // Fetch sales data from API
      SalesResponseModel response = await _api.salesApi(); // Call without arguments
      // Log response details
      print('🔍 VIVEK SALES RESPONSE DETAILS 🔍');
      if (response.items != null) {
        print('Total Items: ${response.items!.length}');
        response.items!.asMap().forEach((index, item) {
          print('\n📊 Sales Item [$index] Details:');
          print('ID: ${item.id}');
          print('Name: ${item.name}');
          print('Start Date: ${item.start_date}');
          // Continue logging...
        });
        salesItems.clear();
        salesItems.addAll(response.items!);
        Utils.snackbarSuccess('Sales fetched successfully');
      } else {
        errorMessage.value = 'No sales data found';
        Utils.snackbarFailed('No sales data found');
      }
    } catch (error) {
      errorMessage.value = error.toString();
      Utils.snackbarFailed('Failed to fetch sales: $error');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchSales(); // Fetch sales data on initialization
  }
}