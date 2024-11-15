import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';  // Import the intl package
import '../../../../utils/appColors/app_colors.dart';
import '../../../viewModels/order/order_master/order_master_viewModel.dart';
import 'Widget/OrderMasterScreenCard.dart';

class OrderMasterListScreen extends StatefulWidget {
  const OrderMasterListScreen({super.key});

  @override
  State<OrderMasterListScreen> createState() => _OrderMasterListScreenState();
}

class _OrderMasterListScreenState extends State<OrderMasterListScreen> {
  final OrderMasterViewModel viewModel = Get.put(OrderMasterViewModel());

  @override
  void initState() {
    super.initState();
    viewModel.fetchOrderMaster(context); // Fetch data on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          if (viewModel.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final orderData = viewModel.orderMasterData.value;

          if (orderData.isEmpty) {
            return const Center(child: Text("No order data available"));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Order Status label only once at the top
              const Text(
                'Order Status',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15), // Space between label and list

              // Display the list of OrderMaster items
              Expanded(
                child: ListView.builder(
                  itemCount: orderData.length,
                  itemBuilder: (context, index) {
                    final order = orderData[index];

                    // Format the date using intl package
                    final formattedDate = DateFormat('dd/MM/yyyy hh:mm a').format(
                      DateTime.parse(order.createdAt),
                    );

                    // Return a container with the card and space between them
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),  // Add space between containers
                      child: OrderMasterListScreenCard(
                        dateTimeText: formattedDate,  // Pass formatted date
                        orderStatusTitle: order.name, // Use dynamic data
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
