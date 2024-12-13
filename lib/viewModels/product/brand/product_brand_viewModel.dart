import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
class ProductBrandViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> productBrand (BuildContext context) async {
    loading.value = true;
    _api.productBrand().then((value) {
      if(value.isNotEmpty){
        for(var data in value){
          print("Product Response name  ${data.id}");
          print("Product Response name ${data.name}");
          print("Product Response division id ${data.division?.id}");
          print("Product Response mobile ${data.division?.mobileNo}");
        }
        Utils.snackbarSuccess('product brand fetched');
        loading.value = false;
      }else {
        Utils.snackbarFailed('product brand not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}