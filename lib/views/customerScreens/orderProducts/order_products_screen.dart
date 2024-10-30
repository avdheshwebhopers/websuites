// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:websuites/utils/responsive/bodies/responsive%20scaffold.dart';
// import 'package:websuites/views/customerScreens/orderProducts/widgets/orderProductsCard/order_product_screen_card.dart';
// import '../../../data/models/controller.dart';
// import '../../../data/models/responseModels/login/login_response_model.dart';
// import '../../../utils/appColors/app_colors.dart';
// import '../../../utils/components/widgets/appBar/custom_appBar.dart';
// import '../../../utils/components/widgets/drawer/custom_drawer.dart';
// import '../../../utils/components/widgets/sizedBoxes/sizedBox_10w.dart';
// import '../../../utils/components/widgets/sizedBoxes/sizedBox_5w.dart';
// import '../../../utils/responsive/bodies/Responsive.dart';
// import '../../../viewModels/saveToken/save_token.dart';
//
//
// class CustomerOrderProductsScreen extends StatefulWidget {
//   const CustomerOrderProductsScreen({super.key});
//
//   @override
//   State<CustomerOrderProductsScreen> createState() => _CustomerOrderProductsScreenState();
// }
//
// class _CustomerOrderProductsScreenState extends State<CustomerOrderProductsScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//   final ScreenController _screenController = Get.put(ScreenController());
//
//   SaveUserData userPreferences = SaveUserData();
//
//   String userName = '';
//   String userEmail = '';
//
//   @override
//   void initState() {
//     FetchUserData();
//     super.initState();
//   }
//
//   Future<void> FetchUserData () async {
//     try{
//       LoginResponseModel response = await userPreferences.getUser();
//       String? first_name = response.user!.first_name;
//       String? email = response.user!.email;
//
//       setState(() {
//         userName = first_name!;
//         userEmail = email!;
//       });
//     }catch (e){
//       print('Error fetching userData: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return ResponsiveScaffold(
//       scaffoldKey: _scaffoldKey,
//         key: _globalKey,
//       backgroundColor: AllColors.whiteColor,
//
//         drawer:
//         CustomDrawer(
//           selectedIndex: 0, // Customize as needed
//           onItemSelected: (index) {
//             // Handle item selection
//           },
//           isCollapsed: false,
//           onCollapseToggle: () {
//             // Handle drawer collapse/expand
//           },
//           isTabletOrDesktop: screenWidth >= 500,
//         ),
//
//       body:
//           Stack(
//             children: [
//               const SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 135),
//
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                       CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
//                     ],
//                   ),
//                 ),
//               ),
//
//               //================================================================
//               //CUSTOM APP BAR
//
//               CustomAppBar(child:
//               Row(
//                 children: [
//                   InkWell(
//                       onTap:(){
//                         _globalKey.currentState?.openDrawer();
//                       },
//                       child: const Icon(Icons.menu, size: 25,)),
//                   SizedBox10w(),
//                   Text('Order Products', style: TextStyle(
//                       color: AllColors.blackColor,
//                   fontSize: 17,
//                   fontWeight: FontWeight.w700,
//                     )),
//
//                   const Spacer(),
//
//                   Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
//                   SizedBox5w(),
//                   Text('Filter', style: TextStyle(color: AllColors.lightGrey,
//
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15),)
//                 ],
//               )),
//
//             ],
//           )
//
//
//
//
//     );
//   }
// }
