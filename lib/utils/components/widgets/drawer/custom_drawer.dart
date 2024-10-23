import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import 'package:websuites/utils/responsive/bodies/Responsive.dart';
import 'package:websuites/views/customerScreens/orderProducts/order_products_screen.dart';
import '../../../../resources/iconStrings/icon_strings.dart';
import '../../../../resources/imageStrings/image_strings.dart';
import '../../../../viewModels/saveToken/save_token.dart';
import '../../../../views/customerScreens/orderProducts/order_products_screen.dart';
import '../../../appColors/app_colors.dart';
import '../../buttons/common_button.dart';
import 'drawerListTiles/custom_list_tile.dart';
import 'drawerListTiles/expandedListTile.dart';
import 'drawerListTiles/expandedListTile2.dart';


class CustomDrawer extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String version;

  CustomDrawer({
    required this.userName,
    required this.phoneNumber,
    required this.version,
  });

  final _saveUser = SaveUserData();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: AllColors.whiteColor,
        width: Get.width /
            (ResponsiveUtils.isDesktop(context) ? 7 : ResponsiveUtils
                .isTablet(context) ? 4.1 : 1.5),

        height: Get.height * 1,
        child: Drawer(
          backgroundColor: AllColors.whiteColor,
          child:
          ListView(
            children: [
              Container(
                color: AllColors.whiteColor,
                padding: Get.width > 800 ? EdgeInsets.zero : const EdgeInsets.only(left: 10), // Remove padding for desktop
                height: Get.height / 9,
                child: Row(
                  children: [
                    // Image Container
                    Container(
                      height: Get.width > 800 ? Get.height / 15 : Get.height / 12,  // Adjust height based on device size
                      width: Get.width > 800 ? Get.width / 15 : Get.width / 12,    // Adjust width based on device size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AllColors.whiteColor,
                      ),
                      child: Center(
                        child: Image.asset(
                          ImageStrings.splashWHLogo,
                          fit: BoxFit.contain,  // Use BoxFit.contain to prevent image overflow
                        ),
                      ),
                    ),


                    if (Get.width <= 800)
                      SizedBox(width: Get.width / 55),

                    // Expanded widget for user details
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              color: AllColors.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: AllColors.grey,
                            ),
                            maxLines: null,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  CustomListTile(
                    leadIconImage: IconStrings.dashboard,
                    title: 'Dashboard',
                    onTap: () {
                      Get.toNamed(RoutesName.home_screen);
                    },
                  ),
                  CustomExpandedListTile(
                    title: 'Lead',
                    leadingIconImage: IconStrings.lead,
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.createNewLead_screen);
                        },
                        title: Text(
                          '• Create',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.lead_list_screen);
                        },
                        title: Text(
                          '• List',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.LeadActivities_screen);
                        },
                        title: Text(
                          '• Activities',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.my_teamLead_screen);
                        },
                        title: Text(
                          '• Team Leads',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.trashLead_screen);
                        },
                        title: Text(
                          '• Trash',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {

                   Get.toNamed(RoutesName.setting_screen); // Corrected the typo here

                        },
                        title: Text(
                          '• Settings',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
                        ),
                      ),

                      ListTile(
                        onTap: () {
                          Get.toNamed(RoutesName.leadMaster_screen);
                        },
                        title: Text(
                          '• Lead (Master)',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: Text(
                          '• Global Search',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  CustomExpandedListTile(
                      title: 'Customer',
                      leadingIconImage: IconStrings.customer,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.customer_list_screen);
                          },
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.customer_companies_screen);
                          },
                          title: Text(
                            '• Companies',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Activities',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Payment Reminders',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.customer_services_screen);
                          },
                          title: Text(
                            '• Services',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.customer_orderProducts_screen);

                          },
                          title: Text(
                            '• Order Products',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Orderless Services',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {

                            Get.toNamed(RoutesName.customer_myTeam_screen);
                          },
                          title: Text(
                            '• My Team',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Trash',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {

                            Get.toNamed(RoutesName.customer_activation_list);
                          },
                          title: Text(
                            '• Activation List',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Customer (Master)',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Settings',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                      ]),
                  CustomExpandedListTile(
                      title: 'Order',
                      leadingIconImage: IconStrings.orders,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Activity',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Proforma List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Payments',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Projection',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• (Order) Master',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),
                        ),
                      ]),
                  CustomExpandedListTile(
                      title: 'HRM',
                      leadingIconImage: IconStrings.hrm,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            '• Leave',
                            style: TextStyle(

                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: const Text(
                            '• Attendence',
                            style: TextStyle(

                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ]),
                  CustomListTile(
                    leadIconImage: IconStrings.analytics,
                    title: 'Analytics',
                    onTap: () {},
                  ),
                  CustomExpandedListTile(
                    title: 'Campaign',
                    leadingIconImage: IconStrings.campaign,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          '• List',
                          style: TextStyle(

                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          '• Mail Logs',
                          style: TextStyle(

                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          '• WhatsApp Logs',
                          style: TextStyle(

                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomListTile(
                      leadIconImage: IconStrings.customer,
                      title: 'Whatsapp',
                      onTap: () {}),
                  CustomListTile(
                    leadIconImage: IconStrings.sales,
                    title: 'Sales',
                    onTap: () {},
                  ),
                  CustomListTile(
                    leadIconImage: IconStrings.roles,
                    title: 'Roles',
                    onTap: () {},
                  ),
                  // CustomListTile(
                  //   leadIconImage: IconStrings.users,
                  //   title: 'Users' ,
                  //   onTap: () {},
                  // ),
                  CustomExpandedListTile(
                      title: 'Users',
                      leadingIconImage: IconStrings.tasks,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.users_screen);
                          },
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Activities',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),

                      ]),

                  CustomExpandedListTile(
                      title: 'Tasks',
                      leadingIconImage: IconStrings.tasks,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Report',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Master',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ]),
                  CustomExpandedListTile(
                      title: 'Projects',
                      leadingIconImage: IconStrings.projects,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '• Master',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ]),
                  CustomExpandedListTile(
                      title: 'Inventory',
                      leadingIconImage: IconStrings.products,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Stock',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '• Request',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Transactions',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Vendor',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Refill Stock',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ]),
                  CustomListTile(
                    leadIconImage: IconStrings.serviceArea,
                    title: 'Service Area',
                    onTap: () {},
                  ),
                  CustomExpandedListTile(
                      title: 'Products',
                      leadingIconImage: IconStrings.products,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Category',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Brands',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• GST List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Master',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ]),
                  CustomExpandedListTile(
                      title: 'Helpdesk',
                      leadingIconImage: IconStrings.customer,
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• List',
                            style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ]),
                  CustomExpandedListTile(
                      title: 'Master',
                      leadingIconImage: IconStrings.master,
                      children: [

                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.home_screen);

                          },
                          title: Text(
                            '• Dashboard\n  Configuration',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),

                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.master_department); // Navigate to the correct route
                          },
                          title: Text(
                            '• Departments',
                            style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),

                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.master_division); // Navigate to the correct route

                          },
                          title: Text(
                            '• Divisions',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            '• Departments',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.master_proposal);

                          },
                          title: Text(
                            '• Proposals',
                            style: TextStyle(
                                color: AllColors.welcomeColor,

                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        CustomExpandedListTile2(
                            title: 'City, State & Country',
                            children: [
                              ListTile(
                                onTap: () {},
                                title: Text(
                                  '• Cities',
                                  style: TextStyle(
                                      color: AllColors.welcomeColor,

                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                title: Text(
                                  '• States',
                                  style: TextStyle(
                                      color: AllColors.welcomeColor,

                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                title: Text(
                                  '• Countries',
                                  style: TextStyle(
                                      color: AllColors.welcomeColor,

                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ]),
                        CustomExpandedListTile2(
                            title: 'Customize Labels',
                            children: [
                              ListTile(
                                onTap: () {

                                  Get.toNamed(RoutesName.master_customize_label);
                                },
                                title: Text(
                                  '• Customize',
                                  style: TextStyle(
                                      color: AllColors.welcomeColor,

                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ]),
                      ]),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                height: Get.height / 20,
                width: Get.width / 2,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  version,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,

                    fontSize: 10,
                    color: AllColors.grey,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: CommonButton(
                  height: Get.height / 30,
                  width: Get.width / 4,
                  title: 'Logout',
                  onPress: () {
                    _saveUser.removeUser();
                    Get.offNamed('/login_screen');
                    Get.snackbar('Logout', 'Logout Successful');
                  },
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      );
  }
}








