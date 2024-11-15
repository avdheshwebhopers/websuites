import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/master/departments/master_departments_response_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';



class MasterDepartmentsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<MasterDepartmentsResponseModel> departments = <MasterDepartmentsResponseModel>[].obs; // Declare the list

  Future<void> masterDepartments(BuildContext context) async {
    loading.value = true;
    try {
      final response = await _api.masterDepartment();
      print("Value $response");
      if (response.isNotEmpty) {
        departments.value = response; // Update the departments list
        // Utils.snackbarSuccess('Master divisions fetched');
        print('Master divisions fetched');
      } else {
        // Utils.snackbarFailed('Master divisions not fetched');
        print('Master divisions not fetched');
      }
    } catch (e) {
      // Utils.snackbarFailed('Error fetching master divisions: $e');
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      loading.value = false; // Ensure loading is false regardless of success or failure
    }
  }
}