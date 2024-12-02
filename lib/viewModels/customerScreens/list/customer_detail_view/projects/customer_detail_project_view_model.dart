import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';

class CustomerDetailProjectViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerDetailProjectType(BuildContext context) async {
    loading.value = true;
    _api.customerDetailViewProject().then((response) {
      if (response.id!.isNotEmpty) {
        // Process each lead item
        print('Customer Detail View project ${response.projects?.first.id}');
        Utils.snackbarSuccess('Customer Detail Project data fetch');
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