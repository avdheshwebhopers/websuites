import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/responseModels/leads/setting/custom_field/custom_fields.dart';
import '../../../../data/repositories/repositories.dart';

class LeadSettingCustomFieldsViewmodel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  // Store fetched custom fields
  RxList<SettingCustomFieldsResponseModel> customFields = <SettingCustomFieldsResponseModel>[].obs;

  Future<void> settingCustomFields(BuildContext context) async {
    loading.value = true;
    try {
      final value = await _api.settingCustomFields();
      print("Lead Setting CustomFields Value $value");
      if (value.isNotEmpty) {
        customFields.value = SettingCustomFieldsResponseModel.fromJsonList(value);
      } else {
        print("Lead Settings CustomFields data not fetched");
      }
    } catch (e) {
      print("Error fetching custom fields: $e");
    } finally {
      loading.value = false;
    }
  }

  void toggleFieldRequired(String id, bool? isRequired) {
    int index =  customFields.indexWhere((field) => field.id == id);
    if (index != -1) {
      customFields[index].required = isRequired;
      customFields.refresh(); // Refresh the observable list to update UI
    }
  }
}
