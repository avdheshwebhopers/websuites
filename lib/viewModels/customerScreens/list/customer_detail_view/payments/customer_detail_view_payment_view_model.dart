import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';
class CustomerDetailPaymentViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerDetailViewPaymentList(BuildContext context) async {
    loading.value = true;
    _api.customerDetailViewPaymentList().then((value) {
      if(value.isNotEmpty){
        for (var responseData in value) {
          if (kDebugMode) {
            print("Customer Detail View Payment  ${responseData.amount}");
            print("Customer Detail View Payement PaymentType ${responseData.paymentType}");
          }
          Utils.snackbarSuccess('Customer Detail View Payement');
        }
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