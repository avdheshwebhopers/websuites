import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../data/models/responseModels/login.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../../utils/components/widgets/sizedBoxes/sizedBox_15h.dart';
import '../../../viewModels/saveToken/save_token.dart';



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
            userName: userName,
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
                       Strings.standardFields),
                    const SizedBox(
                      height: 28,
                    ),
                    TextStyles.w500_14_Black(context,
                       Strings.firstName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterFirstName),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context,
                        Strings.lastName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterLastName),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context,
                      Strings.phoneNumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height/21,
                          width: Get.width/1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AllColors.lightGrey,
                              width: 0.3
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: Strings.enterPhoneNumber,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                    
                                  color: AllColors.lighterGrey,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height/21,
                          width: Get.width/4.5,
                          decoration: BoxDecoration(
                            color: AllColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                            TextStyles.w500_16(color: AllColors.whiteColor, context, Strings.add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),
                    TextStyles.w500_14_Black(context, Strings.createNewLeadEmail),
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
                                hintText: Strings.emailExample,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                    
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
                          TextStyles.w500_16(color: AllColors.whiteColor, context, Strings.add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.address),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterAddress),
                    const SizedBox(
                      height: 20,
                    ),
                    TextStyles.w500_14_Black(context,
                        Strings.cityPincode),


                    const CreateNewLeadScreenCard(
                        hintText: Strings.cityPincode),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.state),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.state),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.country),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.country),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.source),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.source),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.assignedLeadTo),

                    CreateNewLeadScreenCard(hintText: Strings.assignedLeadTo),

                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.organisation),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterName),
                    SizedBox15h(),

                   TextStyles.w500_14_Black(context, Strings.divisions),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                   TextStyles.w500_14_Black(context, Strings.categories),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.requirement),
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
                            hintText: Strings.enterDescription,
                            hintStyle: TextStyle(
                              fontSize: 13,
                                
                              color: AllColors.lighterGrey,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextStyles.w600_universal(fontSize: 15, color: AllColors.vividPurple, context,
                        Strings.customFields),
                    const SizedBox(height: 30),

                    TextStyles.w500_14_Black(context, Strings.pincode),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterPincode
                    ),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.designation),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.website),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.website),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context, Strings.gstNumber),

                    const CreateNewLeadScreenCard(hintText:
                    Strings.gstNumber),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.customerDivision),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(
                        context, Strings.industryType),
                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.leadCategory),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.select),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.contactPersonName),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterContactPersonName),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.contactPersonNumber),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterContactPersonNumber),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.completeAddress),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.enterAddress),
                    SizedBox15h(),

                    TextStyles.w500_14_Black(context,
                        Strings.industry),

                    const CreateNewLeadScreenCard(
                        hintText: Strings.createNewLeadSelect),
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
                                Strings.create),
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
                                Strings.reset),
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
                   TextStyles.w700_16(color: AllColors.blackColor, context, Strings.createNewLead),
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
                         TextStyles.w400_14(color: AllColors.whiteColor, context, Strings.importLeads),
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
