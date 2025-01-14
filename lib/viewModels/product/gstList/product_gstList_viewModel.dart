import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/products/gst_list/product_gstList_response_model.dart';

class ProductGstListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<ProductGstListResponseModel> productGstList = <ProductGstListResponseModel>[].obs; // Observable list

  // This will hold the filtered list based on the search query
  RxList<ProductGstListResponseModel> filteredProductGstList = <ProductGstListResponseModel>[].obs;

  Future<void> fetchProductGstList() async {
    loading.value = true;
    _api.productGstList().then((value) {
      if (value.isNotEmpty) {
        productGstList.value = value; // Store the fetched data in the observable list
        filteredProductGstList.value = value; // Initialize the filtered list
        for (var data in value) {
          print("Product gst List name ${data.name}");
          print("Product gst List id ${data.id}");
          print("Product gst List cgst ${data.cgst}");
          print("Product gst List status ${data.status}");
        }
        Utils.snackbarSuccess('Product GST List fetched');
      } else {
        Utils.snackbarFailed('Product GST List not fetched');
      }
      loading.value = false;
    }).onError((error, stackTrace) {
      loading.value = false; // Ensure loading is set to false on error
      Utils.snackbarFailed('Error fetching product GST List');
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // Method to filter the product list based on the search query
  void filterProductGstList(String query) {
    if (query.isEmpty) {
      filteredProductGstList.value = productGstList; // Reset to the full list if the query is empty
    } else {
      filteredProductGstList.value = productGstList.where((product) {
        return product.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
    }
  }
}