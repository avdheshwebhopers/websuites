import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/leads/createNewLead/divisions/divisions_response_model.dart';
import '../../../../data/repositories/repositories.dart';

class DivisionsViewModel extends GetxController {
  final _api = Repositories();
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxList<DivisionsResponseModel> divisionsList = RxList<DivisionsResponseModel>();
  RxList<String> selectedDivisions = <String>[].obs;

  Future<void> createNewLeadDivisions(BuildContext context) async {
    isLoading.value = true;

    try {
      final response = await _api.createNewLeadDivisionsApi();
      divisionsList.value = response;
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Error fetching divisions: $e';
      isLoading.value = false;
    }
  }

  void updateSelectedDivisions(List<String> divisions) {
    selectedDivisions.value = divisions;
  }
}