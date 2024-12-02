import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/responseModels/leads/setting/field_setting/field_setting.dart';
import '../../../../data/repositories/repositories.dart';


class FieldSettingController extends GetxController {
  final api = Repositories();
  RxBool loading = false.obs;
  RxBool dataLoaded = false.obs;  // Flag to track if data has been loaded
  RxList<FieldSettingResponseModel> fieldsettings = <FieldSettingResponseModel>[].obs;

  Future<void> fieldSettingList(BuildContext context) async {
    if (dataLoaded.value) {
      return; // Skip loading if data has already been loaded
    }

    loading.value = true;
    try {
      final value = await api.fieldSetting();
      if (value.isNotEmpty) {
        fieldsettings.value = value;
        dataLoaded.value = true; // Set flag to true once data is loaded
      } else {
        Utils.snackbarFailed('Field Setting not fetched');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching field settings: $error');
      }
      Utils.snackbarFailed('Error fetching field settings');
    } finally {
      loading.value = false;
    }
  }

  // Method to update isRequired status
  void toggleFieldRequired(String id, bool? isRequired) {
    int index = fieldsettings.indexWhere((field) => field.id == id);
    if (index != -1) {
      fieldsettings[index].isRequired = isRequired;
      fieldsettings.refresh(); // Refresh the observable list to update UI
    }
  }
}






