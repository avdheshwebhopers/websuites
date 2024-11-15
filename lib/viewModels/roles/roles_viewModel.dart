import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class RolesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> rolesListApi (BuildContext context) async {
    loading.value = true;

    _api.rolesApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('roles fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('roles not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }}
    );
  }
}