import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/data/models/responseModels/sales/sales_response_model.dart';
import 'package:websuites/utils/utils.dart'; // Import the utility file
import 'package:websuites/viewModels/sales/sales_viewModel.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/salesTargetScreen/salesDetailsScreen/SalesDetailsScreen.dart';
import 'package:websuites/views/salesTargetScreen/widgets/sales_target_card.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../utils/datetrim/DateTrim.dart';
import '../../viewModels/saveToken/save_token.dart';
import '../customerScreens/orderProducts/widgets/servicedilioug_box/ServiceDiliougeBox.dart';
import 'addtarget/AddTarget.dart';

class SalesTargetScreen extends StatefulWidget {

  const SalesTargetScreen({super.key});

  @override
  State<SalesTargetScreen> createState() => _SalesTargetScreenState();
}

class _SalesTargetScreenState extends State<SalesTargetScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final SalesViewModel _salesViewModel = Get.put(SalesViewModel());
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _salesViewModel.salesApi(context);
  }

  Future<void> _fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? firstName = response.user!.firstName;
      String? email = response.user!.email;

      setState(() {
        userName = firstName!;
        userEmail = email!;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  // Define the _getMembersCount method here
  int _getMembersCount(List<Members>? members) {
    return members?.length ?? 0; // Return the number of members, or 0 if the list is null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      floatingActionButton: CustomFloatingButton(
          onPressed: () {},
          imageIcon: IconStrings.navSearch3,
          backgroundColor: AllColors.mediumPurple),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Stack(
        children: [
          SafeArea(
            child: Obx(() => _salesViewModel.loading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child:
                Column(
                  children: [
                    Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AllColors.mediumPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddTargetDialog();
                                },
                              );
                            },
                            child: Text('Add Target', style: TextStyle(color: Colors.white))
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: _salesViewModel.salesList.map((sale) {
                          return
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  Salesdetailsscreen(),
                                  ),
                                );
                              },
                              child: SalesTargetScreenCard(
                                title: sale.name ?? 'N/A',
                                startDate: formatDate(sale.start_date),
                                price: formatSaleTarget(sale.sale_target),
                                created_Date: formatDateWithTime(sale.created_at), // For date with time (e.g., "Oct 17, 2023, 4:32 PM")
                                deadline: formatDate(sale.end_date),
                                member: _getMembersCount(sale.members).toString(), // Use the method to get the members count
                              ),
                            );


                        }).toList(),
                      ),
                    ),
                  ],
                ),

              ),
            )),
          ),
        ],
      ),
    );
  }
}


