import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProductCategoryViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productCategory (BuildContext context) async {
    loading.value = true;

    _api.productCategoryApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('product category fetched');
        loading.value = false;

      }else {
        Utils.snackbarFailed('product category not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}