import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Utils/utils.dart';
import '../../../data/models/requestModels/dashboardScreen/db_latest_customer.dart';
import '../../../data/models/requestModels/lead_list/lead_list.dart';
import '../../../data/repositories/repositories.dart';


class LeadListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> leadList = <Items>[].obs; // To hold the list of leads
  Future<void> fetchLeadList(BuildContext context) async {
    loading.value = true;
    RequestModel requestModel = RequestModel(
      city: "",
      customFields: {},
      division: "",
      isOpen: false,
      isForeignLead: false,
      leadAssigned: "",
      leadAssignedToTeam: false,
      limit: 15,
      noCampaign: false,
      page: 1,
      paginationType: "old",
      productCategory: "",
      queryType: "",
      range: Range(
        from: "2024-09-23 00:00:00.000",
        to: "2024-10-23 23:59:59.999",
      ),
      search: "",
      serviceType: [],
      source: "",
      status: "",
      subTypes: [],
      type: "",
    );

    Map<String, dynamic> requestBody = requestModel.toJson();

// Calling the API and handling response and errors
    _api.leadList(requestBody).then((response) {
      // Successfully fetched the leads
      if (response.items != null && response.items!.isNotEmpty) {
        // Process each lead item
        for (var item in response.items!) {
          // Print or handle each lead item here
          print('Lead ID: ${item.id}');
          print('Lead Name: ${item.firstName}');
        }
        Utils.snackbarSuccess('Lead list fetched successfully');
      } else {
        Utils.snackbarFailed('No leads found');
      }
    }).onError((error, stackTrace) {
      // Handle any error here
      Utils.snackbarFailed('Failed to fetch leads');
      print('Error: $error');
    });

  }
}



