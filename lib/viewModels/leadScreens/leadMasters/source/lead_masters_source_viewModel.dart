import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/models/responseModels/leads/leadMasters/source/source_response_model.dart';
import '../../../../../data/repositories/repositories.dart';

class LeadMastersSourceViewmodel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<LeadMasterSourceResponseModel> sourceData = <LeadMasterSourceResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // You could also fetch data here instead of using addPostFrameCallback
    // leadMasterSource(Get.context!);
  }

  Future<void> leadMasterSource(BuildContext context) async {
    loading.value = true;
    sourceData.clear(); // Clear existing data before fetching new data

    try {
      final List<LeadMasterSourceResponseModel> data = await _api.leadMasterSource();
      if (data.isNotEmpty) {
        sourceData.assignAll(data); // Use assignAll instead of value =
        // Utils.snackbarSuccess('Source data fetched successfully');
      } else {
        // Utils.snackbarFailed('No source data available');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching source data: $error');
      }
      // Utils.snackbarFailed('Error fetching data: ${error.toString()}');
    } finally {
      loading.value = false;
    }
  }
}