import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../resources/iconStrings/icon_strings.dart';
import '../utils/appColors/app_colors.dart';
import '../utils/components/buttons/common_button.dart';
import '../utils/components/widgets/drawer/drawerListTiles/custom_list_tile.dart';
import '../utils/components/widgets/drawer/drawerListTiles/expandedListTile.dart';
import '../viewModels/saveToken/save_token.dart';

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
                '• ${["Create", "Google Leads", "List", "Trash", "Activities", "Setting", "(Lead) Master"][index]}',
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
                '• Activities',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(10),
              title: Text(
                '• Payment Reminder',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(11),
              title: Text(
                '• Companies',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(12),
              title: Text(
                '• Services',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(13),
              title: Text(
                '• Order Products',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
          ],
        ),


        CustomExpandedListTile(
          title: 'Orders',
          leadingIconImage: IconStrings.orders,
          initiallyExpanded: expandedSection == 'orders',
          children: [
            ListTile(
              onTap: () => widget.onItemSelected(14),
              title: Text(
                '• List',
                style: TextStyle(color: AllColors.welcomeColor, fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(15),
              title: Text(
                '• Activities',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(16),
              title: Text(
                '• Proforma List',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () => widget.onItemSelected(17),
              title: Text(
                '• Order(Master)',
                style: TextStyle(color: AllColors.welcomeColor, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),

          ],
        ),
        CustomListTile(
          leadIconImage: IconStrings.sales,
          title: 'Sales',
          onTap: () => widget.onItemSelected(18),
          selectedIndex: widget.selectedIndex,
        ),
      ],
    );
  }

  Widget buildCollapsedContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(IconStrings.dashboard, width: 40),
            onPressed: () => widget.onItemSelected(0),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(IconStrings.lead, width: 40),
            onPressed: () => toggleDrawerWithSection('lead'),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(IconStrings.customer, width: 40),
            onPressed: () => toggleDrawerWithSection('customer'),
          ),
        ),
      ],
    );
  }

  Widget buildHeader() {
    if (isLocalCollapsed) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/WHLogo.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/WHLogo.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Webhopers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLocalCollapsed ? 80 : 200,
      color: Colors.white,
      child: Column(
        children: [
          // Header with logo
          buildHeader(),
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
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CommonButton(
                  height: 40,
                  width: isLocalCollapsed ? 60 : 120,
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