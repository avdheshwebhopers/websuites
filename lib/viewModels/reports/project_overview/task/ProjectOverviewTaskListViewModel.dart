import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/report/project_overview/task/ProjectOverViewTaskListRequestModel.dart';
import '../../../../data/models/responseModels/reports/taskdetails/project_overview/task/ProjectOverViewTaskListResponseModel.dart';
import '../../../../data/repositories/repositories.dart';

class ProjectOverviewTaskListViewModel extends GetxController {
  final Repositories _api;

  ProjectOverviewTaskListViewModel(this._api);

  var isLoading = false.obs;
  var taskListResponse = Rx<ProjectOverViewTaskListResponseModel?>(null);
  var isDataLoaded = false; // New flag to track data loading

  Future<void> fetchTaskList(BuildContext context, {
    String? projectId,
    DateRange? dateRange,
  }) async {
    // If data is already loaded, return early
    if (isDataLoaded) return;

    isLoading.value = true;
    try {
      final requestModel = ProjectOverviewTaskRequestModel(
        limit: 15,
        dateRange: dateRange ?? DateRange(
          from: DateTime.now().subtract(Duration(days: 30)).toIso8601String(),
          to: DateTime.now().toIso8601String(),
        ),
        page: 1,
        project: projectId ?? "4e71cae5-a4ba-403f-aaf6-35ebb5295baf",
      );

      final response = await _api.ProjectOverViewTasksListApi(requestModel);
      taskListResponse.value = response;
      isDataLoaded = true; // Set the flag to true after loading data
      Utils.snackbarSuccess('Task Report fetched successfully');
    } catch (error) {
      Utils.snackbarFailed('Failed to fetch Task Report');
      if (kDebugMode) {
        print('Error fetching task list: ${error.toString()}');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void resetTaskList() {
    taskListResponse.value = null;
    isDataLoaded = false; // Reset the flag when the task list is reset
  }
}
