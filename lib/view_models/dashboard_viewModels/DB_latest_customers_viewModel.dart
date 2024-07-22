import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Data/repositories/repositories.dart';
import '../../../Utils/utils.dart';

class DB_LatestCustomers_ViewModel{

  final _api = Repositories();

  RxBool loading = false.obs;


  Future<void> DB_LatestCustomers(BuildContext context)async{

    loading.value = true;
    _api.DB_LatestCustomersApi().then((value){
      if(value.items != null){
        Utils.SnackbarSuccess('leads list fetched');

      }else{
        Utils.SnackbarFailed('leads list not fetched');
      }
      loading.value = false;

    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}
