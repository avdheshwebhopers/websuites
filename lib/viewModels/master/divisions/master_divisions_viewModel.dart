import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class MasterDivisionsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterDivisions (BuildContext context) async {
    loading.value = true;

    _api.masterDivisionsApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('master divisions fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master divisions not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}