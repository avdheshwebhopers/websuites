import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/views/customerScreens/customerServices/widgets/ServicesCard/services_card.dart';
import '../../../viewModels/customerScreens/services/customer_service_viewModel.dart';

class CustomerServicesScreen extends StatefulWidget {
  const CustomerServicesScreen({super.key});

  @override
  State<CustomerServicesScreen> createState() => _CustomerServicesScreenState();
}

class _CustomerServicesScreenState extends State<CustomerServicesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CustomerServiceViewModel _viewModel = Get.put(CustomerServiceViewModel());

  @override
  void initState() {
    super.initState();
    _viewModel.customerServicesList(context);  // Pass context to handle errors
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'N/A'; // Handle null case
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            if (_viewModel.loading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (_viewModel.response.value != null && _viewModel.response.value!.items != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Column(
                    children: _viewModel.response.value!.items!
                        .map((item) => AllServicesScreenCard(
                      title: item.orderProduct?.product?.name ?? 'N/A',
                      subtitle: item.orderProduct?.order?.customer?.organization?? 'N/A',
                      paymentMode: item.orderProduct?.paymentMode ?? 'N/A',
                      email: 'eventpharma@gmail.com',
                      orderNumber: item.orderProduct?.order?.orderNumber != null
                          ? '#${item.orderProduct!.order!.orderNumber}'
                          : 'N/A',
                      date: '${formatDate(item.startDate)} TO ${formatDate(item.endDate)}',

                      status: item.status == true ? 'Currently Running' : 'Completed',
                      price: '₹ ${item.orderProduct?.total ?? 0}',
                    ))
                        .toList(),
                  ),
                ),
              );
            } else {
              return Center(child: Text('No customer services found'));
            }
          }),
        ],
      ),
    );
  }
}