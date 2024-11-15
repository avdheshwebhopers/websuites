import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Responsive/Custom_Drawer.dart';

import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/responsive/bodies/responsive scaffold.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../customerScreens/companiesScreen/widgets/companiesCard/companies_screen_card.dart';

class CustomerCompaniesScreen extends StatefulWidget {
  const CustomerCompaniesScreen({Key? key}) : super(key: key);

  @override
  State<CustomerCompaniesScreen> createState() => _CustomerCompaniesScreenState();
}

class _CustomerCompaniesScreenState extends State<CustomerCompaniesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ScreenController _screenController = Get.put(ScreenController());
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? firstName = response.user?.first_name;
      String? email = response.user?.email;

      setState(() {
        userEmail = email ?? 'No email';
        userName = firstName ?? 'No name';
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // scaffoldKey: _globalKey,
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 135),
                  CustomerCompaniesScreenCard(title: 'Eras International'),
                  // Add additional cards as needed
                ],
              ),
            ),
          ),
          // Custom App Bar
          CustomAppBar(
            child: Row(
              children: [
                if (screenWidth < 500)
                  InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_sharp,
                      size: 25,
                    ),
                  ),
                const SizedBox(width: 10),
                Text(
                  'All Companies',
                  style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.filter_list_outlined,
                  size: 15,
                  color: AllColors.lightGrey,
                ),
                const SizedBox(width: 5),
                Text(
                  'Filter',
                  style: TextStyle(
                    color: AllColors.lightGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
