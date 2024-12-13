import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/product/master/product_master_list_request_model.dart';

class ProductMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> productMaster (BuildContext context) async {
    loading.value = true;
    ProductMasterListRequestModel requestModel=ProductMasterListRequestModel(
      limit: 15,
      page: 1,
      search: "",
    );

    _api.masterProductList(requestModel.toJson()).then((value) {
      // if (value.items != null && value.items!.isNotEmpty) {
      //   Utils.snackbarSuccess('Product master fetched');
      //   loading.value = false;
      // }
      // else{
      //   Utils.snackbarFailed('product master not fetched');
      // }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}