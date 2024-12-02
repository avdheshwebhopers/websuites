import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/customer/customer_city/customer_city.dart';
import '../../../../../Utils/utils.dart';

import '../../../../../data/repositories/repositories.dart';

class FilterCityViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  CitySearchRequestModel requestModel = CitySearchRequestModel(search: '');
  Future<void> filterCity(BuildContext context) async {
    loading.value = true;
    _api.filterCityApi(requestModel.toJson()).then((response) {
      // Successfully fetched the leads
      if (response.items != null && response.items!.isNotEmpty) {
        // Process each lead item
        for (var item in response.items!) {
          // Print or handle each lead item here
          print('filterCity id: ${item.id}');
          print('filterCity name: ${item.name}');
        }
        Utils.snackbarSuccess('Lead Filter city fetched successfully');
      } else {
        Utils.snackbarFailed('No leads found');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}