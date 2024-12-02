import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/lead/lead_list/lead_detail_view/update_status/lead_detail_update_status_request_model.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class LeadDetailUpdateStatusViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> leadDetailUpdateStatus(BuildContext context) async {
    loading.value = true;

    LeadUpdateStatusRequestModel leadUpdateStatusRequestModel=LeadUpdateStatusRequestModel(remark: "Testing Purpose", status: "in_progress");
    _api.leadDetailUpdateStatus(leadUpdateStatusRequestModel.toJson()).then((response) {
      if(response.message!.isNotEmpty){
          if (kDebugMode) {
            print("Lead Detail Update Status Response ${response.message}");
          }
          Utils.snackbarSuccess('Lead Detail Update Status  data fetch');
        loading.value = false;
      }
      else {
        Utils.snackbarFailed('Lead Detail  Update Status data not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }





}