import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../data/models/requestModels/master/dashboard/save_changes/SettingDashSaveChangesRequestModel.dart';
import '../../../../data/models/responseModels/master/dashboard/save_changes/SettingDashSaveChangesResponseModel.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/master/dashboard/SettingDashboardResponseModel.dart';

class SettingDashboardListViewModel extends GetxController {
  final _api = Repositories();

  var selectedDashboardName = Rx<String?>(null);
  var selectedDashboardCharts = Rx<List<String>?>(null);
  RxBool hasDeletedFirstItem = false.obs;
  bool isDivisionChart(String chartName) {
    return chartName.toLowerCase().contains('division');
  }
  var selectedDashboardId = Rx<String?>(null);
  RxBool loading = false.obs;
  RxList<SettingDashboardListResponseModel> masterDashboardItems = <SettingDashboardListResponseModel>[].obs;

  // Use RxList<String> for original charts
  RxList<String> originalDashboardCharts = <String>[].obs;

  // Define the allowed chart values
  static const List<String> allowedCharts = [
    'lead_cards',
    'lead_types_chart',
    'lead_reminders_chart',
    'lead_sources_chart',
    'customer_status_chart',
    'customer_reminders_chart',
    'payment_reminders_chart',
    'task_status_chart',
    'project_status_chart',
    'project_reminders_chart',
    'sales_chart',
    'transactions_chart',
    'effective_hours',
  ];

  // Fetch the master setting list from the API
  Future<void> fetchMasterSettingList(BuildContext context) async {
    loading.value = true;
    try {
      final response = await _api.masterSettingListApi();

      if (response.isNotEmpty) {
        // Assign data to observable variables
        masterDashboardItems.value = response;
        selectedDashboardName.value = response.first.name ?? '';
        selectedDashboardCharts.value = List<String>.from(response.first.charts ?? []);  // Create a new list
        selectedDashboardId.value = response.first.id ?? '';

        // Store the original charts for later use
        originalDashboardCharts.value = List<String>.from(response.first.charts ?? []); // Create a new list

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

  // 2nd correct

  // Remove a chart by its index
  // void removeChart(int index) {
  //   if (selectedDashboardCharts.value != null &&
  //       index >= 0 &&
  //       index < selectedDashboardCharts.value!.length) {
  //     // Create a new list with the item removed
  //     List<String> updatedCharts = List<String>.from(selectedDashboardCharts.value!);
  //     updatedCharts.removeAt(index);
  //
  //     // Update the selectedDashboardCharts with the new list
  //     selectedDashboardCharts.value = updatedCharts;
  //
  //     // Force a refresh of the UI
  //     selectedDashboardCharts.refresh();
  //   }
  // }

  void removeChart(int index) {
    if (selectedDashboardCharts.value != null &&
        index >= 0 &&
        index < selectedDashboardCharts.value!.length) {
      String chartToRemove = selectedDashboardCharts.value![index];

      // Create a new list without the removed chart
      List<String> updatedCharts = List<String>.from(selectedDashboardCharts.value!);
      updatedCharts.removeAt(index);

      // Update the charts
      selectedDashboardCharts.value = updatedCharts;
      selectedDashboardCharts.refresh();
    }
  }


  // 1st  correct
  // // Method to reset the selected charts to the original state
  // void resetCharts() {
  //   selectedDashboardCharts.value = List<String>.from(originalDashboardCharts);
  //   selectedDashboardCharts.refresh();
  //   Utils.snackbarSuccess('Charts have been reset to original state.');
  // }


  // Method to reset the selected charts to include all allowed charts
  void resetCharts() {
    selectedDashboardCharts.value = List<String>.from(allowedCharts); // Reset to all allowed charts
    selectedDashboardCharts.refresh();
    Utils.snackbarSuccess('Charts have been reset to include all allowed charts.');
  }

  // Method to update selected dashboard
  void updateSelectedDashboard(String name) {
    var selectedDashboard = masterDashboardItems.firstWhere(
          (dashboard) => dashboard.name == name,
      orElse: () => SettingDashboardListResponseModel(),
    );

    selectedDashboardName.value = name;
    selectedDashboardId.value = selectedDashboard.id;

    // Create a new list when updating selected charts
    selectedDashboardCharts.value = List<String>.from(selectedDashboard.charts ?? []);
    originalDashboardCharts.value = List<String>.from(selectedDashboard.charts ?? []);

    // Force refresh
    selectedDashboardCharts.refresh();
    originalDashboardCharts.refresh();
  }

  Future<SettingDashSaveChangesMessageResponseModel?> saveCharts() async {
    try {
      loading.value = true;

      if (selectedDashboardCharts.value == null || selectedDashboardCharts.value!.isEmpty) {
        Utils.snackbarFailed('Please select at least one chart to save.');
        return null;
      }

      if (selectedDashboardId.value == null || selectedDashboardId.value!.isEmpty) {
        Utils.snackbarFailed('Invalid dashboard ID.');
        return null;
      }

      // Filter out any invalid chart types
      List<String> validCharts = selectedDashboardCharts.value!
          .where((chart) => allowedCharts.contains(chart))
          .toList();

      if (validCharts.isEmpty) {
        Utils.snackbarFailed('No valid charts selected.');
        return null;
      }

      SettingDashSaveChangesRequestModel requestModel = SettingDashSaveChangesRequestModel(
        roleId: selectedDashboardId.value!,
        charts: validCharts,
      );

      if (kDebugMode) {
        print('Save Charts Request: ${requestModel.toJson()}');
      }

      final response = await _api.settingSaveChangesApi(requestModel);

      if (response.message != null) {
        Utils.snackbarSuccess(response.message!);
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error saving charts: $e');
      }
      Utils.snackbarFailed('Failed to save charts: $e');
      return null;
    } finally {
      loading.value = false;
    }
  }
}