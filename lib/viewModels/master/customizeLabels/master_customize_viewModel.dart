import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class MasterCustomizeViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterCustomize (BuildContext context) async {
    loading.value = true;

    _api.masterCustomizeApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('master customize fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master customize not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}