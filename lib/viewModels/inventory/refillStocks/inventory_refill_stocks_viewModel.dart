import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class InventoryRefillStocksViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> inventoryRefillApi (BuildContext context) async {
    loading.value = true;

    _api.inventoryRefillStocksApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('inventory Refill fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('inventory Refill not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString()
        );
      }
    }
    );
  }
}