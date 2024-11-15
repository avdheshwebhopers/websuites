import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerPaymentReminderViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerPaymentReminder (BuildContext context) async {
    loading.value = true;

    _api.customersPaymentReminderApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('customer Payment fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('customer Payment not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}