import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/viewModels/order/list/order_list_viewModel.dart';
import 'package:websuites/views/orderScreen/orderListScreen/widgets/OrderListScreenCard/OrderListScreenCard.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderListScreenCardController controller = Get.put(OrderListScreenCardController());
    // Initialize ViewModel and register it with GetX
    final OrderListViewModel viewModel = Get.put(OrderListViewModel());

    // Register the OrderListScreenCardController
    Get.put(OrderListScreenCardController()); // Registering the controller

    // Fetch order list on screen load
    viewModel.orderList();

    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              final order = viewModel.orders[index];

              return OrderListScreenCard(
                title: order.customer?.firstName ?? 'N/A',
                name: order.createdBy?.firstName ?? 'Unknown',
                service: 'N/A', // You can replace this with actual service data if available
                createdBy: order.createdBy?.lastName ?? 'Unknown',
                // price: '₹${order.amount?.toString() ?? '0'}', // Ensure amount is converted to string
                orderId: order.orderNumber?.toString() ?? 'Unknown',
                paidAmount: '₹${order.totalAmount?.toString() ?? '0'}', // Ensure totalAmount is converted to string
                orderDate: order.createdAt != null
                    ? '${order.createdAt!.toLocal()}'.split(' ')[0]
                    : 'Unknown',
                status: order.status ?? 'Pending',
                finalPrice: '₹${order.totalAmount?.toString() ?? '0'}', pendingAmount: '', controller: controller, // Ensure totalAmount is converted to string
              );
            },
          ),
        ),

      );
  }
}