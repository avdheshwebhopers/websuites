import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';


class MasterCountryViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterCountry (BuildContext context) async {
    loading.value = true;

    _api.masterCountryApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('master country fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master country not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}