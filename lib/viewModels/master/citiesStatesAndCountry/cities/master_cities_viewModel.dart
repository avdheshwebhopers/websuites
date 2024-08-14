import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class MasterCitiesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterCities (BuildContext context) async {
    loading.value = true;

    _api.masterCitiesApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('master cities fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master cities not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}