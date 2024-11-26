import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:websuites/views/customerScreens/activitiesScreen/activities_screen.dart';
import 'package:websuites/views/customerScreens/customerPaymentReminder/payment_reminder.dart';
import 'package:websuites/views/customerScreens/orderProducts/order_products_screen.dart';
import 'package:websuites/views/homeScreen/widgets/apppbarFilterIcon/FilterActionButton.dart';
import 'package:websuites/views/leadScreens/trashLead/widgets/filter/TrashFilter.dart';
import 'package:websuites/views/orderScreen/orderActivityScreen/order_activity_screen.dart';
import 'package:websuites/views/orderScreen/orderProformaScreen/proforma_list_screen.dart';
import 'package:websuites/views/orderScreen/ordermaster/OrderMasterListScreen.dart';
=======
import 'package:websuites/views/homeScreen/widgets/apppbarFilterIcon/FilterActionButton.dart';
import 'package:websuites/views/leadScreens/trashLead/widgets/filter/TrashFilter.dart';
>>>>>>> origin/main

import '../../Responsive/Custom_Drawer.dart';
import '../../resources/strings/strings.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/responsive/bodies/responsive scaffold.dart';
import '../Dashboard/DashboardScreen.dart';
import '../customerScreens/companiesScreen/all_companies_screen.dart';
import '../customerScreens/customerList/list_screen.dart';
<<<<<<< HEAD
import '../customerScreens/customerServices/services_screen.dart';
=======
>>>>>>> origin/main
import '../leadScreens/Setting/SettingScreen.dart';
import '../leadScreens/createNewLead/create_newLead_screen.dart';
import '../leadScreens/leadActivities/lead_activities_screen.dart';
import '../leadScreens/leadList/leadlist_screen.dart';
import '../leadScreens/leadMaster/lead_master_screen.dart';
import '../leadScreens/searchGoogleLeads/search_google_leads.dart';
import '../leadScreens/trashLead/trash_lead_screen.dart';
import '../orderScreen/orderListScreen/orderList_screen.dart';
import '../salesTargetScreen/sales_target_screen.dart';

class HomeScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isCollapsed = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> screens = [
    Dashboardscreen(),
    CreateNewLeadScreen(),
    SearchGoogleLeads(),
    LeadListScreen(),
    TrashLeadScreen(),
    LeadActivitiesScreen(),
    SettingScreen(),
    LeadMasterScreen(),
    CustomersListScreen(),
    CustomersActivitiesScreen(),
    CustomerPaymentReminders(),
    CustomerCompaniesScreen(),
    CustomerServicesScreen(),
    CustomerOrderProductsScreen(),
    OrderListScreen(),
    OrderActivityScreen(),
    OrderProformaList(),
    OrderMasterListScreen(),
    SalesTargetScreen()


  ];

  void onDrawerItemTapped(int index, BuildContext context) {
    selectedIndex.value = index;
    if (MediaQuery.of(context).size.width < 500) {
      Navigator.pop(context);
    }
  }

  void toggleDrawerCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }

  String getAppBarTitle() {
    switch (selectedIndex.value) {
      case 1:
        return Strings.createNewLead;
      case 2:
        return Strings.searchGoogleLeads;
      case 3:
        return Strings.leadList;
      case 4:
        return Strings.leadTrash;
      case 5:
        return Strings.leadActivities;
      case 6:
        return Strings.leadList;
      case 7:
        return Strings.setting;
      case 8:
<<<<<<< HEAD
        return Strings.customers;
      case 9:
        return Strings.customerActivity;
      case 10:
        return 'Payment Reminder';
      case 11:
=======
        return Strings.leadMaster;
      case 9:
        return Strings.master;
      case 10:
>>>>>>> origin/main
        return 'Customer Companies';
      case 12:
        return 'All Services';
      case 13:
        return 'Order Products';
      case 14:
        return 'Order List';
      case 15:
        return 'Activity';
      case 13:
        return 'Proforma List';
      case 14:
        return 'Order Master';
      case 15:
        return 'Sales';


      default:
        return 'Hello, Avdhesh!';
    }
  }

  bool shouldShowFilterActionButton() {
    return selectedIndex.value == 3;
  }
}

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    final isTabletOrDesktop = MediaQuery.of(context).size.width >= 500;

    return ResponsiveScaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      scaffoldKey: controller.scaffoldKey,
      appBar: !isTabletOrDesktop
          ? AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: [
            Obx(() => Text(
              controller.getAppBarTitle(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )),
          ],
        ),
        actions: [
          Obx(() => Visibility(
            visible: controller.selectedIndex.value == 3 ||

                controller.selectedIndex.value == 5 ||
                controller.selectedIndex.value == 6 ||
                controller.selectedIndex.value == 7 ||
                controller.selectedIndex.value == 8,
            child: const FilterActionButtons(),
          )),
          Obx(() => Visibility(
            visible: controller.selectedIndex.value == 4,
            child:TrashFilter()



          )
          ),
        ],

      )
          : null,
      drawer: !isTabletOrDesktop
          ? Drawer(
        child: Obx(() => CustomDrawer(
          selectedIndex: controller.selectedIndex.value,
          onItemSelected: (index) => controller.onDrawerItemTapped(index, context),
          isCollapsed: controller.isCollapsed.value,
          onCollapseToggle: controller.toggleDrawerCollapse,
          isTabletOrDesktop: isTabletOrDesktop,
        )),
      )
          : null,
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            if (isTabletOrDesktop)
              Obx(() => CustomDrawer(
                selectedIndex: controller.selectedIndex.value,
                onItemSelected: (index) => controller.onDrawerItemTapped(index, context),
                isCollapsed: controller.isCollapsed.value,
                onCollapseToggle: controller.toggleDrawerCollapse,
                isTabletOrDesktop: isTabletOrDesktop,
              )),
            Expanded(
              child: Column(
                children: [
                  if (isTabletOrDesktop)
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.only(top: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Visibility(
                                  visible: Get.width >= 500 && controller.selectedIndex.value != 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                                    onPressed: () => controller.selectedIndex.value = 0,
                                  ),
                                )),
                                Expanded(
                                  child: Obx(() => Text(
                                    controller.getAppBarTitle(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  )),
                                ),
                                Obx(() => Visibility(
                                  visible: controller.selectedIndex.value == 3 ||

                                      controller.selectedIndex.value == 5 ||
                                      controller.selectedIndex.value == 6 ||
                                      controller.selectedIndex.value == 7 ||
                                      controller.selectedIndex.value == 8,
                                  child: const FilterActionButtons(),
                                )),
                                Obx(() => Visibility(
                                  visible: controller.selectedIndex.value == 4,
                                  child: TrashFilter()



                                )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[100],
                      child: Obx(() => IndexedStack(
                        index: controller.selectedIndex.value,
                        children: controller.screens,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
