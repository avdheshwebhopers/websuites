

// Then modify your CustomerOrderProductsScreen to include navigation
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/views/customerScreens/orderProducts/widgets/orderProductsCard/order_product_screen_card.dart';

import '../../../data/models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../viewModels/customerScreens/orderProducts/order_products_viewModel.dart';
import 'detailview/DetailViewScreen.dart';
// Import the new screen


class CustomerOrderProductsScreen extends StatefulWidget {
  const CustomerOrderProductsScreen({Key? key}) : super(key: key);

  @override
  State<CustomerOrderProductsScreen> createState() => _CustomerOrderProductsScreenState();
}

class _CustomerOrderProductsScreenState extends State<CustomerOrderProductsScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final CustomerOrderProductsListViewModel _viewModel = Get.put(CustomerOrderProductsListViewModel());

  @override
  void initState() {
    super.initState();
    _fetchCustomerOrderProducts();
  }

  Future<void> _fetchCustomerOrderProducts() async {
    await _viewModel.customerOrderProducts(context);
  }

  String formatDate(DateTime date) {
    DateFormat dateFormat = DateFormat('E, d MMM yyyy');
    return dateFormat.format(date);
  }

  String getServiceDateRange(List<Services>? services) {
    if (services == null || services.isEmpty) return 'Not Available';
    final startDate = services.first.startDate;
    final endDate = services.first.endDate;

    if (startDate != null && endDate != null) {
      return '${formatDate(DateTime.parse(startDate))} TO ${formatDate(DateTime.parse(endDate))}';
    } else {
      return 'Invalid Service Dates';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _fetchCustomerOrderProducts,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  children: [
                    Obx(() {
                      if (_viewModel.loading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (_viewModel.items.isEmpty) {
                        return Center(child: Text('No order products found.'));
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _viewModel.items.length,
                          itemBuilder: (context, index) {
                            final item = _viewModel.items[index];
                            return GestureDetector(
                              onTap: () {
                                // Using GetX navigation
                                Get.to(() => const CustomerOrderDetailView());

                                // Alternative using standard Navigator
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => const HelloScreen()),
                                // );
                              },
                              child: CustomerOrderProductScreenCard(
                                title: item.order?.company?.companyName ?? 'Unknown',
                                product: item.product?.name ?? 'N/A',
                                servicesDate: getServiceDateRange(item.services),
                                productCategory: item.product?.productCategory?.name ?? 'Unknown',
                                info: item.gstInfo ?? 'No GST Info',
                                orderDate: formatDate(DateTime.parse(item.createdAt!)),
                                orderby: '${item.order?.createdBy?.firstName ?? 'Unknown'} ${item.order?.createdBy?.lastName ?? ''}',
                                services: item.services,
                              ),
                            );
                          },
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






