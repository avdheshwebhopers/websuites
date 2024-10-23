import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/responsive/bodies/responsive scaffold.dart';

import '../../../viewModels/leadScreens/leadMasters/controller.dart';

import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import 'SourceScreen/LeadMasterSourceScreen.dart';
import 'StatusScreen/LeadMasterStatusScreen.dart';
import 'TypeScreen/LeadMasterTypeScreen.dart';

class LeadMasterScreen extends StatelessWidget {
  LeadMasterScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final LeadMasterController controller = Get.put(LeadMasterController());

  Widget _buildTabButton(BuildContext context, String title, String tabName) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == tabName;
      return Expanded(
        child: GestureDetector(
          onTap: () => controller.updateSelectedTab(tabName),
          child: Container(
            height: Get.height / 30,
            decoration: BoxDecoration(
              color: isSelected ? AllColors.mediumPurple : AllColors.textField2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextStyles.w400_15(
                color: isSelected ? AllColors.whiteColor : AllColors.blackColor,
                context,
                title,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildContentSection(BuildContext context, double screenHeight) {
    return Obx(() {
      switch (controller.selectedTab.value) {
        case 'types':
          return const TypesTab(); // Use the TypesTab widget
        case 'source':
          return const SourceTab(); // Use the SourceTab widget
        case 'status':
          return const StatusTab(); // Use the StatusTab widget
        default:
          return SizedBox.shrink();
      }
    });
  }

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
      drawer: Obx(
            () => CustomDrawer(
          userName: controller.userName.value,
          phoneNumber: controller.userEmail.value,
          version: '1.0.12',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: AllColors.whiteColor,

            title: TextStyles.w700_17(color: AllColors.blackColor, context, Strings.leadMaster),
            actions: [
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTabletOrDesktop ? screenWidth * 0.03 : 15,
                vertical: isTabletOrDesktop ? screenHeight * 0.03 : screenHeight * 0.15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * (isTabletOrDesktop ? 0.05 : 0.03)),
                  Row(
                    children: [
                      _buildTabButton(context, Strings.types, 'types'),
                      const SizedBox(width: 10),
                      _buildTabButton(context, Strings.source, 'source'),
                      const SizedBox(width: 10),
                      _buildTabButton(context, Strings.status, 'status'),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _buildContentSection(context, screenHeight),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AllColors.mediumPurple,
    );
  }
}