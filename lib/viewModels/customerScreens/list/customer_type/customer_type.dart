import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/repositories/repositories.dart';

class CustomerTypeViewModels extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerTypeList(BuildContext context) async {
    loading.value = true;
    _api.customerType().then((value) {
      print("Customer Type api $value");
      if (value.isNotEmpty) {
        for (var responseData in value) {
          print("Customer Type Api ${responseData.name}");
          Utils.snackbarSuccess(' data fetched');
        }
        loading.value = false;
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