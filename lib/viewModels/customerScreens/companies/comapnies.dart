// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import '../../../Utils/utils.dart';
// import '../../../data/models/requestModels/customer/companies/customer_companies.dart';
// import '../../../data/models/responseModels/customers/companies/customer_companies_response_model.dart';
// import '../../../data/repositories/repositories.dart';
//
// class CustomerCompaniesViewModel extends GetxController {
//   final _api = Repositories();
//
//   RxBool loading = false.obs;
//   RxList<Items> companies = <Items>[].obs;
//
//   // Method to fetch customer companies with flexible parameters
//   Future<void> companyList(BuildContext context, {
//     String? customer,
//     String? dateRange,
//     String? dateRangeTo,
//     String? division,
//     int? limit = 15,
//     int? page = 1,
//     String? reminderTo,
//     String? reminderType,
//     int? rowsPerPage = 15,
//     String? status,
//   }) async {
//     loading.value = true; // Set loading to true at the start
//     try {
//       // Create a request model with dynamic fields
//       CustomerCompaniesRequestModel companiesRequestModel = CustomerCompaniesRequestModel(
//         customer: customer,
//         dateRange: dateRange,
//         dateRangeTo: dateRangeTo ?? 'reminder_date',  // Default value for dateRangeTo
//         division: division,
//         limit: limit,
//         page: page,
//         reminderTo: reminderTo,
//         reminderType: reminderType,
//         rowsPerPage: rowsPerPage,
//         status: status,
//       );
//
//       // Call the API to get the company list
//       final response = await _api.customerCompaniesList(companiesRequestModel.toJson());
//
//       // Handle the response
//       if (response.items != null && response.items!.isNotEmpty) {
//         companies.value = response.items!;
//         Utils.snackbarSuccess('Customer companies fetched successfully');
//       } else {
//         Utils.snackbarFailed('No companies found');
//         companies.clear();
//       }
//     } catch (error) {
//       Utils.snackbarFailed('Error fetching companies: ${error.toString()}');
//       if (kDebugMode) {
//         print('Company List Error: $error');
//       }
//       companies.clear();
//     } finally {
//       loading.value = false; // Set loading to false at the end
//     }
//   }
// }
