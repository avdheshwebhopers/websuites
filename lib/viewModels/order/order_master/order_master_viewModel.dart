import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
<<<<<<< HEAD

import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/order/master/order_master_response_model.dart';

class OrderMasterViewModel extends GetxController {
  final _api = Repositories();

  RxBool loading = false.obs;
  RxList<OrderMasterResponseModel> orderMasterData = <OrderMasterResponseModel>[].obs;

  // Fetch Order Master data from the API
  Future<void> fetchOrderMaster(BuildContext context) async {
    loading.value = true;

    try {
      // Fetch data from the API
      final response = await _api.orderMasterApi(); // This should return a List<OrderMasterResponseModel>

      // Check if the response is a List of OrderMasterResponseModel
      if (response is List<OrderMasterResponseModel>) {
        orderMasterData.value = response;  // Directly assign the list to the observable
        Utils.snackbarSuccess('Order Master fetched');
      } else {
        Utils.snackbarFailed('Unexpected response format');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackbarFailed('An error occurred while fetching Order Master');
    } finally {
      loading.value = false;
    }
=======
import '../../../../utils/utils.dart';

class OrderMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> orderMaster (BuildContext context) async {
    loading.value = true;

    _api.orderMasterApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('order Master fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('order Master not fetched');
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





