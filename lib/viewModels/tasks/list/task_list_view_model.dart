import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/task/list/task_list_request_model.dart';
import 'package:websuites/data/models/responseModels/tasks/list/tasks_list_response_model.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/task/list/task_list_request_model.dart';
import 'package:websuites/data/models/responseModels/tasks/list/tasks_list_response_model.dart' as task_list;

class TaskListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<task_list.Items> tasks = <task_list.Items>[].obs;
  bool isDataLoaded = false;

  @override
  void onInit() {
    super.onInit();
    if (!isDataLoaded) {
      taskListApi(Get.context!);
    }
  }

  Future<void> taskListApi(BuildContext context) async {
    if (isDataLoaded && tasks.isNotEmpty) return;

    loading.value = true;

    TaskListRequestModel request = TaskListRequestModel(
      assignedTo: null,
      company: null,
      createdBy: null,
      dateType: "create_date",
      limit: 15,
      page: 1,
      sort: Sort(q: null, sortBy: "ASC"),
    );

    try {
      final value = await _api.taskListApi(request.toJson());
      if (value.items != null && value.items!.isNotEmpty) {
        tasks.assignAll(value.items!);
        isDataLoaded = true;
        Utils.snackbarSuccess('Task List fetched');
      } else {
        Utils.snackbarFailed('Task List not fetched');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackbarFailed('Error fetching task list');
    } finally {
      loading.value = false;
    }
  }

  Future<void> refreshData(BuildContext context) async {
    isDataLoaded = false;
    await taskListApi(context);
  }
}

