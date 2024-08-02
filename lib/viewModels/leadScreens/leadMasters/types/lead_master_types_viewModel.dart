import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class LeadMasterTypesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> leadMasterTypes (BuildContext context) async {
    loading.value = true;

    _api.leadMastersTypesApi().then((value) {

      if(value.id!= null){
        Utils.SnackbarSuccess('type Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('type Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString());
      }
    }
    );
  }
}