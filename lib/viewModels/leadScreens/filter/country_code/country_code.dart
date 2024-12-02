import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../data/models/responseModels/leads/Leadlist/filter/country_code/country_code.dart';
class LeadListCountryCodeViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;

  // This will hold the fetched countries
  var countriesWithPhoneCode = <CountriesWithPhoneCode>[].obs;

  Future<void> countryCodeApi(BuildContext context) async {
    loading.value = true; // Start loading
    try {
      final response = await _api.countryCodeApi();
      if (response.countriesWithPhoneCode != null &&
          response.countriesWithPhoneCode!.isNotEmpty) {
        countriesWithPhoneCode.assignAll(response.countriesWithPhoneCode!);
        // Utils.snackbarSuccess('Lead list Country code fetched successfully');
      } else {
        // Utils.snackbarFailed('No leads found');
      }
    } catch (error) {
      // Utils.snackbarFailed('Failed to fetch leads');

      print('Error: $error');
    } finally {
      loading.value = false; // Stop loading
    }
  }
}