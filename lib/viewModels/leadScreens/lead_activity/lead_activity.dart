import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



import '../../../../data/models/responseModels/leads/lead_activity/lead_activity_list/lead_activity_list.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../data/models/requestModels/customer/customer_list/customer_list.dart';
import '../../../data/models/requestModels/lead/activity/activity_list.dart';


class LeadActivityViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  // Define the leadActivity property
  LeadActivityRequestModel leadActivity = LeadActivityRequestModel(
    active: 1,
    dateRange: Range(
      from: "2024-10-24 00:00:00.000",
      to: "2024-10-24 23:59:59.999",
    ),
    limit: 20,
    page: 2,
    rowsPerPage: 15,
  );

  Rx<LeadActivityResponseModel> leadActivityResponse = Rx(LeadActivityResponseModel(items: []));

  Future<void> leadActivityList(BuildContext context) async {
    loading.value = true; // Start loading
    try {
      var response = await _api.leadActivityList(leadActivity.toJson());
      leadActivityResponse.value = response; // Store the response
    } catch (error) {
      print('Error fetching lead activities: ${error.toString()}');
    } finally {
      loading.value = false; // Stop loading in a finally block
    }
  }
}

