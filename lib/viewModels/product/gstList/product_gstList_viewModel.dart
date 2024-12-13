import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
class ProductGstListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productGstList (BuildContext context) async {
    loading.value = true;
    _api.productGstList().then((value) {
      if(value.isNotEmpty){
        for(var data in value){
          print("Product gst List name ${data.name}");
          print("Product gst List id${data.id}");
          print("product gst List cgst ${data.cgst}");
          print("product gst List status ${data.status}");
          print("Product gst List");
        }
          Utils.snackbarSuccess('product GstList fetched');
        loading.value = false;

      }else {
        Utils.snackbarFailed('product GstList not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}