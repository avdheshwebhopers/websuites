import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class InventoryTransactionsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> inventoryTransactionsApi (BuildContext context) async {
    loading.value = true;

    _api.inventoryTransactionsApi().then((value) {

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

