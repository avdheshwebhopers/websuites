import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controler/viewModels/saveToken/save_token.dart';
import '../resources/iconStrings/icon_strings.dart';
import '../utils/appColors/app_colors.dart';
import '../utils/components/buttons/common_button.dart';
import '../utils/components/widgets/drawer/drawerListTiles/custom_list_tile.dart';
import '../utils/components/widgets/drawer/drawerListTiles/expandedListTile.dart';

class CustomDrawer extends StatefulWidget {
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
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? expandedSection;
  bool isLocalCollapsed = false;
  final _saveUser = SaveUserData();

  @override
  void initState() {
    super.initState();
    isLocalCollapsed = widget.isCollapsed;
  }

  void toggleDrawerWithSection(String section) {
    setState(() {
      if (isLocalCollapsed) {
        isLocalCollapsed = false;
        expandedSection = section;
      } else if (expandedSection == section) {
        isLocalCollapsed = true;
        expandedSection = null;
      } else {
        expandedSection = section;
      }
    });
    widget.onCollapseToggle?.call();
  }

  Widget buildExpandedContent() {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: [
        CustomListTile(
          leadIconImage: IconStrings.dashboard,
          title: 'Dashboard',
          onTap: () => widget.onItemSelected(0),
          selectedIndex: widget.selectedIndex,
        ),
        CustomExpandedListTile(
          leadingIconImage: IconStrings.lead,
          title: 'Lead',
          initiallyExpanded: expandedSection == 'lead',
          children: List.generate(
            7,
                (index) => ListTile(
              onTap: () => widget.onItemSelected(index + 1),
              title: Text(
                '• ${["Create", "Google Leads", "List", "Activities", "Trash", "Setting", "(Lead) Master"][index]}',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
          ),
        ),
        CustomExpandedListTile(
          title: 'Customer',
          leadingIconImage: IconStrings.customer,
          initiallyExpanded: expandedSection == 'customer',
          children: [
            ListTile(
              onTap: () => widget.onItemSelected(8),
              title: Text(
                '• List',
                style: TextStyle(color: AllColors.welcomeColor, fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(9),
              title: Text(
                '• Companies',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCollapsedContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        IconButton(
          icon: Image.asset(IconStrings.dashboard, width: 40),
          onPressed: () => widget.onItemSelected(0),
        ),
        IconButton(
          icon: Image.asset(IconStrings.lead, width: 40),
          onPressed: () => toggleDrawerWithSection('lead'),
        ),
        IconButton(
          icon: Image.asset(IconStrings.customer, width: 40),
          onPressed: () => toggleDrawerWithSection('customer'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: isLocalCollapsed ? 80 : 200,
      color: Colors.white,
      child: Column(
        children: [
          // Header with logo and collapse button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 12.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/WHLogo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                if (!isLocalCollapsed)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Webhopers',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
          // Navigation items
          Expanded(
            child: isLocalCollapsed
                ? buildCollapsedContent()
                : buildExpandedContent(),
          ),
          // Collapse toggle button and Logout
          Column(
            children: [
              if (widget.isTabletOrDesktop)
                IconButton(
                  icon: Icon(
                    isLocalCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      isLocalCollapsed = !isLocalCollapsed;
                      if (isLocalCollapsed) expandedSection = null;
                    });
                    widget.onCollapseToggle?.call();
                  },
                ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CommonButton(
                  height: 40,
                  width: 120,
                  title: 'Logout',
                  onPress: () {
                    _saveUser.removeUser();
                    Get.offNamed('/login_screen');
                    Get.snackbar('Logout', 'Logout Successful');
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
