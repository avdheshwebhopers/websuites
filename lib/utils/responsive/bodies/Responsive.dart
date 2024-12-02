// import 'package:flutter/material.dart';
//
// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;
//
//   const Responsive({
//     Key? key,
//     required this.mobile,
//     required this.tablet,
//     required this.desktop,
//   }) : super(key: key);
//
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 550;
//
//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 550 &&
//           MediaQuery.of(context).size.width < 1100;
//
//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1100;
//
//   @override
//   Widget build(BuildContext context) {
//     if (isMobile(context)) {
//       return mobile;
//     } else if (isTablet(context)) {
//       return tablet;
//     } else {
//       return desktop;
//     }
//   }
// }



import 'package:flutter/widgets.dart';

class ResponsiveUtils {

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 500;
  }


  static bool isTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 500 && screenWidth < 1000;
  }


  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1000;
  }


  static double getResponsiveWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }


  static double getResponsiveHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }


  static double getResponsiveFontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }
}
