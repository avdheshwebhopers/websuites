import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

<<<<<<< HEAD
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../data/models/responseModels/sales/sales_response_model.dart'; // Import your sales response model

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../data/models/responseModels/sales/sales_response_model.dart';
=======
>>>>>>> origin/main

class SalesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

<<<<<<< HEAD
  // Change to RxList for better reactivity
  RxList<Items> salesItems = <Items>[].obs;

  Future<void> fetchSales() async {
    try {
      loading.value = true;

      // Directly await the API call
      SalesResponseModel response = await _api.salesApi();

      if (response.items != null && response.items!.isNotEmpty) {
        // Clear previous items and add new items
        salesItems.clear();
        salesItems.addAll(response.items!);

        print('Fetched ${salesItems.length} sales items'); // Debug print
        Utils.snackbarSuccess('Sales fetched successfully');
      } else {
        print('No sales items found'); // Debug print
        Utils.snackbarFailed('No sales data found');
      }
    } catch (error) {
      print('Error fetching sales: $error'); // Detailed error logging
      Utils.snackbarFailed('Failed to fetch sales');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    fetchSales();
    super.onInit();
=======
  Future<void> salesApi (BuildContext context) async {
    loading.value = true;

    _api.salesApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('sales fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('sales not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
>>>>>>> origin/main
  }
}