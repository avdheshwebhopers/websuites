import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class InventoryVendorsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> inventoryVendorsApi (BuildContext context) async {
    loading.value = true;

    _api.inventoryVendorsApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('inventory Vendors fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('inventory Vendors not fetched');
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

