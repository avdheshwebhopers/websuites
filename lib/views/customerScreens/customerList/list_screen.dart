import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
import 'package:websuites/views/customerScreens/customerList/widgets/customerListCard/list_screen_card.dart';
import '../../../Responsive/Custom_Drawer.dart';

import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/responsive/bodies/Responsive.dart';
import '../../../viewModels/saveToken/save_token.dart';


class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScreenController _screenController = Get.put(ScreenController());
  final SaveUserData userPreference = SaveUserData();

  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    fetchUserData();
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // scaffoldKey: _scaffoldKey,
      backgroundColor: AllColors.whiteColor,
      drawer:
      CustomDrawer(
        selectedIndex: 0, // Customize as needed
        onItemSelected: (index) {
          // Handle item selection
        },
        isCollapsed: false,
        onCollapseToggle: () {
          // Handle drawer collapse/expand
        },
        isTabletOrDesktop: screenWidth >= 500,
      ),
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 135),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                  CustomerListScreenCard(title: 'Harish Sharma'),
                ],
              ),
            ),
          ),
          CustomAppBar(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width < 500)
                  InkWell(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: const Icon(Icons.menu_sharp, size: 25),
                  ),
                const SizedBox(width: 10),
                TextStyles.w700_16(
                  color: AllColors.blackColor,
                  context,
                  Strings.customers,
                ),
                const Spacer(),
                _buildIconContainer(
                  context,
                  icon: Icons.upload,
                  sizeFactor: 13,
                ),
                const SizedBox(width: 8),
                _buildAddCustomerButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context,
      {required IconData icon, required double sizeFactor}) {
    return Container(
      height: MediaQuery.of(context).size.height / sizeFactor,
      width: MediaQuery.of(context).size.width / sizeFactor,
      decoration: BoxDecoration(
        color: AllColors.mediumPurple,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, size: 15, color: AllColors.whiteColor),
    );
  }

  Widget _buildAddCustomerButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 30,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        color: AllColors.mediumPurple,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, size: 16, color: AllColors.whiteColor),
          const SizedBox(width: 4),
          TextStyles.w400_12(
            color: AllColors.whiteColor,
            context,
            Strings.customer,
          ),
        ],
      ),
    );
  }
}
