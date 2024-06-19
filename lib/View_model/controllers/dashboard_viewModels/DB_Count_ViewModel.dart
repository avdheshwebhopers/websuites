import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/Utils.dart';
import '../../../data/repository/Repositories.dart';


class DashboardCountViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;


  Future<void> DBCount(BuildContext context) async {
    loading.value = true;


    _api.dashboardCountApi().then((value) {

      if(value.customers!= null){

        Utils.SnackbarSuccess('Id fetched');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('ID not fetched');

      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }
}