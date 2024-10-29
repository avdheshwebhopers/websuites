// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../data/repositories/repositories.dart';
// import '../../../../utils/utils.dart';
// class ProductCategoriesViewModel extends GetxController {
//   final Repositories _api = Repositories();
//   RxList<String> customerActivation = RxList<String>();
//   RxBool isLoading = false.obs;
//
//   Future<void> fetchProductCategories() async {
//     isLoading.value = true; // Set loading to true
//     try {
//       // Fetch categories from the API
//       List<String> categories = await _api.fetchProductCategories();
//       customerActivation.value = categories; // Update the reactive list with categories
//     } catch (e) {
//       print('Error fetching product categories: $e'); // Handle errors
//     } finally {
//       isLoading.value = false; // Set loading to false
//     }
//   }
// }
