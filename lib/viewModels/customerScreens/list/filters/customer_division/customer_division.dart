import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class CustomerDivisionViewModel extends GetxController{
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerListDivision(BuildContext context) async {
    loading.value = true;
    _api.customerDivision().then((value) {
      if (kDebugMode) {
        print("Customer Division api $value");
      }
      if (value.isNotEmpty) {
        for (var responseData in value) {
          if (kDebugMode) {
            print("Customer Division Api ${responseData.name}");
          }
          Utils.snackbarSuccess(' data fetched');
        }
        loading.value = false;
      } else {
        Utils.snackbarFailed('Customer Division api data not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}