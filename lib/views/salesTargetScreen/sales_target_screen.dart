// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:websuites/data/models/responseModels/sales/sales_response_model.dart';
// import 'package:websuites/utils/utils.dart'; // Import the utility file
// import 'package:websuites/viewModels/sales/sales_viewModel.dart';
// import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
// import 'package:websuites/views/salesTargetScreen/salesDetailsScreen/SalesDetailsScreen.dart';
// import 'package:websuites/views/salesTargetScreen/widgets/sales_target_card.dart';
// import '../../data/models/responseModels/login/login_response_model.dart';
// import '../../resources/iconStrings/icon_strings.dart';
// import '../../utils/appColors/app_colors.dart';
// import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
//
// import '../../viewModels/saveToken/save_token.dart';
//
// import 'addtarget/AddTarget.dart';
//
// class SalesTargetScreen extends StatefulWidget {
//
//   const SalesTargetScreen({super.key});
//
//   @override
//   State<SalesTargetScreen> createState() => _SalesTargetScreenState();
// }
//
// class _SalesTargetScreenState extends State<SalesTargetScreen> {
//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//   final SalesViewModel _salesViewModel = Get.put(SalesViewModel());
//   SaveUserData userPreference = SaveUserData();
//
//   String userName = '';
//   String userEmail = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//     _salesViewModel.salesApi(context);
//   }
//
//   Future<void> _fetchUserData() async {
//     try {
//       LoginResponseModel response = await userPreference.getUser();
//       String? firstName = response.user!.first_name;
//       String? email = response.user!.email;
//
//       setState(() {
//         userName = firstName!;
//         userEmail = email!;
//       });
//     } catch (e) {
//       print('Error fetching userData: $e');
//     }
//   }
//
//   // Define the _getMembersCount method here
//   int _getMembersCount(List<Members>? members) {
//     return members?.length ?? 0; // Return the number of members, or 0 if the list is null
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _globalKey,
//       backgroundColor: AllColors.whiteColor,
//       floatingActionButton: CustomFloatingButton(
//           onPressed: () {},
//           imageIcon: IconStrings.navSearch3,
//           backgroundColor: AllColors.mediumPurple),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Obx(() => _salesViewModel.loading.value
//                 ? Center(child: CircularProgressIndicator())
//                 : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child:
//                 Column(
//                   children: [
//                     Row(
//
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AllColors.mediumPurple,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: () {
//
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AddTargetDialog();
//                                 },
//                               );
//                             },
//                             child: Text('Add Target', style: TextStyle(color: Colors.white))
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Column(
//                         children: _salesViewModel.salesList.map((sale) {
//                           return
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>  Salesdetailsscreen(),
//                                   ),
//                                 );
//                               },
//                               child: SalesTargetScreenCard(
//                                 title: sale.name ?? 'N/A',
//                                 startDate: formatDate(sale.start_date),
//                                 price: formatSaleTarget(sale.sale_target),
//                                 created_Date: formatDateWithTime(sale.created_at), // For date with time (e.g., "Oct 17, 2023, 4:32 PM")
//                                 deadline: formatDate(sale.end_date),
//                                 member: _getMembersCount(sale.members).toString(), // Use the method to get the members count
//                               ),
//                             );
//
//
//                         }).toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ),
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/viewModels/sales/sales_viewModel.dart';

import '../../utils/appColors/app_colors.dart';
import '../salesTargetScreen/salesDetailsScreen/SalesDetailsScreen.dart';

class SalesTargetScreen extends StatefulWidget {
  const SalesTargetScreen({super.key});

  @override
  State<SalesTargetScreen> createState() => _SalesTargetScreenState();
}

class _SalesTargetScreenState extends State<SalesTargetScreen> {
  final SalesViewModel salesViewModel = Get.put(SalesViewModel());

  @override
  void initState() {
    super.initState();
    // Fetch sales data when the screen is initialized
    salesViewModel.salesApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sales Data"),
            ],
          ),
        ),
        body: salesViewModel.loading.value
            ? Center(child: CircularProgressIndicator())
            : salesViewModel.salesResponseModel.value.items != null &&
            salesViewModel.salesResponseModel.value.items!.isNotEmpty
            ? ListView.builder(
          itemCount: salesViewModel.salesResponseModel.value.items!.length,
          itemBuilder: (context, index) {
            final item = salesViewModel.salesResponseModel.value.items![index];
            return
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15,top: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => Salesdetailsscreen());
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 5.3,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                        color: AllColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Salesdetailsscreen(),));
                                },
                                child: Text(
                                  item.name ?? 'N/A',
                                  style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),


                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                'START DATE - ',
                                style: TextStyle(
                                  fontSize: 12,

                                  fontWeight: FontWeight.w600,
                                  color: AllColors.blackColor,
                                ),
                              ),
                              Text(
                                formatDateToLongMonth2(
                                    item?.startDate != null ? DateTime.parse(item!.startDate.toString()) : DateTime.now()
                                ),
                                style: TextStyle(
                                  color: AllColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),

                              const Spacer(),
                              Text(
                                item.members != null && item.members!.isNotEmpty && item.members![0].saleTarget != null
                                    ? '₹${item.members![0].saleTarget}'
                                    : '₹N/A',
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 16,
                                color: AllColors.mediumPurple,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                item.createdAt.toString() ??'n/a',
                                style: TextStyle(
                                  color: AllColors.mediumPurple,
                                  fontSize: 12,

                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'DEADLINE - ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,

                                    fontSize: 12,
                                    color: AllColors.blackColor),
                              ),
                              Text(
                                'okk',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AllColors.grey,
                                  fontSize: 12,

                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            children: [
                              Text(
                                'MEMBERS - ',
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (item.members != null && item.members!.isNotEmpty) ...[
                                Text(
                                  "${item.members![0].saleTarget ?? 'N/A'}",
                                  style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],

                              const Spacer(),
                              Image.asset('assets/svg/report.svg',height: 14,width: 14,),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'REPORT',
                                style: TextStyle(
                                    color: AllColors.blackColor,

                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
          },
        )
            : Center(child: Text("No sales data available")),
      );
    });
  }
}
