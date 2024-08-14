import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProductMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productMaster (BuildContext context) async {
    loading.value = true;

    _api.productMasterApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('product master fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('product master not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}