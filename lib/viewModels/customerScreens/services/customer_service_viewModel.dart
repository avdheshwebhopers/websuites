<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/utils.dart';
import '../../../data/models/requestModels/customer/services/customer_services_area_request_model.dart';
import '../../../data/models/responseModels/customers/services/customer_services_response_model.dart';
import '../../../data/repositories/repositories.dart';
=======
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
>>>>>>> origin/main

class CustomerServiceViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
<<<<<<< HEAD
  Rx<CustomerServiceResponseModel?> response = Rx<CustomerServiceResponseModel?>(null);

  Future<void> customerServicesList(BuildContext context) async {
    loading.value = true;
    CustomerServicesRequestModel customerServicesRequestModel = CustomerServicesRequestModel(
      dateRange: null,
      dateRangeTo: null,
      filterDays: null,
      filterDaysType: null,
      limit: 15,
      page: 1,
      search: "",
      statusType: null,
    );

    try {
      final responseData = await _api.customerServices(customerServicesRequestModel.toJson());
      response.value = responseData; // Store the response

      if (responseData.items.isEmpty) {
        Utils.snackbarFailed('No customer services found');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackbarFailed('Failed to fetch customer services');
    } finally {
      loading.value = false;
    }
=======

  Future<void> customerService (BuildContext context) async {
    loading.value = true;

    _api.customersPaymentReminderApi().then((value) {

      if(value.items!= null){
        Utils.snackbarSuccess('customer service fetched');
        loading.value = false;

      }else{
        Utils.snackbarFailed('customer service not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
>>>>>>> origin/main
  }
}