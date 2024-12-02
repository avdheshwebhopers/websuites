// order_activity_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/data/network/network_api_services.dart';
import '../../../data/models/requestModels/order/activities/OrderActivitiesRequestModel.dart';
import '../../../data/models/responseModels/order/activities/OrderActivitiesResponseModel.dart';
import '../../../resources/appUrls/app_urls.dart';

class OrderActivityController extends GetxController {
  final NetworkApiServices _apiService = NetworkApiServices();

  // Observables for state management
  final RxBool isLoading = false.obs;
  final RxList<Products> orderActivities = <Products>[].obs;
  final Rx<Meta?> meta = Rx<Meta?>(null);
  final RxString errorMessage = ''.obs;

  // Fetch order activities from the API
  Future<void> fetchOrderActivities(OrderActivitiesRequestModel requestModel) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiService.postApiResponse(
        AppUrls.orderActivities,
        requestModel.toJson(),
      );

      final responseModel = OrderActivitiesResponseModel.fromJson(response);
      orderActivities.value = responseModel.products ?? [];
      meta.value = responseModel.meta;
    } catch (error) {
      errorMessage.value = 'Failed to fetch order activities: $error';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
      );
    } finally {
      isLoading.value = false;
    }
  }
}
