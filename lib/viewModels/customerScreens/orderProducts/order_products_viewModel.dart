import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerOrderProductsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerOrderProducts (BuildContext context) async {
    loading.value = true;

    _api.customersOrderProductsApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('order Products fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('order Products not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}