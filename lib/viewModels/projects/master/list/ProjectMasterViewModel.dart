import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProjectMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> projectMasterApi (BuildContext context) async {
    loading.value = true;

    _api.projectMasterApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('project master fetched');
        loading.value = false;
      }else{
        Utils.snackbarFailed('project master not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}