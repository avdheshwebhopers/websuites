// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import '../../../../../Utils/utils.dart';
// import '../../../../../data/models/requestModels/customer/master/company_credential/company_credential_update/company_credential_update_request_model.dart';
// import '../../../../../data/repositories/repositories.dart';
// class CompanyCredentialUpdateViewModel extends GetxController{
//   final _api = Repositories();
//   RxBool loading = false.obs;
//   Future<void> companyCredentialUpdate(BuildContext context) async {
//
//     CompanyCredentialUpdateRequestModel companyCredentialUpdateRequestModel=CompanyCredentialUpdateRequestModel(name:"sak");
//     loading.value = true;
//     _api.customerMasterCompanyCredentialUpdate(companyCredentialUpdateRequestModel.toJson()).then((value) {
//       if (value.id!.isNotEmpty) {
//         if (kDebugMode) {
//           print("Customer Company Credential Update${value.id}");
//           print("Customer Company Credential  Update ${value.name}");
//         }
//         Utils.snackbarSuccess('Customer Company Credential List fetch');
//         loading.value = false;
//       }
//       else {
//         Utils.snackbarFailed('Customer Company Credential  not fetched');
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     }
//     );
//   }
//
//
//
// }