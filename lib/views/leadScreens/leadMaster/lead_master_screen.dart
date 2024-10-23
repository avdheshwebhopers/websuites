import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/leadScreens/leadMaster/widgets/leadMasterCard/lead_master_card.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../../utils/responsive/bodies/responsive scaffold.dart';
import '../../../viewModels/saveToken/save_token.dart';

class LeadMasterController extends GetxController {
  final SaveUserData userPreference = SaveUserData();
  var userName = ''.obs;
  var userEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      userName.value = response.user?.first_name ?? '';
      userEmail.value = response.user?.email ?? '';
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }
}

class LeadMasterScreen extends StatelessWidget {
  LeadMasterScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final LeadMasterController controller = Get.put(LeadMasterController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isTabletOrDesktop = screenWidth >= 500;

    return ResponsiveScaffold(
      scaffoldKey: _globalKey,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // backgroundColor: AllColors.whiteColor,
      drawer: Obx(
            () => CustomDrawer(
          userName: controller.userName.value,
          phoneNumber: controller.userEmail.value,
          version: '1.0.12',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTabletOrDesktop ? screenWidth * 0.03 : 15,
                vertical: isTabletOrDesktop ? screenHeight * 0.03 : screenHeight * 0.15, // Adjust vertical padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * (isTabletOrDesktop ? 0.05 : 0.03)), // Additional height for tablet/desktop
                  _buildFilterRow(context),
                  SizedBox(height: screenHeight * 0.03),
                  TextStyles.w500_14_Black(context, Strings.availableLeadStatus),
                  SizedBox(height: screenHeight * 0.02),
                  _buildLeadMasterCards(),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
          // Conditionally render AppBar based on screen size
          if (!isTabletOrDesktop)
            CustomAppBar(
              child: _buildAppBar(context, screenHeight),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, backgroundColor:AllColors.mediumPurple,
    );
  }

  Widget _buildFilterRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildFilterButton(context, Strings.types, AllColors.mediumPurple, AllColors.whiteColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildFilterButton(context, Strings.source, AllColors.textField2, AllColors.blackColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildFilterButton(context, Strings.status, AllColors.textField2, AllColors.blackColor),
        ),
      ],
    );
  }

  Widget _buildLeadMasterCards() {
    return Column(
      children: const [
        LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
        LeadMasterScreenCard(title: 'Hot', activity: 'In Progress'),
        LeadMasterScreenCard(title: 'Hot', activity: 'Completed'),
        LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
        LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
        LeadMasterScreenCard(title: 'Cold', activity: 'In Progress'),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, double screenHeight) {
    return Row(
      children: [
        // Show the drawer icon only for mobile screens
        if (MediaQuery.of(context).size.width < 500) // Mobile view
          InkWell(
            onTap: () {
              _globalKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.menu_sharp,
              size: 25,
            ),
          ),
        const SizedBox(width: 12),
        // Always show the title in the AppBar
        TextStyles.w700_17(color: AllColors.blackColor, context, Strings.leadMaster),
        const Spacer(),
        Icon(Icons.search, size: 20, color: AllColors.lightGrey),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: screenHeight / 30,
          decoration: BoxDecoration(
            color: AllColors.mediumPurple,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextStyles.w500_12(color: AllColors.whiteColor, context, Strings.addLeadType),
          ),
        ),
      ],
    );
  }


  Widget _buildFilterButton(BuildContext context, String text, Color bgColor, Color textColor) {
    return Container(
      height: Get.height / 30,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextStyles.w400_15(color: textColor, context, text),
      ),
    );
  }
}
