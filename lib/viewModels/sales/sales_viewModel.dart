import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/sales/sales_list_request_model.dart';
import 'package:websuites/data/models/responseModels/sales/sales_response_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';

class SalesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  // Observable for the sales response model with proper initialization
  final Rx<SalesResponseModel> salesResponseModel = SalesResponseModel(
    items: [],
    meta: null,
  ).obs;

  // Observable for error state
  RxString error = ''.obs;

  // Pagination variables
  RxInt currentPage = 1.obs;
  final int itemsPerPage = 15;
  RxBool hasMoreData = true.obs;

  // Refresh control
  Future<void> refreshSales(BuildContext context) async {
    currentPage.value = 1;
    hasMoreData.value = true;
    await salesApi(context);
  }

  // Load more data
  Future<void> loadMoreSales(BuildContext context) async {
    if (!loading.value && hasMoreData.value) {
      currentPage.value++;
      await salesApi(context);
    }
  }

  Future<void> salesApi(BuildContext context) async {
    try {
      if (currentPage.value == 1) {
        loading.value = true;
      }

      error.value = '';

      final requestModel = SalesListRequestModel(
        limit: itemsPerPage,
        page: currentPage.value,
      );

      final response = await _api.salesApi(requestModel.toJson());

      if (currentPage.value == 1) {
        salesResponseModel.value = response;
      } else {
        // Append new items to existing list for pagination
        final updatedItems = [...salesResponseModel.value.items, ...response.items];
        salesResponseModel.value = SalesResponseModel(
          items: updatedItems,
          meta: response.meta,
        );
      }

      // Update pagination status
      hasMoreData.value = (response.meta?.currentPage ?? 0) < (response.meta?.totalPages ?? 0);
      // Show success message only on initial load
      if (currentPage.value == 1) {
        Utils.snackbarSuccess('Sales data fetched successfully');
      }

      // Log data in debug mode
      if (kDebugMode) {
        _logSalesData(response);
      }
    } catch (e, stackTrace) {
      error.value = e.toString();
      if (kDebugMode) {
        print('Sales API Error: $e');
        print('Stack trace: $stackTrace');
      }
      Utils.snackbarFailed('Failed to fetch sales data: ${e.toString()}');
    } finally {
      loading.value = false;
    }
  }

  // Helper method to log sales data in debug mode
  void _logSalesData(SalesResponseModel response) {
    print('--- Sales Data Log ---');
    print('Total Items: ${response.meta?.totalItems}');
    print('Current Page: ${response.meta?.currentPage}');
    print('Items per Page: ${response.meta?.itemsPerPage}');

    for (var data in response.items) {
      print('Sale Name: ${data.name}');
      print('Team Email: ${data.team?.email}');
      print('CRM Category: ${data.team?.crmCategory}');
      if (data.members.isNotEmpty) {
        print('First Member Sale Target: ${data.members[0].saleTarget}');
      }
      print('-------------------');
    }
  }

  // Method to check if we should load more data
  bool shouldLoadMore(ScrollController scrollController) {
    return scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200 && // 200px before end
        !loading.value &&
        hasMoreData.value;
  }

  // Clean up method
  @override
  void onClose() {
    // Clean up any controllers or streams if needed
    super.onClose();
  }
}