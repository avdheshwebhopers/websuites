import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/product/master/product_master_list_request_model.dart';
import '../../../data/models/responseModels/products/master/product_master_response_model.dart'; // Import your response model


class ProductMasterViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> items = <Items>[].obs; // To store the items
  RxList<Items> filteredItems = <Items>[].obs; // To store the filtered items

  Future<void> productMaster(BuildContext context) async {
    loading.value = true;
    ProductMasterListRequestModel requestModel = ProductMasterListRequestModel(
      limit: 15,
      page: 1,
      search: "",
    );

    try {
      final response = await _api.masterProductList(requestModel.toJson());

      // Check if the response is of the expected type

      // plese uncomment it

      if (response is ProductMasterResponseModel) {
        // if (response.items != null && response.items!.isNotEmpty) {
        //   items.value = response.items!; // Update the list of items
        //   filteredItems.value = items; // Initialize filtered items with all items
        // } else {
        //   Utils.snackbarFailed('No products found');
        // }
      } else {
        Utils.snackbarFailed('Unexpected response format');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      Utils.snackbarFailed('Something went wrong!');
    } finally {
      loading.value = false; // Ensure loading is stopped in case of error
    }
  }

  void filterMasterList(String query) {
    if (query.isEmpty) {
      filteredItems.value = items; // Reset to the full list if the query is empty
    } else {
      filteredItems.value = items.where((product) {
        return product.product?.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
    }
  }
}