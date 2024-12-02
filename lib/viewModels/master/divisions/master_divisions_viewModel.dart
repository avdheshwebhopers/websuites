import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';


class MasterDivisionsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;


  RxList<MasterDivisionsResponseModel> divisions = <MasterDivisionsResponseModel>[].obs;

  Future<void> masterDivisions(BuildContext context) async {
    loading.value = true;
    try {
      List<MasterDivisionsResponseModel> value = await _api.masterDivision();
      if (value.isNotEmpty) {
        divisions.value = value; // Assign the fetched divisions to the list
        print("Master divisions fetched");
        // Utils.snackbarSuccess('Master divisions fetched');
      } else {
        print("Master divisions not fetched");
        // Utils.snackbarFailed('Master divisions not fetched');
      }
    } catch (e) {
      // Utils.snackbarFailed('Error fetching master divisions');

      print("Error: $e");
    } finally {
      loading.value = false;
    }
  }
}

