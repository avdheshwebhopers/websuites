<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/responseModels/order/proformaList/order_proforma_list_response_model.dart';
import '../../../data/repositories/repositories.dart';

class OrderProformaListViewModel extends GetxController {
  final Repositories _api = Repositories();
  final RxBool loading = false.obs;
  final RxList<OrderPerformaResponseModel> orderList = <OrderPerformaResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderProformaList();
  }

  Future<void> fetchOrderProformaList() async {
    try {
      loading.value = true;

      // Fetch API response
      final dynamic response = await _api.orderproformaApi();

      // Clear previous list
      orderList.clear();

      debugPrint('API Response: $response');

      // Check if the response is a List
      if (response is List) {
        // Parse and validate each item in the List
        orderList.value = response.map((item) {
          if (item is Map<String, dynamic>) {
            try {
              return OrderPerformaResponseModel.fromJson(item);
            } catch (e) {
              debugPrint('Error parsing item: $e');
            }
          } else {
            debugPrint('Invalid item type: ${item.runtimeType}');
          }
          return null; // Skip invalid items
        }).whereType<OrderPerformaResponseModel>().toList();
      } else {
        throw Exception('Unexpected response type: ${response.runtimeType}');
      }

      if (orderList.isEmpty) {
        throw Exception('No valid data found');
      }

      // Show success notification
      Get.snackbar(
        'Success',
        'Order proforma list fetched successfully.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } catch (error) {
      // Log the error and clear the list
      orderList.clear();

      Get.snackbar(
        'Error',
        'Unable to fetch order proforma list: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      debugPrint('Error fetching order proforma list: $error');
    } finally {
      loading.value = false;
    }
  }



=======
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class OrderProformaListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> orderProformaList (BuildContext context) async {
    loading.value = true;

    _api.orderProformaApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('order proforma list fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('order proforma list not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
>>>>>>> origin/main
}