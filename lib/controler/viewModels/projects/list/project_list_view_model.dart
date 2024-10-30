import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class ProjectListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> projectList (BuildContext context) async {
    loading.value = true;

    _api.projectListApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('project list fetched');
        loading.value = false;
      }else{
        Utils.snackbarFailed('project list not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}