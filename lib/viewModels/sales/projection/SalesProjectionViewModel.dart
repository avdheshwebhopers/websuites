import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/models/requestModels/sales/projection/SalesProjectionsListRequestModel.dart';
import '../../../data/models/responseModels/sales/projection/SalesProjectionsListResponseModel.dart';
import '../../../utils/utils.dart';
import '../../../data/repositories/repositories.dart';

class SalesProjectionViewModel extends GetxController {
  final Repositories repository;

  SalesProjectionViewModel({required this.repository});

  final RxBool isLoading = false.obs;
  final RxList<SalesProjectionsListResponseModel> salesProjections = RxList<SalesProjectionsListResponseModel>();

  Future<void> fetchSalesProjections({
    String? createdBy,
    String? status,
    String? dateRange,
    bool? isOpen,
    String? productCategory,
  }) async {
    try {
      isLoading.value = true;

      final request = SalesProjectionsListRequestModel(
        createdBy: createdBy,
        status: status,
        dateRange: dateRange,
        isOpen: isOpen,
        productCategory: productCategory,
      );

      // Ensure the request is serialized to JSON
      final response = await repository.salesProjectionApi(request.toJson());
      salesProjections.value = response; // Store the entire list

      if (salesProjections.isNotEmpty) {
        // Utils.snackbarSuccess('Sales projections fetched successfully');
      } else {
        // Utils.snackbarFailed('No sales projections available');
      }

    } catch (error) {
      if (kDebugMode) {
        print('SalesProjectionViewModel Error: $error');
      }
      // Utils.snackbarFailed('Failed to fetch sales projections');

    } finally {
      isLoading.value = false;
    }
  }

  void clearProjection() {
    salesProjections.clear(); // Clear the list
  }

  @override
  void onClose() {
    super.onClose();
  }
}