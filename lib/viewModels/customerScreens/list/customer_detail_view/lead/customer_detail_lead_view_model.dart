import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';
class CustomerDetailLeadViewModel extends GetxController{
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> customerDetailLeadType(BuildContext context) async {
    loading.value = true;
    _api.customerDetailViewLead().then((response) {
      if (response.id!.isNotEmpty) {

          print('Customer Detail View Lead data: ${response.firstName}');
          print('Customer Detail View Lead data: ${response.contact?.mobile}');

        Utils.snackbarSuccess('Customer Detail View Lead data fetch');
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