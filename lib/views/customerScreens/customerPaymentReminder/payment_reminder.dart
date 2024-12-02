import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/responseModels/customers/payment_reminder/customer_payment_reminder_response_model.dart';
import '../../../viewModels/customerScreens/paymentReminder/customer_payment_reminder_viewModel.dart';
import 'customerPaymentReminder/CustomerPaymentReminderCard.dart';

class CustomerPaymentReminders extends StatefulWidget {
  const CustomerPaymentReminders({Key? key}) : super(key: key);

  @override
  _CustomerPaymentRemindersState createState() => _CustomerPaymentRemindersState();
}

class _CustomerPaymentRemindersState extends State<CustomerPaymentReminders> {
  final CustomerPaymentReminderListViewModel _viewModel =
  Get.put(CustomerPaymentReminderListViewModel());

  String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('dd MMM yyyy').format(date);
  }

  String formatCurrency(int? amount) {
    if (amount == null) return '₹0';
    final formatter = NumberFormat.currency(
      symbol: '₹',
      locale: 'en_IN',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  @override
  void initState() {
    super.initState();
    _viewModel.customerPaymentReminder();
  }

  Map<String, String> _buildReminderData(PaymentReminderItem reminder) {
    return {
      'customerName':
      '${reminder.reminderTo?.firstName ?? ''} ${reminder.reminderTo?.lastName ?? ''}'.trim(),
      'product': reminder.product?.name ?? 'N/A',
      'status':reminder.status ?? 'Na',
      'price': formatCurrency(reminder.amount),
      'orderId': reminder.orders?.orderNumber?.toString() ?? 'N/A',
      'reminderTo':
      '${reminder.reminderTo?.firstName ?? ''} ${reminder.reminderTo?.lastName ?? ''}'.trim(),
      'createdBy':
      '${reminder.createdBy?.firstName ?? ''} ${reminder.createdBy?.lastName ?? ''}'.trim(),
      'createdAt': formatDate(reminder.createdAt),
      'reminderAt': formatDate(reminder.reminderDate),
      'cheque': reminder.cheque ?? 'N/A',
      'chequeDate': formatDate(reminder.chequeDate),
      'chequeNumber': reminder.chequeNumber ?? 'N/A',
      'company': reminder.orders?.company?.companyName ?? 'N/A',
      'productCategory': reminder.product?.productCategory?.name ?? 'N/A',
      'brand': reminder.product?.brand?.name ?? 'N/A',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
            () => _viewModel.loading.value
            ? const Center(child: CircularProgressIndicator())
            : _viewModel.paymentReminders.isEmpty
            ? const Center(child: Text('No payment reminders found'))
            : SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: _viewModel.paymentReminders.map((reminder) {
              return CustomerPaymentReminderCard(
                data: _buildReminderData(reminder),
                cardId: reminder.id ?? 'N/A',
                isDetailsVisible: false, // Ensure this is a boolean
                onToggleDetails: () {
                  // Handle toggle details functionality
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}