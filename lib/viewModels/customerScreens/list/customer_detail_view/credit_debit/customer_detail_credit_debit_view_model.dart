import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class CustomerDetailCreditDebitViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerDetailViewCreditDebit(BuildContext context) async {
    loading.value = true;
    _api.customerDetailViewCreditDebit().then((value) {
          if (kDebugMode) {
            print("Customer Detail View Debit credit ${value.creditDebit.first.amount}");
          Utils.snackbarSuccess('Customer Detail View Credit Debit');
        loading.value = false;
      }
      else {
        Utils.snackbarFailed('Customer Type data not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}