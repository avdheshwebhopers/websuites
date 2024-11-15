import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class LeaveViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> leaveApi (BuildContext context) async {
    loading.value = true;

    _api.leaveApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('leave id fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('leave Id not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString()
        );
      }
    }
    );
  }
}

