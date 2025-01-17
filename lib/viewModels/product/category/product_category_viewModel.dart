import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/products/category/product_category_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/products/category/product_category_response_model.dart';


class ProductCategoryViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<ProductCategoryResponseModel> categories = <ProductCategoryResponseModel>[].obs;
  RxList<ProductCategoryResponseModel> filteredCategories = <ProductCategoryResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filtered categories with all categories
    filteredCategories.value = categories;
  }

  Future<void> productCategory(BuildContext context) async {
    loading.value = true;
    try {
      final response = await _api.productCategoryApi();
      categories.clear();
      categories.addAll(response);

      filteredCategories.value = categories;

    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }

    } finally {
      loading.value = false;
    }
  }

  // Add search functionality
  void searchCategories(String query) {
    if (query.isEmpty) {
      filteredCategories.value = categories;
    } else {
      filteredCategories.value = categories.where((category) =>
      category.name?.toLowerCase().contains(query.toLowerCase()) ?? false
      ).toList();
    }
  }

  // New method to add a category

}

