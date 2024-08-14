import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class SourceViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> createNewLeadSource (BuildContext context) async {
    loading.value = true;

    _api.createNewLeadSourceApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('source Id fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('source Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}