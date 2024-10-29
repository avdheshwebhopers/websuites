import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/iconStrings/icon_strings.dart';
import '../utils/appColors/app_colors.dart';
import '../utils/components/widgets/drawer/drawerListTiles/custom_list_tile.dart';
import '../utils/components/widgets/drawer/drawerListTiles/expandedListTile.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final bool isCollapsed;
  final VoidCallback? onCollapseToggle;
  final bool isTabletOrDesktop;

  const CustomDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.isTabletOrDesktop,
    this.isCollapsed = false,
    this.onCollapseToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 110 : 210,
      color: Colors.white,
      child: Column(
        children: [
          // Header with logo, title, and collapse button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child:
                  Image.asset(
                    'assets/images/WHLogo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                if (!isCollapsed)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Webhopers',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (isTabletOrDesktop)
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.green),
                    onPressed: onCollapseToggle,
                  ),
              ],
            ),
          ),
          // Navigation items

          Expanded(
            child: ListView(
              children: [
                if (!isCollapsed) ...[
                  CustomListTile(
                    leadIconImage: IconStrings.dashboard,
                    title: 'Dashboard',
                    onTap: () {
                      onItemSelected(0);
                    },
                    selectedIndex: selectedIndex, // Pass the selectedIndex here
                  ),

                  CustomExpandedListTile(
                    leadingIconImage: IconStrings.lead,
                    title: 'Lead',
                    children: [
                      ListTile(
                        onTap: () {
                          onItemSelected(1);
                        },
                        title: Text(
                          '• Create',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ),


                      ListTile(
                        onTap: () {
                          onItemSelected(2);
                        },
                        title: Text(
                          '• Google Leads',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          onItemSelected(3);
                        },
                        title: Text(
                          '• List',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          onItemSelected(4);
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
                          onItemSelected(5);

                        },
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
                          onItemSelected(6);
                        },
                        title: Text(
                          '• Setting',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          onItemSelected(7);


                        },
                        title: Text(
                          '• (Lead) Master',
                          style: TextStyle(
                              color: AllColors.welcomeColor,

                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
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
                          onItemSelected(3);
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
                          onItemSelected(4);
                        },
                        title: Text(
                          '• Companies',
                          style: TextStyle(
                              color: AllColors.welcomeColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  // Show only icons when collapsed
                  IconButton(
                    icon: Image.asset(IconStrings.dashboard, width: 40),
                    onPressed: () {
                      onItemSelected(0);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(IconStrings.lead, width: 40),
                    onPressed: () {
                      // Handle lead navigation
                    },
                  ),
                  IconButton(
                    icon: Image.asset (IconStrings.customer, width: 40),
                    onPressed: () {
                      // Handle customer navigation
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}