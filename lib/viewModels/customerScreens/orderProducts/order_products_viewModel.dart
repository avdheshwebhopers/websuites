import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/customer/customer_order_product/order_product_list/customer_order_product_request_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:websuites/data/models/requestModels/customer/customer_order_product/order_product_list/customer_order_product_request_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import 'package:websuites/data/models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';

class CustomerOrderProductsListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> _items = <Items>[].obs; // Use RxList to make it reactive

  // Public getter to access items
  List<Items> get items => _items;

  Future<void> customerOrderProducts(BuildContext context) async {
    if (_items.isNotEmpty) return; // Prevent fetching if data already exists

    loading.value = true;
    CustomerOrderProductRequestModel customerOrderProductRequestModel = CustomerOrderProductRequestModel(
      btnLabel: "Submit",
      createdBy: null,
      customer: null,
      dateRange: null,
      fiscalYearLabel: null,
      isModalShow: false,
      isTaxable: "No",
      limit: 15,
      modalType: "Add",
      page: 1,
      paymentType: null,
      product: null,
      productType: null,
      search: "",
      status: null,
    );

    try {
      // Fetching the data
      final response = await _api.customerOrderProduct(customerOrderProductRequestModel.toJson());
      if (response.items != null && response.items!.isNotEmpty) {
        _items.assignAll(response.items!); // Store the items in the reactive list
        Utils.snackbarSuccess('Customer list fetched successfully');
      } else {
        Utils.snackbarFailed('Customer order Products not fetched');
      }
    } catch (error) {
      Utils.snackbarFailed('Error: $error');
    } finally {
      loading.value = false;
    }
  }
}
