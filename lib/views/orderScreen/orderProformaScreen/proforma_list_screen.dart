import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/orderScreen/orderProformaScreen/widgets/orderProformaListCard/order_proforma_list_card.dart';

import '../../../viewModels/order/proformaList/order_proforma_list_viewModel.dart';



class OrderProformaList extends StatefulWidget {
  const OrderProformaList({super.key});

  @override
  State<OrderProformaList> createState() => _OrderProformaListState();
}

class _OrderProformaListState extends State<OrderProformaList> {
  final OrderProformaListViewModel _viewModel = Get.put(OrderProformaListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(
            () {
          if (_viewModel.loading.value) {
            // Show a loader while data is being fetched
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_viewModel.orderList.isEmpty) {
            // Show a message if no data is available
            return const Center(
              child: Text(
                'No Orders Available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          } else {
            // Display the list of order cards
            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _viewModel.orderList.length,
              itemBuilder: (context, index) {
                final order = _viewModel.orderList[index];
                return OrderProformaListCard(
                  title: order.name ?? 'N/A',
                  customer:  'N/A',
                  performaNumber: '#${order.performaNumber ?? ''}',
                  email: order.email ?? 'N/A',
                  date:  'N/A',
                  createdBy: '${order.createdBy?.firstName ?? ''} ${order.createdBy?.lastName ?? ''}',
                );
              },
            );
          }
        },
      ),
    );
  }
}
