import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class CompanyCredentialsViewModels extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> companyCredentials (BuildContext context) async {
    loading.value = true;

    _api.companyCredentialsApi().then((value) {

      if(value.id!= null){
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
