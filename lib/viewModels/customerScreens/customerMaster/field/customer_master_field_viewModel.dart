import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerMasterFieldViewModels extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerMasterField (BuildContext context) async {
    loading.value = true;

    _api.customerFieldApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('company credentials fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('company credentials id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}
