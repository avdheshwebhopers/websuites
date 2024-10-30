// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Responsive/Custom_Drawer.dart';
// import '../../special.dart';
// import '../../utils/components/widgets/drawer/custom_drawer.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     bool isTabletOrDesktop = MediaQuery.of(context).size.width >= 500;
//     return Obx(() {
//       String title = ['Inbox', 'Sent', 'Drafts'][controller.selectedIndex.value];
//
//       return Scaffold(
//         appBar: isTabletOrDesktop
//             ? null
//             : AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.black),
//           title: Text(
//             title,
//             style: TextStyle(color: Colors.black, fontSize: 18),
//           ),
//         ),
//         drawer: !isTabletOrDesktop
//             ? Drawer(
//           child: CustomDrawer(isTabletOrDesktop: isTabletOrDesktop),
//         )
//             : null,
//         body: Row(
//           children: [
//             if (isTabletOrDesktop)
//               CustomDrawer(isTabletOrDesktop: isTabletOrDesktop),
//             Expanded(
//               child: Container(
//                 color: Colors.grey[100],
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         title,
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Expanded(
//                       child: IndexedStack(
//                         index: controller.selectedIndex.value,
//                         children: [
//                           Inbox(),
//                           Sent(),
//                           Drafts(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
