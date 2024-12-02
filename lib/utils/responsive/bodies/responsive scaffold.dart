import 'package:flutter/material.dart';
import '../../../Responsive/Custom_Drawer.dart';
import 'Responsive.dart';

class ResponsiveScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget? drawer; // Pass the drawer as a parameter
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color backgroundColor;

  const ResponsiveScaffold({
    Key? key,
    required this.scaffoldKey,
    this.appBar,
    this.drawer, // Assign drawer parameter
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: isMobile ? drawer : null, // Display drawer for mobile only
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isDesktop || isTablet) {
            return Row(
              children: [
                if (isTablet && drawer != null) drawer!, // Display drawer for tablet if available
                Expanded(child: body),
              ],
            );
          }
          return body;
        },
      ),
      floatingActionButton: isMobile ? floatingActionButton : null,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: isMobile ? bottomNavigationBar : null,
    );
  }
}
