import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/requestModels/master/dashboard/save_changes/SettingDashSaveChangesRequestModel.dart';
import '../../../../data/models/responseModels/master/dashboard/SettingDashboardResponseModel.dart';
import '../../../../data/models/responseModels/master/dashboard/save_changes/SettingDashSaveChangesResponseModel.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class SettingDashboardListViewModel extends GetxController {
  final _api = Repositories();

  var selectedDashboardName = Rx<String?>(null);
  var selectedDashboardCharts = Rx<List<String>?>(null);
  RxBool loading = false.obs;
  RxList masterDashboardItems = [].obs;

  // New variable to track if the special UI has been displayed
  RxBool isSpecialUIVisible = true.obs;

  Future fetchMasterSettingList(BuildContext context) async {
    loading.value = true;
    try {
      final response = await _api.masterSettingListApi();

      if (response.isNotEmpty) {
        masterDashboardItems.value = response;

        // Automatically select first dashboard if available
        if (response.isNotEmpty) {
          selectedDashboardName.value = response.first.name;
          selectedDashboardCharts.value = response.first.charts;
        }

        Utils.snackbarSuccess('Dashboard list fetched');
      } else {
        Utils.snackbarFailed('No dashboards available');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Dashboard fetch error: $error');
      }
      Utils.snackbarFailed('Error fetching dashboard list');
    } finally {
      loading.value = false;
    }
  }

  // Method to remove a chart
  void removeChart(int index) {
    if (selectedDashboardCharts.value != null &&
        index >= 0 &&
        index < selectedDashboardCharts.value!.length) {
      selectedDashboardCharts.value!.removeAt(index);
      selectedDashboardCharts.refresh();

      // If the first chart is removed, hide the special UI
      if (index == 0) {
        isSpecialUIVisible.value = false;
      }
    }
  }

  // Method to save charts
  Future<SettingDashSaveChangesMessageResponseModel?> saveCharts(SettingDashSaveChangesRequestModel requestModel) async {
    try {
      loading.value = true;
      final response = await _api.settingSaveChangesApi(requestModel);
      return response; // Assuming response is of type SettingDashSaveChangesMessageResponseModel
    } catch (error) {
      if (kDebugMode) {
        print('Error saving charts: $error');
      }
      return null; // Handle error appropriately
    } finally {
      loading.value = false;
    }
  }
}