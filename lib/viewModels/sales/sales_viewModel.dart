import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';


class SalesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

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
  }
}