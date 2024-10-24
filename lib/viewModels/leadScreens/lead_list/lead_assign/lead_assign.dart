import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';

import '../../../../data/models/requestModels/list_lead_assign/list_lead_assign.dart';
import '../../../../data/repositories/repositories.dart';
class ListLeadAssignViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  LeadAssignRequestModel requestModel = LeadAssignRequestModel(
    data: "", // Passing empty data
    userId: null, // Passing null userId (or you can pass a specific userId here)
  );
  Future<void> listLeadAssign(BuildContext context) async {
    loading.value = true;
    _api.leadListLeadAssign(requestModel.toJson()).then((value) {
      print("Value $value");
      if (value.isNotEmpty) {
        for (var responseData in value) {
          print("List LeadAssign Value ${responseData.firstName}");
          if (responseData.id != null) {
            Utils.snackbarSuccess('Lead Assign fetched');
          } else {
            Utils.snackbarFailed(
                'No Data Fetched');
          }
        }
        loading.value = false;
      } else {
        Utils.snackbarFailed('master divisions not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
