import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../data/models/requestModels/customer/customer_payment_reminder/customer_payment_reminder_list.dart';
import '../../../data/models/responseModels/customers/activities/activities_list/activities_list.dart' hide Item; // Hiding Item
import '../../../data/models/responseModels/customers/list/customers_list_response_model.dart'; // This will keep Item
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/customers/payment_reminder/customer_payment_reminder_response_model.dart';

class CustomerPaymentReminderListViewModel extends GetxController {
  final _api = Repositories();

  // Observables
  var loading = false.obs;
  var paymentReminders = <PaymentReminderItem>[].obs; // Correct type

  Future<void> customerPaymentReminder() async {
    loading.value = true;

    CustomerPaymentRequestModel customerPaymentRequestModel = CustomerPaymentRequestModel(
      customer: null,
      dateRange: null,
      dateRangeTo: "reminder_date",
      division: null,
      limit: 15,
      page: 1,
      reminderTo: null,
      reminderType: null,
      rowsPerPage: 15,
      status: null,
    );

    try {
      final response = await _api.customerPaymentReminderList(customerPaymentRequestModel.toJson());

      if (response.items.isNotEmpty) {
        paymentReminders.assignAll(response.items);  // Directly assigning PaymentReminderItem list
        Utils.snackbarSuccess('Customer list fetched successfully');
      } else {
        Utils.snackbarFailed('Customer Payment not fetched');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackbarFailed('An error occurred while fetching data.');
    } finally {
      loading.value = false;
    }
  }

}