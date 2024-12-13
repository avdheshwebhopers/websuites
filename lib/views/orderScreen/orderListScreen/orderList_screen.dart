import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/viewModels/order/list/order_list_viewModel.dart';
import 'package:websuites/views/orderScreen/orderListScreen/widgets/OrderListScreenCard/OrderListScreenCard.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final OrderListViewModel viewModel = Get.put(OrderListViewModel());
    final OrderListScreenCardController controller = Get.put(OrderListScreenCardController());


    // Fetch order list on screen load
    viewModel.orderList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(() => ListView.builder(
          itemCount: viewModel.orders.length,
          itemBuilder: (context, index) {
            final order = viewModel.orders[index];

            return OrderListScreenCard(
              title: order.customer?.firstName ?? 'N/A',
              name: order.createdBy?.firstName ?? 'Unknown',
              service: 'N/A',
              createdBy: order.createdBy?.lastName ?? 'Unknown',
              orderId: order.orderNumber?.toString() ?? 'Unknown',
              paidAmount: '₹${order.totalAmount?.toString() ?? '0'}',
              orderDate: order.createdAt != null
                  ? '${order.createdAt!.toLocal()}'.split(' ')[0]
                  : 'Unknown',
              status: order.status ?? 'Pending',
              finalPrice: '₹${order.totalAmount?.toString() ?? '0'}',
              pendingAmount: '',
              controller: controller,
            );
          },
        )),
      ),
    );
  }
}