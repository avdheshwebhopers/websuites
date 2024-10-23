import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/leads/leadMasters/types/types_response_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class LeadMasterTypesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<LeadMasterTypeResponseModel> leadMasterTypesList =
      <LeadMasterTypeResponseModel>[].obs;

  Future<void> fetchLeadMasterTypes(BuildContext context) async {
    loading.value = true;
    try {
      List<LeadMasterTypeResponseModel> response = await _api.leadMasterType();
      if (response.isNotEmpty) {
        leadMasterTypesList.value = response;
        // Utils.snackbarSuccess('Lead Master type data fetched');
      } else {
        // Utils.snackbarFailed('No Data fetched');
      }
    } catch (error) {
      // Utils.snackbarFailed('Failed to fetch data');
      debugPrint(error.toString());
    } finally {
      loading.value = false;
    }
  }
}

// lib/views/lead_screens/lead_masters/widgets/lead_master_card.dart