import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';


class MasterDivisionsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxBool dataLoaded = false.obs; // Flag to track if data has already been fetched
  RxList<MasterDivisionsResponseModel> divisions = <MasterDivisionsResponseModel>[].obs;

  Future<void> masterDivisions(BuildContext context) async {
    // If data is already loaded, don't reload it.
    if (dataLoaded.value) {
      return;
    }

    loading.value = true;
    try {
      List<MasterDivisionsResponseModel> value = await _api.masterDivision();
      if (value.isNotEmpty) {
        divisions.value = value; // Assign the fetched divisions to the list
        dataLoaded.value = true; // Mark data as loaded
        print("Master divisions fetched");
      } else {
        print("Master divisions not fetched");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      loading.value = false;
    }
  }

  Future<void> refreshData(BuildContext context) async {
    // Reset loading and dataLoaded before refreshing
    dataLoaded.value = false;
    divisions.clear();
    await masterDivisions(context);
  }
}


