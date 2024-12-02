// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
// import '../../../../../Utils/utils.dart';
// import '../../../../../data/repositories/repositories.dart';
//
//
// class LeadListColumnListViewModel extends GetxController{
//
//   final _api = Repositories();
//   RxBool loading = false.obs;
//   Future<void> leadListColumnList(BuildContext context) async {
//     loading.value = true;
//     _api.leadListColumnList().then((value) {
//       if(value.isNotEmpty){
//         for (var responseData in value) {
//           if (kDebugMode) {
//             print("Lead List Column List ${responseData.leadField}");
//
//           }
//           Utils.snackbarSuccess('Lead Detail Proposal data fetch');
//         }
//         loading.value = false;
//       }
//       else {
//         Utils.snackbarFailed('Lead Detail activity call not fetched');
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
//
//
//
//
//
//
//
//
//
//
// }
//
//
//
//
