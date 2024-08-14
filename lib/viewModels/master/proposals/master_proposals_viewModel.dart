import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class MasterProposalsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> masterProposals (BuildContext context) async {
    loading.value = true;

    _api.masterProposalsApi().then((value) {

      if(value.id!= null){
        Utils.snackbarSuccess('master Proposals fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('master Proposals not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}