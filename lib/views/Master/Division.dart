import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../../../viewModels/master/divisions/master_divisions_viewModel.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/button/CustomButton.dart';
import '../../utils/fontfamily/FontFamily.dart';
import 'package:country_picker/country_picker.dart';


class MasterDivisionScreen extends StatefulWidget {
  const MasterDivisionScreen({super.key});

  @override
  _MasterDivisionScreenState createState() => _MasterDivisionScreenState();
}

class _MasterDivisionScreenState extends State<MasterDivisionScreen> {
  Country? _selectedCountry;
  TextEditingController phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = Colors.grey; // Default border color


  @override
  Widget build(BuildContext context) {
    final MasterDivisionsViewModel divisionViewModel = Get.put(MasterDivisionsViewModel());

    divisionViewModel.masterDivisions(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Divisions',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
              ),
            ),
            Spacer(),
            CustomButton(
              width: 70,
              height: 22,
              borderRadius: 54,
              onPressed: () {
                _showDialog(context);  // Call the dialog method when Add button is pressed
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AllColors.whiteColor, size: 18),
                  SizedBox(width: 5),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.sfPro,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Obx(() {
          final divisions = divisionViewModel.divisions;

          if (divisionViewModel.loading.value && divisions.isEmpty) {
            return const CircularProgressIndicator(); // Show loading indicator only if data is being fetched
          }

          if (divisions.isEmpty) {
            return const Text('No divisions available'); // Show message if no data is available
          }

          return RefreshIndicator(
            onRefresh: () => divisionViewModel.refreshData(context), // Trigger refresh
            child: ListView.builder(
              itemCount: divisions.length,
              itemBuilder: (context, index) {
                var division = divisions[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(division.name ?? 'No Date'),
                            Spacer(),
                            Text(division.status ?? 'N/A'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(formatDateToDDMMYYYY(division.createdAt ?? 'N/A')),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                // Handle edit action here
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    Country? tempSelectedCountry = _selectedCountry;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          'Add New Division',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.sfPro,
                            color: AllColors.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro,
                          color: AllColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (Country country) {
                                      setState(() {
                                        tempSelectedCountry = country;
                                      });
                                      this.setState(() {
                                        _selectedCountry = country;
                                      });
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    if (tempSelectedCountry != null) ...[
                                      Text(
                                        tempSelectedCountry!.flagEmoji,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Icon(Icons.arrow_drop_up),
                                    ] else
                                      Text('Select'),
                                    Container(
                                      width: 1,
                                      height: double.infinity,
                                      color: Colors.grey,
                                      margin: EdgeInsets.symmetric(horizontal: 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter mobile number',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 9),
                                  prefix: tempSelectedCountry != null
                                      ? Text('+${tempSelectedCountry!.phoneCode} ')
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro,
                          color: AllColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      CreateNewLeadScreenCard(hintText: 'Enter Name'),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            width: 80,
                            height: 30,
                            borderRadius: 25,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),
                          ),
                          CustomButton(
                            width: 80,
                            height: 30,
                            borderRadius: 25,
                            onPressed: () {
                              if (tempSelectedCountry != null && phoneController.text.isNotEmpty) {
                                // Handle the phone number with country code
                                String fullPhoneNumber = '+${tempSelectedCountry!.phoneCode}${phoneController.text}';
                                print(fullPhoneNumber); // Do something with the phone number
                              }
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }
}


