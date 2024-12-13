import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

import '../../../data/models/responseModels/tasks/master/task_master_list/task_master_response_model.dart';

class TaskMasterListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  Rx<TaskMasterResponseModel?> taskMasterData = Rx<TaskMasterResponseModel?>(null);

  Future<void> fetchTaskMaster(BuildContext context) async {
    loading.value = true;

    _api.tasksMasterApi().then((value) {
      if (value.id != null) {
        taskMasterData.value = value;
        Utils.snackbarSuccess('Task Master fetched successfully');
      } else {
        Utils.snackbarFailed('Task Master not fetched');
      }
    }).onError((error, stackTrace) {
      Utils.snackbarFailed('An error occurred');
      if (kDebugMode) {
        print(error.toString());
      }
    }).whenComplete(() => loading.value = false);
  }
}

