import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/responseModels/leads/Leadlist/lead_list.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../data/models/responseModels/leads/Leadlist/lead_list.dart' as leadModels;
import '../../../data/models/requestModels/lead/lead_list.dart';

class LeadListViewModel extends GetxController {
  final api = Repositories();
  RxBool loading = false.obs;
  RxList<leadModels.Items> leadList = <leadModels.Items>[].obs;

  // Add a method to format the date string
  String formatCreatedAt(String? dateString) {
    if (dateString == null) return 'No Date';
    try {
      final DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('EEE dd, MMMM yyyy \'at\' hh:mm a').format(dateTime);
    } catch (e) {
      print('Error formatting date: $e');
      return 'Invalid Date';
    }
  }

  Future<void> fetchLeadList(BuildContext context) async {
    loading.value = true;

    // Initial request model
    RequestModel requestModel = RequestModel(
      city: "",
      customFields: {},
      division: "",
      isOpen: false,
      isForeignLead: false,
      leadAssigned: "",
      leadAssignedToTeam: false,
      limit: 1000, // Set a high limit
      noCampaign: false,
      page: 1,
      paginationType: "old",
      productCategory: "",
      queryType: "",
      range: null,
      search: "",
      serviceType: [],
      source: "",
      status: "",
      subTypes: [],
      type: "",
    );

    try {
      List<leadModels.Items> allLeads = []; // To store all leads
      bool hasMore = true;

      while (hasMore) {
        // Debugging: print the current request parameters
        print('Fetching leads for page: ${requestModel.page}');
        LeadListResponseModel response = await api.leadList(requestModel.toJson());

        // Debugging: print the response
        print('Response: ${response.toJson()}');

        if (response.items != null && response.items!.isNotEmpty) {
          allLeads.addAll(response.items!);
          requestModel.page++; // Increment page for the next request
        } else {
          hasMore = false; // No more leads to fetch
        }
      }

      leadList.value = allLeads; // Set the fetched leads to the observable list
    } catch (e) {
      print('Error: $e');
    } finally {
      loading.value = false;
    }
  }

}
