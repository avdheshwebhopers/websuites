import 'package:flutter/material.dart';
import 'Responsive.dart'; // Assuming you have a Responsive utility class defined elsewhere

class ResponsiveScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget drawer;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const ResponsiveScaffold({
    Key? key,
    required this.scaffoldKey,
    this.appBar,
    required this.drawer,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar, required FloatingActionButtonLocation floatingActionButtonLocation, required Color backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: isMobile || isTablet ? drawer : null, // Drawer only for mobile/tablet
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isDesktop || isTablet) {
            // Desktop: include drawer permanently on the side
            return Row(
              children: [
                drawer, // Display drawer as a permanent side menu for desktop
                Expanded(child: body),
              ],
            );
          }
          return body; // For mobile/tablet, just return the body
        },
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: isMobile ? bottomNavigationBar:null,
    );
  }
}

