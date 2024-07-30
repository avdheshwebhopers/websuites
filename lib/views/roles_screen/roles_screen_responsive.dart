import 'package:flutter/material.dart';
import 'package:websuites/utils/responsive/responsive_layout.dart';
import 'package:websuites/views/roles_screen/roles_screen.dart';
import 'package:websuites/views/roles_screen/roles_screen_tab.dart';


class RolesScreenResponsive extends StatefulWidget {
  const RolesScreenResponsive({super.key});

  @override
  State<RolesScreenResponsive> createState() => _RolesScreenResponsiveState();
}

class _RolesScreenResponsiveState extends State<RolesScreenResponsive> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: RolesScreen(),
        tabBody: RolesScreenTab(),
    );
  }
}