import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/leads/setting/setting.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class LeadSettingsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<LeadSettingResponseModel> settings = <LeadSettingResponseModel>[].obs;

  Future<void> fetchLeadSettings(BuildContext context) async {
    loading.value = true;

    try {
      final response = await _api.leadSettingList();
      settings.value = response;
      print("Lead settings fetched successfully");
      // Utils.snackbarSuccess('Lead settings fetched successfully');
      loading.value = false;
    } catch (error) {
      loading.value = false;
      print(" Failed to fetch lead settings ");
      // Utils.snackbarFailed('Failed to fetch lead settings');
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}