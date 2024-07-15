import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/components/List_TIles/expandedListTile.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import '../../../View_model/controllers/save_token/save_token.dart';
import '../../Assets/app_Icons.dart';
import '../../Assets/app_fonts.dart';
import '../../Assets/app_images.dart';
import '../List_TIles/custom_list_tile.dart';
import '../app_colors.dart';
import '../App_Buttons/generic_button.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String version;

  AppDrawer({
    required this.userName,
    required this.phoneNumber,
    required this.version,
  });
  final _saveUser = SaveUserData();

  @override
  Widget build(BuildContext context) {
    return

      Container(
        color: AppColors.whiteColor,
        width: Get.width/1.5,
        height: Get.height*1,
        child:
        Drawer(
        backgroundColor: AppColors.whiteColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 13),
              height: Get.height / 9,
              child: Row(
                children: [
                  Container(
                    height: Get.height / 10,
                    width: Get.width / 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                    child: Center(child: Image.asset(AppImages.Splash_WHLogo)),
                  ),
                  SizedBox(width: Get.width / 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'NunitoRegular',
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          fontFamily: 'NunitoRegular',
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomListTile(
                  leadIconImage: AppIcons.dashboard,
                  title: 'Dashboard',
                  onTap: () {
                    Get.toNamed(RoutesName.main_page_screen);
                  },
                ),
                CustomExpandedListTile(
                  title: 'Lead',
                  leadingIconImage: AppIcons.lead,
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(RoutesName.createNewLead_screen);
                      },
                      title:
                      Text(
                        '• Create',
                        style: TextStyle(
                            color: AppColors.welcomeColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: (){
                        Get.toNamed(RoutesName.lead_list_screen);
                      },
                      title: Text(
                        '• List',
                        style: TextStyle(
                            color: AppColors.welcomeColor,
                            fontFamily: AppFonts.nunitoRegular,
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
                            color: AppColors.welcomeColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(RoutesName.teamLead_screen);
                      },
                      title: Text(
                        '• Team Leads',
                        style: TextStyle(
                            color: AppColors.welcomeColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(RoutesName.leadMaster_screen);
                      },
                      title: Text(
                        '• (Lead) Master',
                        style: TextStyle(
                            color: AppColors.welcomeColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),

                CustomExpandedListTile(
                    title: 'Customer',
                    leadingIconImage: AppIcons.customer,
                    children: [
                      ListTile(
                        onTap: (){
                          Get.toNamed(RoutesName.customerList_screen);
                          },
                        title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      ),

                      ListTile(
                        onTap: (){
                          Get.toNamed(RoutesName.AllCompanies_screen);
                          },
                        title: Text('• Companies', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14
                        ),),
                      )
                    ]),

                CustomExpandedListTile(
                    title: 'Order',
                    leadingIconImage: AppIcons.orders,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• (Order) Master', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular,
                        ),),
                      )
                    ]),

                CustomExpandedListTile(
                    title: 'HRM',
                    leadingIconImage: AppIcons.hrm,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• Leave',
                          style: TextStyle(
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Attendence', style: TextStyle(
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),),
                      ),

                    ]),
                CustomListTile(
                  leadIconImage: AppIcons.analytics,
                  title: 'Analytics',
                  onTap: () {
                  },
                ),
                CustomListTile(
                  leadIconImage: AppIcons.campaign,
                  title: 'Campaign',
                  onTap: () {},
                ),
                CustomListTile(
                    leadIconImage: AppIcons.customer,
                    title: 'Whatsapp',
                    onTap: (){}),
                CustomListTile(
                  leadIconImage: AppIcons.sales,
                  title: 'Sales',
                  onTap: () {},
                ),
                CustomListTile(
                  leadIconImage: AppIcons.roles,
                  title: 'Roles',
                  onTap: () {},
                ),
                CustomListTile(
                  leadIconImage: AppIcons.users,
                  title: 'Users',
                  onTap: () {},
                ),

                CustomExpandedListTile(
                    title: 'Tasks',
                    leadingIconImage: AppIcons.tasks,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Report', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Master', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      )
                    ]),

                CustomExpandedListTile(
                    title: 'Projects',
                    leadingIconImage: AppIcons.projects,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      ),

                      ListTile(
                        title: Text('• Master', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                        ),),
                      ),

                    ]),

                CustomExpandedListTile(
                    title: 'Inventory',
                    leadingIconImage: AppIcons.products,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• Stock', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                        ), ),
                      ),

                      ListTile(
                        title: Text('• Request', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Transactions', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Vendor', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                        ),),
                      ),

                      ListTile(
                        onTap: (){},
                        title: Text('• Refill Stock', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                        ),),
                      )
                    ]
                ),
                CustomListTile(
                  leadIconImage: AppIcons.service_area,
                  title: 'Service Area',
                  onTap: () {},
                ),
                CustomListTile(
                  leadIconImage: AppIcons.products,
                  title: 'Products',
                  onTap: () {},
                ),

                CustomExpandedListTile(
                    title: 'Helpdesk',
                    leadingIconImage: AppIcons.customer,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• List', style: TextStyle(
                            color: AppColors.welcomeColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoRegular
                        ),
                        ),
                      )
                    ]
                ),

                CustomExpandedListTile(
                    title: 'Master',
                    leadingIconImage: AppIcons.master,
                    children: [
                      ListTile(
                        onTap: (){},
                        title: Text('• Divisions',style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                        ),),
                      )
                    ])
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
              padding: EdgeInsets.only(left: 20),
              child: Text(
                version,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'NunitoRegular',
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: GenericButton(
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
            SizedBox(height: 20),
          ],
        ),
            ),
      );
  }
}

class AppTabDrawer extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String version;

  AppTabDrawer({
    required this.userName,
    required this.phoneNumber,
    required this.version,
  });
  final _saveUser = SaveUserData();

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
      backgroundColor: AppColors.whiteColor,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 13),
            height: Get.height / 9,
            child: Row(
              children: [
                Container(
                  height: Get.height / 13,
                  width: Get.width / 13,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.Splash_WHLogo
                  ),
                  ),
                ),
                SizedBox(width: Get.width / 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'NunitoRegular',
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        fontFamily: 'NunitoRegular',
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomListTile(
                leadIconImage: AppIcons.dashboard,
                title: 'Dashboard',
                onTap: () {
                  Get.toNamed(RoutesName.main_page_screen);
                },
              ),
              CustomExpandedListTile(
                title: 'Lead',
                leadingIconImage: AppIcons.lead,
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(RoutesName.createNewLead_screen);
                    },
                    title:
                    Text(
                      '• Create',
                      style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Get.toNamed(RoutesName.lead_list_screen);
                    },
                    title: Text(
                      '• List',
                      style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
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
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(RoutesName.teamLead_screen);
                    },
                    title: Text(
                      '• Team Leads',
                      style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(RoutesName.leadMaster_screen);
                    },
                    title: Text(
                      '• (Lead) Master',
                      style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),

              CustomExpandedListTile(
                  title: 'Customer',
                  leadingIconImage: AppIcons.customer,
                  children: [
                    ListTile(
                      onTap: (){
                        Get.toNamed(RoutesName.customerList_screen);
                      },
                      title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    ),

                    ListTile(
                      onTap: (){
                        Get.toNamed(RoutesName.AllCompanies_screen);
                      },
                      title: Text('• Companies', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontWeight: FontWeight.w300,
                          fontSize: 14
                      ),),
                    )
                  ]),

              CustomExpandedListTile(
                  title: 'Order',
                  leadingIconImage: AppIcons.orders,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text('• (Order) Master', style: TextStyle(
                        color: AppColors.welcomeColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontFamily: AppFonts.nunitoRegular,
                      ),),
                    )
                  ]),

              CustomExpandedListTile(
                  title: 'HRM',
                  leadingIconImage: AppIcons.hrm,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: const Text('• Leave', style: TextStyle(
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: const Text('• Attendence', style: TextStyle(
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),),
                    ),

                  ]),
              CustomListTile(
                leadIconImage: AppIcons.analytics,
                title: 'Analytics',
                onTap: () {},
              ),
              CustomListTile(
                leadIconImage: AppIcons.campaign,
                title: 'Campaign',
                onTap: () {},
              ),
              CustomListTile(
                  leadIconImage: AppIcons.customer,
                  title: 'Whatsapp',
                  onTap: (){}
              ),
              CustomListTile(
                leadIconImage: AppIcons.sales,
                title: 'Sales',
                onTap: (){},
              ),
              CustomListTile(
                leadIconImage: AppIcons.roles,
                title: 'Roles',
                onTap: () {},
              ),
              CustomListTile(
                leadIconImage: AppIcons.users,
                title: 'Users',
                onTap: () {},
              ),

              CustomExpandedListTile(
                  title: 'Tasks',
                  leadingIconImage: AppIcons.tasks,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Report', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                    ),

                    ListTile(
                      title: Text('• Master', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    )
                  ]),

              CustomExpandedListTile(
                  title: 'Projects',
                  leadingIconImage: AppIcons.projects,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Master', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                    )
                  ]
              ),

              CustomExpandedListTile(
                  title: 'Inventory',
                  leadingIconImage: AppIcons.products,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text('• Stock', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ), ),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Request', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Transactions', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Vendor', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                    ),

                    ListTile(
                      onTap: (){},
                      title: Text('• Refill Stock', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ),),
                    )
                  ]
              ),
              CustomListTile(
                leadIconImage: AppIcons.service_area,
                title: 'Service Area',
                onTap: () {},
              ),
              CustomListTile(
                leadIconImage: AppIcons.products,
                title: 'Products',
                onTap: () {},
              ),

              CustomExpandedListTile(
                  title: 'Helpdesk',
                  leadingIconImage: AppIcons.customer,
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text('• List', style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoRegular
                      ),
                      ),
                    )
                  ]
              ),

              CustomExpandedListTile(
                  title: 'Master',
                  leadingIconImage: AppIcons.master,
                  children: [
                    ListTile(
                      title: Text('• Divisions',style: TextStyle(
                          color: AppColors.welcomeColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),
                      ),
                    )
                  ]
              )
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
            padding: EdgeInsets.only(left: 20),
            child: Text(
              version,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'NunitoRegular',
                fontSize: 10,
                color: AppColors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: GenericButton(
              height: Get.height / 30,
              width: Get.width / 4,
              title: 'Logout',
              onPress: (){
                _saveUser.removeUser();
                Get.offNamed('/login_screen');
                Get.snackbar('Logout', 'Logout Successful');
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

