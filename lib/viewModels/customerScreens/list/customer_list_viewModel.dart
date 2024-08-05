import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerList (BuildContext context) async {
    loading.value = true;

    _api.customersListApi().then((value) {

      if(value.items!= null){
        Utils.SnackbarSuccess('customer list Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('customer list Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}