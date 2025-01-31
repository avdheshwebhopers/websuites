import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/dashboardScreen/main_dashboard_screen/customer-reminders-chart/DashCusRemReqModel.dart';
import '../../../../data/models/requestModels/dashboardScreen/main_dashboard_screen/lead-reminders-chart/MainDashLeadRemindReqModel.dart';
import '../../../../data/models/requestModels/dashboardScreen/main_dashboard_screen/leads-by-source-count/MainDashLeadSourceReqModel.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/List/MainDashboardChartsList.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/charts/customer-status-chart/MainDashCustomerStatusResModel.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/charts/lead-cards/MainDashLeadCardListRespoModel.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/charts/lead-reminders-chart/MainDashLeadRemindResModel.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/charts/leads-by-source-count/MainDashLeadSourceResModel.dart';
import '../../../../data/models/responseModels/dashboard/main_dashboard/customer-reminders-chart/DashCusRemResModel.dart';
import '../../../../data/repositories/repositories.dart';


class MainDashboardListViewModel extends GetxController {
  final Repositories _api = Repositories();

  // Reactive state variables
  final RxBool isTeamFilter = true.obs;
  final RxString selectedDashboardName = ''.obs;
  final RxString selectedDashboardId = ''.obs;
  final RxBool loading = false.obs;
  final RxList<MainDashLeadSourceResModel> leadSources = <MainDashLeadSourceResModel>[].obs;
  final RxList<MainDashLeadCardListRespoModel> leadCards = <MainDashLeadCardListRespoModel>[].obs; // Updated to leadCards
  final RxList<MainDashLeadRemindResModel> leadReminder = <MainDashLeadRemindResModel>[].obs; // Updated to leadCards
  final RxList<MainDashCustomerStatusResModel> leadCustomer = <MainDashCustomerStatusResModel>[].obs; // Updated to leadCards
  final RxList<DashCusRemResModel> leadCustomerReminder = <DashCusRemResModel>[].obs; // Updated to leadCards

  final Rx<MainDashboardChartsListResponseModel?> mainDashboardItem = Rx<MainDashboardChartsListResponseModel?>(null);
  final RxList<String> selectedDashboardCharts = <String>[].obs;
  final Rx<DateRanges?> selectedDateRange = Rx<DateRanges?>(null);
  final Rx<String?> selectedUserId = Rx<String?>(null);
  final Rx<dynamic> selectedDivision = Rx<dynamic>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  Future<void> _initializeData() async {
    ever(selectedDashboardCharts, (_) => update());
    await fetchDashboardData();
    await fetchLeadSourcesWithDynamicDate();
    await fetchLeadCards(); // Fetch lead cards on initialization
    await fetchLeadReminder(); // Fetch lead cards on initialization
    await fetchLeadCustomer(); // Fetch lead cards on initialization
    await fetchLeadCusReminder(); // Fetch lead cards on initialization
  }

  Future<void> fetchLeadSourcesWithDynamicDate() async {
    final DateTime toDate = DateTime.now();
    final DateTime fromDate = toDate.subtract(const Duration(days: 29));

    final requestModel = MainDashLeadSourceReqModel(
      dateRange: DateRanges(from: fromDate, to: toDate),
      division: selectedDivision.value,
      filterUserId: selectedUserId.value ?? '',
      isFilterUserWithTeam: isTeamFilter.value,
    );

    await fetchLeadSources(requestModel);
  }

  Future<void> fetchLeadSources(MainDashLeadSourceReqModel requestModel) async {
    try {
      loading(true);
      final response = await _api.dbLeadsSourceApi(requestModel);
      if (response is List) {
        leadSources.assignAll(
          response
              .map((item) => MainDashLeadSourceResModel.fromJson(item))
              .toList(),
        );
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch lead sources');
    } finally {
      loading(false);
    }
  }

  Future<void> fetchLeadCards() async {
    final requestModel = MainDashLeadSourceReqModel(
      dateRange: selectedDateRange.value,
      division: selectedDivision.value,
      filterUserId: selectedUserId.value ?? '',
      isFilterUserWithTeam: isTeamFilter.value,
    );

    try {
      loading(true);
      final response = await _api.dbLeadCardApi(requestModel);

      // Check if the response is a Map (single object)
      if (response is Map<String, dynamic>) {
        // Create an instance of MainDashLeadCardListRespoModel from the response
        final leadCard = MainDashLeadCardListRespoModel.fromJson(response);
        leadCards.clear(); // Clear previous data
        leadCards.add(leadCard); // Add the new lead card
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch lead cards');
    } finally {
      loading(false);
    }
  }

  Future<void> fetchLeadReminder() async {
    final requestModel = MainDashLeadRemindReqModel(
      dateRange: DateRng(from: '', to: ''),  // Ensure it's DateRng? now
      division: selectedDivision.value,
      filterUserId: selectedUserId.value ?? '',
      isFilterUserWithTeam: isTeamFilter.value,
    );

    try {
      loading(true);
      final response = await _api.dbLeadReminderApi(requestModel);

      // Check if the response is a Map (single object)
      if (response is Map<String, dynamic>) {
        // Create an instance of MainDashLeadRemindResModel from the response
        final leadRemin = MainDashLeadRemindResModel.fromJson(response);
        leadReminder.clear(); // Clear previous data
        leadReminder.add(leadRemin); // Add the new lead reminder
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch lead reminder');
    } finally {
      loading(false);
    }
  }


  Future<void> fetchLeadCusReminder() async {
    final requestModel = DashCusRemReqModel(
      division: selectedDivision.value,
      filterUserId: selectedUserId.value ?? '',
      isFilterUserWithTeam: isTeamFilter.value,
    );

    try {
      loading(true);
      final response = await _api.dbCustomerReminderApi(requestModel);

      // Check if the response is a List (multiple objects)
      if (response is List) {
        // Create instances of DashCusRemResModel from the response
        leadCustomerReminder.assignAll(
          response.map((item) => DashCusRemResModel.fromJson(item)).toList(),
        );
      } else if (response is Map<String, dynamic>) {
        // If it's a Map (single object), parse it as a DashCusRemResModel
        final leadCusReminder = DashCusRemResModel.fromJson(response);
        leadCustomerReminder.clear(); // Clear previous data
        leadCustomerReminder.add(leadCusReminder); // Add the new lead reminder
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch lead customer reminders');
    } finally {
      loading(false);
    }
  }



  Future<void> fetchLeadCustomer() async {
    final requestModel = MainDashCustomerStatusReqModel(
      dateRange: DateRange(from: '2025-01-04 00:00:00.000', to: '2025-02-05 23:59:59.999'),
      division: selectedDivision.value,
      filterUserId: selectedUserId.value ?? '',
      isFilterUserWithTeam: isTeamFilter.value,

    );

    try {
      loading(true);
      final response = await _api.dbCustomerApi(requestModel);

      if (response is Map<String, dynamic>) {
        final leadCustm = MainDashCustomerStatusResModel.fromJson(response);
        leadCustomer.clear(); // Clear previous data
        leadCustomer.add(leadCustm); // Add the new lead customer status
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch lead customer status');
    } finally {
      loading(false);
    }
  }


  Future<void> fetchDashboardData() async {
    if (loading.value) return;

    try {
      loading(true);
      final response = await _api.MainDashBoardListApi();

      if (response != null) {
        mainDashboardItem.value = response;

        if (response.roleList.isNotEmpty &&
            response.roleList[0].dashboards.isNotEmpty) {
          final dashboard = response.roleList[0].dashboards[0];
          selectedDashboardCharts.value = dashboard.charts;
          selectedDashboardName.value = dashboard.name ?? '';
          selectedDashboardId.value = dashboard.id ?? '';
        }
      }
    } catch (error) {
      _handleError(error, 'Failed to fetch dashboard data');
    } finally {
      loading(false);
    }
  }

  void _handleError(dynamic error, String message) {
    if (kDebugMode) {
      print('Error: $error');
    }
    Utils.snackbarFailed(message);
  }

  void applyFilters({
    String? userId,
    dynamic division,
    bool? isTeam,
    DateRanges? dateRange,
  }) {
    selectedUserId.value = userId;
    selectedDivision.value = division;
    isTeamFilter.value = isTeam ?? false;
    selectedDateRange.value = dateRange ?? _getDefaultDateRange();

    fetchDashboardData();
    fetchLeadSourcesWithDynamicDate();
    fetchLeadCards(); // Fetch lead cards after applying filters
  }

  void resetFilters() {
    selectedUserId.value = null;
    selectedDivision.value = null;
    isTeamFilter.value = true;
    selectedDateRange.value = null;

    fetchDashboardData();
    fetchLeadSourcesWithDynamicDate();
    fetchLeadCards(); // Fetch lead cards after resetting filters
  }

  DateRanges _getDefaultDateRange() {
    final DateTime now = DateTime.now();
    return DateRanges(
      from: now.subtract(const Duration(days: 30)),
      to: now,
    );
  }
}
