import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/models/responseModels/leads/createNewLead/divisions/divisions_response_model.dart';
import '../../../../../data/repositories/repositories.dart';

class DivisionsViewModel extends GetxController {
  final Repositories _api = Repositories();
  RxBool isLoading = false.obs; // This should be defined
  RxString errorMessage = ''.obs;
  RxList<DivisionsResponseModel> divisionsList = <DivisionsResponseModel>[].obs;
  RxList<String> selectedDivisions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDivisions(); // Fetch divisions on initialization
  }

  Future<void> fetchDivisions() async {
    isLoading.value = true; // Set loading to true when fetching
    errorMessage.value = ''; // Clear previous error message

    try {
      final List<DivisionsResponseModel> response = await _api.createNewLeadDivisionsApi();
      divisionsList.assignAll(response); // Use assignAll to update the observable list
    } catch (e) {
      errorMessage.value = 'Error fetching divisions: $e';
    } finally {
      isLoading.value = false; // Ensure loading is set to false in both success and failure
    }
  }

  void updateSelectedDivisions(List<String> divisions) {
    selectedDivisions.assignAll(divisions); // Use assignAll for observable lists
  }
}