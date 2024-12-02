
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/repositories/repositories.dart';

class LeadSettingRolesViewmodel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> settingRoles(BuildContext context) async {
    loading.value = true;
    _api.settingRoleApi().then((value) {
      print("Lead Setting Roles Value $value");
      if (value.isNotEmpty) {
        for (var responseData in value) {
          print("Lead Settings Roles data ${responseData.name}");
          Utils.snackbarSuccess('Lead Setting Roles fetched');
        }
        loading.value = false;
      } else {
        Utils.snackbarFailed('No Data fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}