import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/requestModels/customer/customer_list/customer_list.dart';
import '../../../data/models/requestModels/dashboardScreen/db_transactions.dart';

class Customer {
  final String? firstName;
  final String? lastName;
  final String? primaryEmail;
  final String? primaryContact;
  final String? companyName;
  final List<String>? customerAssignedNames; // Add this field for customer_assigned names.

  Customer({
    required this.firstName,
    required this.lastName,
    required this.primaryEmail,
    required this.primaryContact,
    required this.companyName,
    required this.customerAssignedNames, // Updated here
  });
}

class CustomerListViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Customer> customers = <Customer>[].obs; // Ensure only one RxList<Customer> is declared.

  Future<void> fetchLeadList(BuildContext context) async {
    loading.value = true;
    try {
      // Construct the request model.
      CustomerRequestModel customerRequestModel = CustomerRequestModel(
        assignedRange: null,
        assignedTo: null,
        city: "",
        customFields: {},
        customerAssignedToTeam: false,
        customerType: "",
        division: "",
        limit: 15,
        page: 1,
        paginationType: "old",
        projectStatus: "",
        range: Range(
          from: "2024-09-26 00:00:00.000",
          to: "2024-10-26 23:59:59.999",
        ),
        reminderRange: null,
        reminderType: "",
        search: "",
        serviceStatus: "",
        status: "",
      );

      // Make the API call.
      final response = await _api.customersListApi(customerRequestModel.toJson());

      // Process the response.
      if (response.items != null) {
        customers.value = response.items!
            .map((item) {
          // Extract customerAssigned names.
          final assignedNames = item.customerAssigned.map((assigned) {
            final user = assigned.user;
            return user != null ? "${user.firstName} ${user.lastName}" : "Unknown User";
          }).toList();

          // Return a new Customer object.
          return Customer(
            firstName: item.firstName,
            lastName: item.lastName,
            primaryEmail: item.primaryEmail,
            primaryContact: '+${item.countryCode}-${item.primaryContact}',
            companyName: item.companies.isNotEmpty
                ? item.companies[0].companyName
                : "No Company",
            customerAssignedNames: assignedNames, // Assign the extracted names here.
          );
        }).toList();

        // Success snackbar.
        // Utils.snackbarSuccess('Customer list fetched successfully');
        print('Customer list fetched successfully');

      } else {
        // Failure snackbar.
        // Utils.snackbarFailed('Customer list not fetched');
        print('Customer list not fetched');
      }
    } catch (error) {
      // Handle errors.
      // Utils.snackbarFailed('Error fetching customer list');
      print('Error fetching customer list');
      if (kDebugMode) {
        print("Error fetching customer list: $error");
      }
    } finally {
      // Reset loading.
      loading.value = false;
    }
  }
}
