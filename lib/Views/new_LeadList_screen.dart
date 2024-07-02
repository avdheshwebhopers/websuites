import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';

import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/components/Cards/create_new_lead_screen_Card/create_new_lead_screen_Widget.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_15h.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

class New_LeadList_screen extends StatefulWidget {
  const New_LeadList_screen({super.key});

  @override
  State<New_LeadList_screen> createState() => _New_LeadList_screenState();
}

class _New_LeadList_screenState extends State<New_LeadList_screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();
  DateTime dateTime = DateTime.now();

  String userName = '';
  String? userEmail = "";

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.search, size: 27, color: AppColors.whiteColor,),
          backgroundColor: AppColors.vividPurple,

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _globalKey,
        backgroundColor: AppColors.whiteColor,
        drawer: Container(
            color: AppColors.whiteColor,
            width: Get.width / 1.8,
            height: Get.height * 1,
            child: AppDrawer(
                userName: '$userName',
                phoneNumber: '$userEmail',
                version: '1.0.12')),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 135,
                    ),
                    Text(
                      'Standard Fields',
                      style: TextStyle(
                        color: AppColors.vividPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: AppFonts.nunitoRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'First name',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),


                    const CreateNewLeadScreenWidget(hintText: 'Enter First Name'),
                    SizedBox_15h(),
                    Text(
                      'Last name',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Last Name'),
                    SizedBox_15h(),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 19,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightGrey, // Specify the outline color here
                              width: 0.3,),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: 'Enter Phone Number',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppFonts.nunitoRegular,
                                  color: AppColors.lighterGrey,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 20,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AppColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              '+   Add',
                              style: TextStyle(
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox_15h(),
                    Text(
                      'Email',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 19,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightGrey, // Specify the outline color here
                              width: 0.3,),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppFonts.nunitoRegular,
                                  color: AppColors.lighterGrey,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 20,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AppColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              '+   Add',
                              style: TextStyle(
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox_15h(),

                    Text(
                      'Address',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Address'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'City / Pincode',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'City / Pincode'),
                   SizedBox_15h(),
                    Text(
                      'State',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'State'),
                    SizedBox_15h(),

                    Text(
                      'Country',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Country'),
                    SizedBox_15h(),

                    Text(
                      'Source',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Source'),
                    SizedBox_15h(),

                    Text(
                      'Assigned-Lead to',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: Get.height / 19,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey, // Specify the outline color here
                          width: 0.3,),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: 'Select',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.nunitoRegular,
                              color: AppColors.lighterGrey,
                            )),
                      ),
                    ),
                    SizedBox_15h(),

                    Text(
                      'Organisation',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Name'),
                    SizedBox_15h(),

                    Text(
                      'Divisions',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Product Categories',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Requirement',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: Get.height / 6,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey, // Specify the outline color here
                          width: 0.3,),

                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: 'Enter Description',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.nunitoRegular,
                              color: AppColors.lighterGrey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Custom Fields',
                      style: TextStyle(
                        color: AppColors.vividPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: AppFonts.nunitoRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Pincode',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Pincode'),
                    SizedBox_15h(),

                    Text(
                      'Designation',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Website',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'GST Number',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter GST Number'),
                    SizedBox_15h(),

                    Text(
                      'Customer Division',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Industry Type',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Lead Category',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Contact Person Name',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Name'),
                    SizedBox_15h(),

                    Text(
                      'Contact Person Number',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    SizedBox_15h(),

                    Text(
                      'Complete Address',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Enter Address'),
                    SizedBox_15h(),

                    Text(
                      'Industry',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const CreateNewLeadScreenWidget(hintText: 'Select'),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AppColors.mediumPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: AppFonts.nunitoRegular),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AppColors.lighterGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: AppFonts.nunitoRegular),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),


            //==================================================================
            //CUSTOM APP BAR


            CustomAppBar(
              child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          _globalKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 25,
                          color: AppColors.blackColor,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Create New Lead',
                      style: TextStyle(
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: Get.height / 28,
                      width: Get.width / 3.4,
                      decoration: BoxDecoration(
                          color: AppColors.mediumPurple,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.cloud_download_sharp,
                            size: 16,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            'Import Leads',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: AppFonts.nunitoRegular),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

          ],
        ));
  }
}
