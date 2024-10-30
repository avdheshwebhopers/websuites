// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../resources/strings/strings.dart';
// import '../../../../../utils/appColors/app_colors.dart';
// import '../../../../../viewModels/master/divisions/master_divisions_viewModel.dart';
// import '../../data/models/controller.dart';
// import '../../resources/textStyles/text_styles.dart';
// import '../../utils/MasterScreen/MasterUtils.dart';
// import '../../utils/components/widgets/drawer/custom_drawer.dart';
// import '../../utils/responsive/bodies/Responsive.dart';
// import '../../viewModels/leadScreens/leadMasters/controller.dart';
//
//
// class MasterDivisionScreen extends StatefulWidget {
//   const MasterDivisionScreen({super.key});
//
//   @override
//   State<MasterDivisionScreen> createState() => _MasterDivisionScreenState();
// }
//
// class _MasterDivisionScreenState extends State<MasterDivisionScreen> {
//   final LeadMasterController controller = Get.put(LeadMasterController());
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//   final MasterDivisionsViewModel divisionViewModel = Get.put(MasterDivisionsViewModel());
//   final ScreenController _screenController = Get.put(ScreenController());
//   String userName = '';
//   String userEmail = '';
//
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserDataAndDivisions();
//   }
//
//   Future<void> _fetchUserDataAndDivisions() async {
//     final userData = await MasterScreenUtils.fetchUserData();
//     setState(() {
//       userName = userData['userName'] ?? '';
//       userEmail = userData['userEmail'] ?? '';
//     });
//     await divisionViewModel.masterDivisions(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     return MasterScreenUtils.buildCommonScaffold(
//       scaffoldKey: _scaffoldKey,
//       globalKey: _globalKey,
//       userName: userName,
//       userEmail: userEmail,
//       title: Strings.masterDivision,
//       addButtonTitle: Strings.addDivision,
//       onAddPressed: () {},
//       drawer: Obx(
//             () =>
//                 CustomDrawer(
//                   selectedIndex: 0, // Customize as needed
//                   onItemSelected: (index) {
//                     // Handle item selection
//                   },
//                   isCollapsed: false,
//                   onCollapseToggle: () {
//                     // Handle drawer collapse/expand
//                   },
//                   isTabletOrDesktop: screenWidth >= 500,
//                 ),
//       ),
//
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           MasterScreenUtils.buildSearchField(),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Obx(() {
//               final divisions = divisionViewModel.divisions;
//               return MasterScreenUtils.buildDataTable(
//                 context: context,  // Pass the context here
//                 columns: const [
//
//
//                   DataColumn(label: Text(Strings.sno,style: TextStyles.masterScreen,),),
//                   DataColumn(label: Text(Strings.name, style: TextStyles.masterScreen)),
//                   DataColumn(label: Text(Strings.masterStatus, style: TextStyles.masterScreen,)),
//                   DataColumn(label: Text(Strings.created_date, style:TextStyles.masterScreen,)),
//                   DataColumn(label: Text(Strings.action, style: TextStyles.masterScreen,)),
//
//
//                 ],
//                 rows: List.generate(divisions.length, (index) {
//                   final division = divisions[index];
//                   return DataRow(cells: [
//                     DataCell(Text('${index + 1}')),
//                     DataCell(Text(division.name ?? '', style: TextStyles.namelength)),
//                     DataCell(
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: Color(0x1F47BD82),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           division.status ?? '',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF47BD82),
//                           ),
//                         ),
//                       ),
//                     ),
//                     DataCell(Text(division.createdAt ?? '', style: TextStyle(fontSize: 14))),
//                     DataCell(IconButton(
//                       icon: const Icon(Icons.mode_edit_outline_outlined),
//                       onPressed: () {
//                         // Handle edit action here
//                       },
//                     )),
//                   ]);
//                 }),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }