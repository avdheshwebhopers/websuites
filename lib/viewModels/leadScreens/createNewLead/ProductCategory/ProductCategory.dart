import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/models/responseModels/leads/createNewLead/productCategoryList.dart';
import '../../../../data/repositories/repositories.dart';

class ProductCategoryController extends GetxController {
  // Observable list to store the fetched data
  var repository = Repositories();
  RxList<LeadProductCategoryList> leadProductCategories = <LeadProductCategoryList>[].obs;
  var errorMessage = ''.obs;
  // To track loading state
  var isLoading = false.obs;
  RxList<String> selectedCategories = RxList<String>();

  // Method to fetch the data
  Future<void> fetchLeadProductCategories(BuildContext context) async {
    try {
      isLoading(true); // Start loading
      List<LeadProductCategoryList> categories = await repository.createLeadProductCategory();
      print("Product data $categories");
      leadProductCategories.value = categories; // Update the observable list
    } catch (e) {
      // Handle error,possibly display an error message to the use
      print("Error fetching lead product categories: $e");
    } finally {
      isLoading(false); //Stop loading
    }
  }

  void updateSelectedCategories(List<String> selectedCategories) {
    this.selectedCategories.value = selectedCategories;
  }
}
