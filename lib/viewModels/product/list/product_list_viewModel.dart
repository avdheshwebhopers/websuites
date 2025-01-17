import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/data/repositories/repositories.dart';
import 'package:websuites/utils/utils.dart';
import 'package:websuites/data/models/requestModels/product/list/product_list_request_model.dart';
import 'package:websuites/data/models/responseModels/products/list/products_list_response_model.dart';


class ProductListViewModel extends GetxController {
  final api = Repositories();
  RxBool loading = false.obs;
  RxList<Item> products = <Item>[].obs; // Correctly defined as RxList<Item>

  Future<void> productList(BuildContext context) async {
    loading.value = true;

    ProductListRequestModel requestModel = ProductListRequestModel(
      brand: null,
      division: null,
      limit: 15,
      page: 1,
      productType: null,
      search: "",
      status: null,
    );

    try {
      final response = await api.productList(requestModel.toJson());

      // Ensure the response is of the correct type
      if (response is ProductsListResponseModel) {
        if (response.items.isNotEmpty) {
          products.value = response.items; // Assign the list of items directly
          Utils.snackbarSuccess('Products list fetched successfully');
        } else {
          Utils.snackbarFailed('No products found');
        }
      } else {
        Utils.snackbarFailed('Invalid response format');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching products: ${error.toString()}');
      }
      Utils.snackbarFailed('Error fetching products');
    } finally {
      loading.value = false;
    }
  }
}