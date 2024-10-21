import 'package:get/get.dart';
import 'package:websuites/data/models/responseModels/leads/createNewLead/pincode/pincode.dart';
import 'package:websuites/data/repositories/repositories.dart';

class PinCodeViewModel extends GetxController {
  var repository = Repositories();
  RxBool isLoading = false.obs;
  RxList<PinCodeModelResponseModel> pincodeList = <PinCodeModelResponseModel>[].obs;
  RxString errorMessage = ''.obs;
  var filteredPincodeList = <PinCodeModelResponseModel>[].obs; // List to display matching pincodes
  RxString matchingCity = ''.obs; // The city name or related information for the pincode
  RxString matchingState = ''.obs; // To store state name
  RxString matchingDistrict = ''.obs; // To store district name

  // Fetch pincode data based on search query from API
  Future<void> searchPincode(String query) async {
    if (query.length < 3) {
      errorMessage.value = 'Please enter at least 3 characters';
      filteredPincodeList.clear();
      return;
    } else {
      // Clear the error message if query length is 3 or more
      errorMessage.value = '';
    }
    try {
      isLoading.value = true; // Start loading
      // Call the API with the query parameter
      List<PinCodeModelResponseModel> response = await repository.createLeadPinCode(query);
      pincodeList.value = response; // Set the data from API
      if (response.isNotEmpty) {
        filteredPincodeList.value = response; // Update filtered list with response
        var firstMatch = filteredPincodeList.first; // Take first matching pincode
        // Safely extract district and state names
        matchingCity.value = firstMatch.district?.name ?? "No Value";
        matchingState.value = firstMatch.district?.state?.name ?? "No Value";
        matchingDistrict.value = firstMatch.district?.name ?? "No Value";
      } else {
        // Reset values if no matching pincode found
        matchingCity.value = "No matching city found";
        matchingState.value = "";
        matchingDistrict.value = "";
      }
    } catch (e) {
      print("Error searching pin code: $e");
      errorMessage.value = "Error fetching pincode details.";
    } finally {
      isLoading.value = false; // Stop loading
      print("Filtered pincode list: ${filteredPincodeList.value}");
      print("Matching city: ${matchingCity.value}");
      print("Matching state: ${matchingState.value}");
      print("Matching district: ${matchingDistrict.value}");
    }
  }
}


