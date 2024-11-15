import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class TaskMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> taskMasterApi (BuildContext context) async {
    loading.value = true;

    _api.tasksMasterApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('task Master id fetched');
        loading.value = false;
      }else{
        Utils.snackbarFailed('task Master not fetched');
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString()
        );
      }
    }
    );
  }
}

