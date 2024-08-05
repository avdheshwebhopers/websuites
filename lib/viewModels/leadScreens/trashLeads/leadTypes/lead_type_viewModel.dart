import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class LeadTypeViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> leadTypes (BuildContext context) async {
    loading.value = true;

    _api.leadTypeApi().then((value) {

      if(value.id!= null){
        Utils.SnackbarSuccess('source Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('source Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString());
      }
    }
    );
  }
}