import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProductListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productList (BuildContext context) async {
    loading.value = true;

    _api.productListApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('product list fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('product list not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}