import 'package:flutter/material.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../appColors/app_colors.dart';
import '../../components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import 'Responsive.dart'; // Assuming you have a Responsive utility class defined elsewhere

class ResponsiveScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget drawer;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color backgroundColor;

  const ResponsiveScaffold({
    Key? key,
    required this.scaffoldKey,
    this.appBar,
    required this.drawer,
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
      drawer: isMobile || isTablet ? drawer : null,
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isDesktop || isTablet) {
            return Row(
              children: [
                drawer,
                Expanded(child: body),
              ],
            );
          }
          return body;
        },
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: isMobile ? bottomNavigationBar : null,
    );
  }
}

