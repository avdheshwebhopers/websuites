import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerServiceViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerService (BuildContext context) async {
    loading.value = true;

    _api.customersPaymentReminderApi().then((value) {

      if(value.items!= null){
        Utils.SnackbarSuccess('customer service fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('customer service not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}