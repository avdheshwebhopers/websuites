
// order_activity_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/views/orderScreen/orderActivityScreen/widgets/orderActivityCard/order_activity_card.dart';
<<<<<<< HEAD
import '../../../Responsive/Custom_Drawer.dart';
import '../../../data/models/requestModels/order/activities/OrderActivitiesRequestModel.dart';
=======

import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
>>>>>>> origin/main
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/responsive/bodies/Responsive.dart';
<<<<<<< HEAD
import '../../../viewModels/order/activities/OrderActivitiesViewModel.dart';
=======
import '../../../viewModels/saveToken/save_token.dart';

>>>>>>> origin/main

class OrderActivityScreen extends StatefulWidget {
  const OrderActivityScreen({super.key});

  @override
  State<OrderActivityScreen> createState() => _OrderActivityScreenState();
}

class _OrderActivityScreenState extends State<OrderActivityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late OrderActivityController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(OrderActivityController());
    _loadInitialData();
  }

  void _loadInitialData() {
    final requestModel = OrderActivitiesRequestModel(
      dateRange: DateRange(
        from: "2024-11-01 00:00:00.000",
        to: "2024-11-30 23:59:59.999",
      ),
      division: null,
      userId: null,
      isFilterUserWithTeam: true,
      products: [],
      limit: 15,
      page: 1,
    );
    controller.fetchOrderActivities(requestModel);
  }

  @override
  Widget build(BuildContext context) {
    String _formatDate(String? date) {
      if (date == null || date.isEmpty) {
        return 'N/A';
      }
      try {
        final parsedDate = DateTime.parse(date);
        return DateFormat('MMMM d, y, hh:mm a').format(parsedDate);
      } catch (e) {
        return 'Invalid date';
      }
    }

    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      key: _scaffoldKey,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.errorMessage.value,
                  style: TextStyle(color: Colors.red[900]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadInitialData,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.orderActivities.isEmpty) {
          return Center(
            child: Text(
              "No order activities available",
              style: TextStyle(color: AllColors.mediumPurple, fontSize: 16),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchOrderActivities(
            OrderActivitiesRequestModel(
              dateRange: DateRange(
                from: "2024-11-01 00:00:00.000",
                to: "2024-11-30 23:59:59.999",
              ),
              isFilterUserWithTeam: true,
              limit: 15,
              page: 1,
            ),
          ),
          child:
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            itemCount: controller.orderActivities.length,
            itemBuilder: (context, index) {
              final product = controller.orderActivities[index];
              return OrderActivityScreenCard(
                title: product.productName ?? 'N/A',
                price: '₹ ${product.productSalePrice?.toString() ?? 'N/A'}',
                service: product.productProductType ?? 'N/A',
                date: _formatDate(product.productCreatedAt),
                count: 'Count -${product.orderCount ?? '0'}',
              );
            },
          ),
        );
      }),
    );
  }
}