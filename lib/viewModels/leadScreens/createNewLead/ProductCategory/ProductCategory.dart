import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../data/models/responseModels/leads/createNewLead/product_category/product_category.dart';

class ProductCategoryController extends GetxController {
  final Repositories repository = Repositories();

  // Observable list to store the fetched data
  final RxList<LeadProductCategoryList> leadProductCategories = <LeadProductCategoryList>[].obs;
  final RxString errorMessage = ''.obs; // For error messages
  final RxBool isLoading = false.obs; // To track loading state
  final RxList<String> selectedCategories = <String>[].obs; // To store selected categories

  // Method to fetch the data
  Future<void> fetchLeadProductCategories(BuildContext context) async {
    try {
      isLoading.value = true; // Start loading
      // Fetch categories from the repository
      List<LeadProductCategoryList> categories = await repository.createLeadProductCategory();
      print("Product data: $categories");

      // Sort the categories alphabetically by the desired field (e.g., name)
      categories.sort((a, b) => a.name.compareTo(b.name)); // Ensure 'name' exists in your model

      leadProductCategories.assignAll(categories); // Update the observable list
      errorMessage.value = ''; // Clear any previous error messages
    } catch (e) {
      // Handle error, possibly display an error message to the user
      errorMessage.value = 'Error fetching lead product categories: $e'; // Set error message
      print("Error fetching lead product categories: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  void updateSelectedCategories(List<String> selectedCategories) {
    this.selectedCategories.assignAll(selectedCategories); // Use assignAll for better performance
  }
}