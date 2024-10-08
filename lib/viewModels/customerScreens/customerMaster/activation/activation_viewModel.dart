import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';


class CustomerActivationViewModels extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> customerActivation (BuildContext context) async {
    loading.value = true;

    _api.customerActivationApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('customer activities Id fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('customer activities Id not fetched');
      }
    }).onError((error, stackTrace){
      if (kDebugMode){
        print(error.toString());
      }
    }
    );
  }
}
