import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/customer/customer_activity/customer_activity_list/customer_activity_list.dart';
import '../../../../data/models/requestModels/dashboardScreen/db_latest_customer.dart';
import '../../../../data/models/responseModels/customers/activities/activities_list/activities_list.dart';
import '../../../../data/models/responseModels/customers/activities/activities_list/activities_list.dart';
import '../../../../data/models/responseModels/customers/activities/activities_list/activities_list.dart';
import '../../../../data/models/responseModels/customers/list/customers_list_response_model.dart';
import '../../../../data/models/responseModels/customers/activities/activities_list/activities_list.dart' as activities;

import '../../../../data/repositories/repositories.dart';

class CustomerActivitiesListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  CustomerActivityListRequest customerActivityListRequest = CustomerActivityListRequest(
    active: 1,
    activity: "all",
    dateRange: DateRange(
      from: "2024-11-18 00:00:00.000",
      to: "2024-11-18 23:59:59.999",
    ),
    limit: 15,
    page: 1,
  );

  // Observable list to hold the customer activity items
  RxList<activities.Item> customerActivities = <activities.Item>[].obs;

  Future<void> customerActivityList(BuildContext context) async {
    if (customerActivities.isNotEmpty) return; // Avoid re-fetching if data is already loaded

    loading.value = true;
    try {
      final response = await _api.customerActivityListApi(customerActivityListRequest.toJson());
      debugPrint("API Response: $response");

      if (response.items != null && response.items!.isNotEmpty) {
        customerActivities.addAll(response.items!.cast<activities.Item>());
        debugPrint("Loaded ${response.items!.length} activities.");
      } else {
        debugPrint("No activities found.");
      }
    } catch (e) {
      debugPrint("Error fetching customer activities: $e");
      Get.snackbar('Error', 'Failed to fetch activities. Please try again later.');
    } finally {
      loading.value = false;
    }
  }
}


