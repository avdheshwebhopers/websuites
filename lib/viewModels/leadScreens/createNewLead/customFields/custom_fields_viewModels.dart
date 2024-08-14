import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class CustomFieldsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> createNewLeadCustomFields (BuildContext context) async {
    loading.value = true;

    _api.createNewLeadCustomFieldsApi().then((value) {

      if(value.id!= null) {
        Utils.snackbarSuccess('lead Id fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('lead Id not fetched');
      }
    }).onError((error, stackTrace){
      if (kDebugMode){
        print(error.toString());
      }
    }
    );
  }
}