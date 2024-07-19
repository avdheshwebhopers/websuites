import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_fonts/all_fonts.dart';
import '../../Resources/all_icons/all_Icons.dart';
import '../../Resources/all_strings/all_strings.dart';
import '../../Resources/all_textStyles/all_textStyles.dart';


import '../../utils/components/app_colors.dart';
import '../../utils/components/cards/create_new_lead_screen_card/create_new_lead_screen_card.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../utils/components/custom_widgets/custom_navBar/custom_navBar.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_15h.dart';
import '../../utils/components/custom_widgets/floating_action_button/floating_action_button.dart';
import '../../view_models/controllers/save_token/save_token.dart';

class Create_LeadList_screen extends StatefulWidget {
  const Create_LeadList_screen({super.key});

  @override
  State<Create_LeadList_screen> createState() => _Create_LeadList_screenState();
}

class _Create_LeadList_screenState extends State<Create_LeadList_screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();
  DateTime dateTime = DateTime.now();

  String userName = '';
  String? userEmail = "";


  @override
  void initState(){
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
        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
            imageIcon: AllIcons.navSearch3,
            backgroundColor: AllColors.mediumPurple
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        key: _globalKey,
        backgroundColor: AllColors.whiteColor,
        drawer: CustomDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'
        ),

        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    AllTextStyles.w600_15(color: AllColors.vividPurple, context,
                       AllStrings.CreateNewLead_standardFields),
                    const SizedBox(
                      height: 28,
                    ),
                    AllTextStyles.w500_14_Black(context,
                       AllStrings.CreateNewLead_firstName),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_enterFirstName),
                    SizedBox15h(),
                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_lastName),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_enterLastName),
                    SizedBox15h(),
                    AllTextStyles.w500_14_Black(context,
                      AllStrings.CreateNewLead_PhoneNumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 21,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AllColors.lightGrey, // Specify the outline color here
                              width: 0.3
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: AllStrings.CreateNewLead_enterPhoneNumber,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AllFonts.nunitoRegular,
                                  color: AllColors.lighterGrey,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 21,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AllColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                            AllTextStyles.w500_16(color: AllColors.whiteColor, context, AllStrings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),
                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_email),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 21,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AllColors.lightGrey, // Specify the outline color here
                              width: 0.3,),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: AllStrings.CreateNewLead_emailExample,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AllFonts.nunitoRegular,
                                  color: AllColors.lighterGrey,
                                )
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 21,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AllColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                          AllTextStyles.w500_16(color: AllColors.whiteColor, context, AllStrings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Address),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_EnterAddress),
                    const SizedBox(
                      height: 20,
                    ),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_City_Pincode),


                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_City_Pincode),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_State),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_State),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Country),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_Country),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Source),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_Source),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Assigned_lead_to),

                    CreateNewLeadScreenCard(hintText: AllStrings.CreateNewLead_Assigned_lead_to),

                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_organisation),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_Enter_Name),
                    SizedBox15h(),

                   AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Divisions),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                   AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Product_Categories),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_Requirement),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: Get.height / 6,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AllColors.lightGrey, // Specify the outline color here
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: AllStrings.CreateNewLead_Enter_Description,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AllFonts.nunitoRegular,
                              color: AllColors.lighterGrey,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    AllTextStyles.w600_universal(fontSize: 15, color: AllColors.vividPurple, context,
                        AllStrings.CreateNewLead_CustomFields),
                    const SizedBox(height: 30),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_pincode),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_EnterPincode
                    ),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Designation),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_Website),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_Website),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context, AllStrings.CreateNewLead_GSTNumber),

                    const CreateNewLeadScreenCard(hintText:
                    AllStrings.CreateNewLead_GSTNumber),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_CustomerDivision),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(
                        context, AllStrings.CreateNewLead_IndustryType),
                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_LeadCategory),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_select),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_ContactPersonName),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_EnterContactPersonName),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_ContactPersonNumber),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_EnterContactPersonNumber),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_CompleteAddress),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_EnterAddress),
                    SizedBox15h(),

                    AllTextStyles.w500_14_Black(context,
                        AllStrings.CreateNewLead_Industry),

                    const CreateNewLeadScreenCard(
                        hintText: AllStrings.CreateNewLead_Select),
                    const SizedBox(height: 30
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AllColors.mediumPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: AllTextStyles.w500_universal(fontSize: 15, color: AllColors.whiteColor, context,
                                AllStrings.CreateNewLead_Create),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AllColors.lighterGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: AllTextStyles.w500_universal(fontSize: 15, color: AllColors.whiteColor, context,
                                AllStrings.CreateNewLead_Reset),
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
                          color: AllColors.blackColor,
                        )
                    ),
                    const SizedBox(width: 10,
                    ),
                   AllTextStyles.w700_16(color: AllColors.blackColor, context, AllStrings.CreateNewLead_createNewLead),
                    const Spacer(),
                    Container(
                      height: Get.height / 28,
                      width: Get.width / 3.4,
                      decoration: BoxDecoration(
                          color: AllColors.mediumPurple,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.cloud_download_sharp,
                            size: 16,
                            color: AllColors.whiteColor,
                          ),
                         AllTextStyles.w400_14(color: AllColors.whiteColor, context, AllStrings.CreateNewLead_ImportLeads),
                        ],
                      ),
                    )
                  ],
                ),
              ),

          ],
        )
    );
  }
}
