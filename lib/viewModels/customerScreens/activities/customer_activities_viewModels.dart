import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomerActivitiesViewModels extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerActivities (BuildContext context) async {
    loading.value = true;

    _api.customersActivitiesApi().then((value) {

      if(value.items!= null){
        Utils.SnackbarSuccess('customer activities Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('customer activities Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}