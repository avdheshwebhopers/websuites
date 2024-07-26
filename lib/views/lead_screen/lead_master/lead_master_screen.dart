import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:websuites/views/lead_screen/lead_master/widgets/leadMaster_screen_card/leadMaster_screen_card.dart';
import '../../../Data/models/Response_model/LoginResponseModel.dart';
import '../../../resources/icon_strings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/text_styles/text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/nav_bar/custom_navBar.dart';
import '../../../utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import '../../../view_models/save_token/save_token.dart';

class LeadMasterScreen extends StatefulWidget {
  const LeadMasterScreen({super.key});

  @override
  State<LeadMasterScreen> createState() => _LeadMasterScreenState();
}

class _LeadMasterScreenState extends State<LeadMasterScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState(){
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name;
        userEmail = email;
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
          backgroundColor: AllColors.mediumPurple),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AllColors.mediumPurple,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child:
                          TextStyles.w400_15(color: AllColors.whiteColor, context, Strings.LeadMaster_Types),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AllColors.textfield2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: 
                         TextStyles.w400_15(color: AllColors.blackColor, context, Strings.LeadMaster_Source),
                        ),
                      ),
                      Container(
                        height: Get.height / 30,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            color: AllColors.textfield2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child:

                          TextStyles.w400_15(color: AllColors.blackColor, context, Strings.LeadMaster_Status),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextStyles.w500_14_Black(context, Strings.LeadMaster_AvailableLeadStatus),
                  SizedBox(
                    height: 20,
                  ),
                  LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
                  LeadMasterScreenCard(title: 'Hot', activity: 'In Progress'),
                  LeadMasterScreenCard(title: 'Hot', activity: 'Completed'),
                  LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
                  LeadMasterScreenCard(title: 'Cold', activity: 'Active'),
                  LeadMasterScreenCard(
                      title: 'Cold', activity: 'In Progress'),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),

          //====================================================================
          //CUSTOM APP BAR

          CustomAppBar(
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu_sharp,
                      size: 25,
                    )),
                SizedBox(
                  width: 12,
                ),
                TextStyles.w700_17(color: AllColors.blackColor, context, Strings.LeadMaster_LeadMaster),
                Spacer(),
                Icon(
                  Icons.search,
                  size: 20,
                  color: AllColors.lightGrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: Get.height / 30,
                  decoration: BoxDecoration(
                      color: AllColors.mediumPurple,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child:
                      TextStyles.w500_12(color: AllColors.whiteColor, context, Strings.LeadMaster_AddLeadType),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
