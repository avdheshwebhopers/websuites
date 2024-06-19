import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/Utils.dart';
import '../../../data/repository/Repositories.dart';


class DbTransactionsViewmodel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;


  Future<void> Db_transactions(BuildContext context)async{

    loading.value = true;
    _api.DB_TransactionApi().then((value){
      if(value.items != null){
        Utils.SnackbarSuccess('transactions fetched');

      }else{
        Utils.SnackbarFailed('transactions not fetched');
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
