import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class CustomerListDetailViewListModel extends GetxController{
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerDetailViewList(BuildContext context) async {
    loading.value = true;
    _api.customersListCustomerDetailViewList().then((value) {
      print("Customer Type api $value");
      if (value.id!= null && value.id!.isNotEmpty){
        if (kDebugMode) {
          print('Customer List Detail view List FirstName ${value.firstName}');
          print(" Customer List Detail view List Email ${value.contact?.email} ");
          print(" Customer List Detail view List Divisions${value.divisions} ");
        }
        Utils.snackbarSuccess('Customer Orderless Services successfully');
      } else {
        Utils.snackbarFailed('Customer Type data not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}



