import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../data/models/responseModels/leads/trashLeads/leadTypes/lead_types_response_model.dart';
import '../../../../../data/repositories/repositories.dart';


class LeadTypeViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<LeadTypesResponseModel> leadTypesList = <LeadTypesResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeadTypes();
  }

  Future<void> fetchLeadTypes() async {
    loading.value = true;
    try {
      final response = await _api.leadTypeApi();
      leadTypesList.assignAll(response);
      // Utils.snackbarSuccess('Lead types fetched successfully');
      print("Lead types fetched successfully");
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching lead types: $error');
      }
      // Utils.snackbarFailed('Error fetching lead types');
      print("Error fetching lead types");
    } finally {
      loading.value = false;
    }
  }

  List<String> getLeadTypeNames() {
    return leadTypesList
        .expand((leadType) => [
      if (leadType.name != null && leadType.name!.isNotEmpty) leadType.name!,
      ...?leadType.children?.map((child) => child.name ?? '').where((name) => name.isNotEmpty),
    ])
        .toList();
  }
}