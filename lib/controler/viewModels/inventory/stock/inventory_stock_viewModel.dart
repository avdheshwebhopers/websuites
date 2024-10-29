import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class InventoryStockViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> inventoryStockApi (BuildContext context) async {
    loading.value = true;

    _api.inventoryStockApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('inventory stock fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('inventory stock not fetched');
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

