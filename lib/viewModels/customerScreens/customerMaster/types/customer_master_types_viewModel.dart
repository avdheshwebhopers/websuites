// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../data/repositories/repositories.dart';
// import '../../../../utils/utils.dart';
//
// class CustomerMasterTypesViewModels extends GetxController {
//   final _api = Repositories();
//   RxBool loading = false.obs;
//
//   Future<void> customerMasterTypes(BuildContext context) async {
//     loading.value = true;
//     _api.customerMasterCustomerType().then((value) {
//       if (value.isNotEmpty) {
//         for (var responseData in value) {
//           if (kDebugMode) {
//             print("Customer Master Credential name ${responseData.name}");
//             print("Customer master Company Credential  ${responseData.createdAt}");
//           }
//           Utils.snackbarSuccess('Customer master Company Credential List fetch');
//         }
//         loading.value = false;
//       } else {
//         Utils.snackbarFailed('customerMasterTypes not fetched');
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }
