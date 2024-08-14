import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class MasterDepartmentsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterDepartments (BuildContext context) async {
    loading.value = true;

    _api.masterDepartmentsApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('master departments fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master departments not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}