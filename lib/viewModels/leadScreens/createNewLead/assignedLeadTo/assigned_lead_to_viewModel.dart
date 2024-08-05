import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class AssignedLeadToViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> assignedLead (BuildContext context) async {
    loading.value = true;

    _api.assignedLeadApi().then((value) {

      if(value.id!= null){
        Utils.SnackbarSuccess('lead Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('lead Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}