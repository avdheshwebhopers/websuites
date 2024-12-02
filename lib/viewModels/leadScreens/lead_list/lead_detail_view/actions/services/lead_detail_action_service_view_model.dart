import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/lead/lead_list/lead_detail_view/action/services/lead_detail_action_service_request_model.dart';

import '../../../../../../Utils/utils.dart';
import '../../../../../../data/repositories/repositories.dart';

class LeadDetailActionServiceViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> leadDetailActionService(BuildContext context) async {
    loading.value = true;
    LeadDetailActionServiceRequestModel requestModel = LeadDetailActionServiceRequestModel(
      activity: "services",
      lat: 30.900965,
      lng: 75.8572758,
      remark: "Blyster, Antibiotic, Antidepressant",
      services: [
        "1b8b5712-942e-4a32-b4f4-cbe46cab49cf",
        "309cc464-01a9-4fd3-a400-093fd62cf954",
      ],
    );

    _api.leadDetailActionService(requestModel.toJson()).then((response) {
      if (response.id!.isNotEmpty) {
        // Print or handle each lead item here
        print('Lead Detail Action Service Activity : ${response.activity}');
        print('Lead Detail Action Service Meeting  : ${response.meetingWith}');
        print('Lead Detail Action Service Remark : ${response.remark}');


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