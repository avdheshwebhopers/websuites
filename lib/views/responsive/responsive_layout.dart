import 'package:flutter/material.dart';
import 'dimensions.dart';

// class ResponsiveLayout extends StatelessWidget {
//   final Widget mobileBody;
//   final Widget desktopBody;
//   final Widget tabBody;
//
//   ResponsiveLayout({required this.mobileBody, required this.desktopBody, required this.tabBody});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < mobileWidth) {
//           return mobileBody;
//         }else if(constraints.maxWidth < tabWidth){
//           return tabBody;}
//         else return desktopBody;
//       },
//     );
//   }
// }

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabBody;

  ResponsiveLayout({required this.mobileBody, required this.tabBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return tabBody;
        }
      },
    );
  }
}

