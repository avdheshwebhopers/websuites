import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/salesTargetScreen/widgets/sales_target_card.dart';
import '../../viewModels/sales/sales_viewModel.dart';
import '../../viewModels/saveToken/save_token.dart';
import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../utils/responsive/bodies/Responsive.dart';

class SalesTargetScreen extends StatefulWidget {
  const SalesTargetScreen({super.key});

  @override
  State<SalesTargetScreen> createState() => _SalesTargetScreenState();
}

class _SalesTargetScreenState extends State<SalesTargetScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ScreenController _screenController = Get.put(ScreenController());
  final SalesViewModel _salesViewModel = Get.put(SalesViewModel()); // Initialize SalesViewModel
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    _salesViewModel.fetchSales(); // Add this line

    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser ();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });

    } catch (e) {
      print('Error fetching userData: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() {
        // Add more detailed logging
        print('Loading: ${_salesViewModel.loading.value}');
        print('Sales Items Length: ${_salesViewModel.salesItems.length}');

        if (_salesViewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_salesViewModel.salesItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No sales data found.'),
                ElevatedButton(
                  onPressed: () => _salesViewModel.fetchSales(),
                  child: Text('Retry Fetch'),
                )
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: _salesViewModel.salesItems.length,
          itemBuilder: (context, index) {
            final item = _salesViewModel.salesItems[index];
            return SalesTargetScreenCard(
              title: item.name ?? 'No Title',
              startDate: item.created_at?.toString() ?? 'No Start Date',
              price: '',
              created_Date:'No Created Date',
              deadline:  'No End Date',
              member: '',
            );
          },
        );
      }),
    );
  }
}