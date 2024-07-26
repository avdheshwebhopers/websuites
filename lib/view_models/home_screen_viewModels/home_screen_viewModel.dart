import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Data/repositories/repositories.dart';
import '../../../Utils/utils.dart';

class HomeScreenViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;


  Future<void> dashboard(BuildContext context)async{

    loading.value = true;
    _api.dashboardApi().then((value){
      if(value.id != null){
        Utils.SnackbarSuccess('charts fetched');

      }else{
        Utils.SnackbarFailed('charts not fetched');
      }
      loading.value = false;

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}

