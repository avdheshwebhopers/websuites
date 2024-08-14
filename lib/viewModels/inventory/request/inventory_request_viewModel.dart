import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class InventoryRequestViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> inventoryRequestApi (BuildContext context) async {
    loading.value = true;

    _api.inventoryRequestApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('inventory request fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('inventory request not fetched');
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