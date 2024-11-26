import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../../../Utils/utils.dart';
import '../../../../../../data/models/requestModels/lead/lead_list/lead_detail_view/action/lead/lead_detail_action_lead_request_model.dart';
import '../../../../../../data/models/requestModels/lead/lead_list/lead_detail_view/action/services/lead_detail_action_service_request_model.dart';
import '../../../../../../data/repositories/repositories.dart';

class LeadDetailActionLeadViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> leadDetailActionLead(BuildContext context) async {
    loading.value = true;
    LeadDetailActionLeadRequestModel requestModel = LeadDetailActionLeadRequestModel(
      activity: "lead_type",
      lat: 30.900965,
      lng: 75.8572758,
      leadType: "7bf25d2f-ccf2-4698-8b9b-055f986efd35",
      remark: "Hot, No Longer need, ",
      subLeadType: null, // This can be null
    );

    _api.leadDetailActionLead(requestModel.toJson()).then((response) {
      if (response.id!.isNotEmpty) {
        // Print or handle each lead item here
        print('Lead Detail Action Lead Activity : ${response.activity}');
        print('Lead Detail Action Lead Meeting  : ${response.meetingWith}');
        print('Lead Detail Action Lead Remark : ${response.remark}');


        Utils.snackbarSuccess('Lead list fetched successfully');
      }
      //Lead Detail Action Service
      else {
        Utils.snackbarFailed('Lead Detail Action Service data not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}