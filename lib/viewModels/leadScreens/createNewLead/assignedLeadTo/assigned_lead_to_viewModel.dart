import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/responseModels/leads/createNewLead/assignedLeadTo/assigned_lead_to_response_model.dart';
import '../../../../data/repositories/repositories.dart';

class AssignedLeadToViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<String> categoriesRxList = RxList<String>();
  RxString selectedLeadName = ''.obs;

  Future<void> assignedLead(BuildContext context) async {
    loading.value = true;

    try {
      List<AssignedLeadToResponseModel> response = await _api.assignedLeadApi();
      if (response.isNotEmpty) {
        print("lead id fetched");
        categoriesRxList.clear();
        for (var item in response) {
          categoriesRxList.add(
              '${item.first_name ?? ''} ${item.last_name ?? ''}\n${item.email ?? ''}');
        }
        loading.value = false;
      } else {
        print("lead Id not fetched");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
