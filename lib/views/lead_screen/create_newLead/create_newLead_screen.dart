import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/views/lead_screen/create_newLead/widgets/create_new_lead_screen_card/create_new_lead_screen_card.dart';
import '../../../Data/models/Response_model/LoginResponseModel.dart';
import '../../../Resources/all_fonts/all_fonts.dart';
import '../../../resources/icon_strings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/text_styles/text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/nav_bar/custom_navBar.dart';
import '../../../utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_15h.dart';
import '../../../view_models/save_token/save_token.dart';

class CreateNewLeadScreen extends StatefulWidget {
  const CreateNewLeadScreen({super.key});

  @override
  State<CreateNewLeadScreen> createState() => _CreateNewLeadScreenState();
}

class _CreateNewLeadScreenState extends State<CreateNewLeadScreen> {
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
        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
            imageIcon: IconStrings.navSearch3,
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
                    TextStyles.w600_15(color: AllColors.vividPurple, context,
                       Strings.CreateNewLead_standardFields),
                    const SizedBox(
                      height: 28,
                    ),
                    TextStyles.w500_14_Black(context,
                       Strings.CreateNewLead_firstName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_enterFirstName),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_lastName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_enterLastName),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context,
                      Strings.CreateNewLead_PhoneNumber),
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
                                hintText: Strings.CreateNewLead_enterPhoneNumber,
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
                            TextStyles.w500_16(color: AllColors.whiteColor, context, Strings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_email),
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
                                hintText: Strings.CreateNewLead_emailExample,
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
                          TextStyles.w500_16(color: AllColors.whiteColor, context, Strings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Address),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_EnterAddress),
                    const SizedBox(
                      height: 20,
                    ),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_City_Pincode),


                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_City_Pincode),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_State),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_State),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Country),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_Country),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Source),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_Source),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Assigned_lead_to),

                    CreateNewLeadScreenCard(hintText: Strings.CreateNewLead_Assigned_lead_to),

                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_organisation),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_Enter_Name),
                    SizedBox15h(),

                   TextStyles.w500_14_Black(context, Strings.CreateNewLead_Divisions),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                   TextStyles.w500_14_Black(context, Strings.CreateNewLead_Product_Categories),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_Requirement),
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
                            hintText: Strings.CreateNewLead_Enter_Description,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AllFonts.nunitoRegular,
                              color: AllColors.lighterGrey,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextStyles.w600_universal(fontSize: 15, color: AllColors.vividPurple, context,
                        Strings.CreateNewLead_CustomFields),
                    const SizedBox(height: 30),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_pincode),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_EnterPincode
                    ),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Designation),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_Website),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_Website),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.CreateNewLead_GSTNumber),

                    const CreateNewLeadScreenCard(hintText:
                    Strings.CreateNewLead_GSTNumber),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_CustomerDivision),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(
                        context, Strings.CreateNewLead_IndustryType),
                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_LeadCategory),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_ContactPersonName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_EnterContactPersonName),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_ContactPersonNumber),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_EnterContactPersonNumber),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_CompleteAddress),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_EnterAddress),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.CreateNewLead_Industry),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.CreateNewLead_Select),
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
                            child: TextStyles.w500_universal(fontSize: 15, color: AllColors.whiteColor, context,
                                Strings.CreateNewLead_Create),
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
                            child: TextStyles.w500_universal(fontSize: 15, color: AllColors.whiteColor, context,
                                Strings.CreateNewLead_Reset),
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
                   TextStyles.w700_16(color: AllColors.blackColor, context, Strings.CreateNewLead_createNewLead),
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
                            size: 15,
                            color: AllColors.whiteColor,
                          ),
                         TextStyles.w400_14(color: AllColors.whiteColor, context, Strings.CreateNewLead_ImportLeads),
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
