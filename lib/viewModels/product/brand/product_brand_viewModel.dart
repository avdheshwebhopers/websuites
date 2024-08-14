import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProductBrandViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productBrand (BuildContext context) async {
    loading.value = true;

    _api.productBrandApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('product brand fetched');
        loading.value = false;

      }else {
        Utils.snackbarFailed('product brand not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}