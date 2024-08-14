import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class TaskReportViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> taskReportApi (BuildContext context) async {
    loading.value = true;

    _api.tasksReportApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('taskList fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('taskList not fetched');
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

