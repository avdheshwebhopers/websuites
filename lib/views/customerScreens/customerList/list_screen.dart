import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../viewModels/customerScreens/list/customer_list_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../../views/customerScreens/customerList/widgets/customerListCard/list_screen_card.dart';

class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final SaveUserData userPreference = SaveUserData();
  final CustomerListViewModel _customerListViewModel = Get.put(CustomerListViewModel());

  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    _customerListViewModel.fetchLeadList(context); // Fetch lead list on init
  }

  Future<void> fetchUserData() async {
    try {
      final LoginResponseModel response = await userPreference.getUser();
      setState(() {
        userName = response.user?.first_name;
        userEmail = response.user?.email;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_customerListViewModel.loading.value) {
          // Show loading indicator when fetching data
          return const Center(child: CircularProgressIndicator());
        }

        if (_customerListViewModel.customers.isEmpty) {
          // Show message when no customers are found
          return const Center(child: Text('No customers found.'));
        }

        // Main UI with fetched customer data
        return Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child:
                Column(
                  children: _customerListViewModel.customers.map((customer) {
                    return CustomerListScreenCard(
                      name: '${customer.firstName} ${customer.lastName}' ?? 'Not Available' ,
                      email:customer.primaryEmail ?? 'No Email',
                      title: customer.companyName?? 'No Company',
                      mobile: customer.primaryContact ?? 'No Contact',
                      created_by: customer.customerAssignedNames?.isNotEmpty == true
                          ? customer.customerAssignedNames!.first
                          : 'Unknown',

                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
