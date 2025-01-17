import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/sales/SalesListRequestModel.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../data/models/responseModels/sales/sales_response_model.dart';

class SalesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> salesList = <Items>[].obs;

  Future<void> salesApi(BuildContext context) async {
    loading.value = true;
    SalesListRequestModel salesResponseModel = SalesListRequestModel(limit: 15, page: 1);

    try {
      SalesResponseModel response = await _api.salesApi(salesResponseModel.toJson());

      if (response.items != null && response.items!.isNotEmpty) {
        salesList.value = response.items!;

        for (var data in response.items!) {
          debugPrint('Sale List Name: ${data.name}');
          debugPrint('Sale List Email: ${data.team?.email}');
          debugPrint('Sale List Category: ${data.team?.crm_category}');
          debugPrint('Sale List Sale Target: ${data.members?[0].sale_target}');
        }

        // Utils.snackbarSuccess('Sales data fetched successfully');
        print('Sales data fetched successfully');
        loading.value = false;
      } else {
        // Utils.snackbarFailed('No sales data found');
        print('No sales data found');

        loading.value = false;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackbarFailed('Error fetching sales data');
      loading.value = false;
    }
  }
}