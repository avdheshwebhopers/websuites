import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class OrderListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> orderList (BuildContext context) async {
    loading.value = true;

    _api.orderListApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('order list fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('order list not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}