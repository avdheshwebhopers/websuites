import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/all_fonts/all_fonts.dart';
import '../Resources/all_icons/all_Icons.dart';
import '../Resources/all_images/all_images.dart';
import '../Resources/all_strings/all_strings.dart';
import '../Resources/all_textStyles/all_textStyles.dart';
import '../utils/components/app_colors.dart';
import '../utils/components/cards/upcoming_screen_card/upcoming_screen_card.dart';
import '../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../utils/components/custom_widgets/custom_navBar/custom_navBar.dart';
import '../utils/components/custom_widgets/floating_action_button/floating_action_button.dart';
import '../view_models/controllers/save_token/save_token.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  final GlobalKey <ScaffoldState> _globalKey =  GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();



  String userName = '';
  String? userEmail = "";
  DateTime dateTime = DateTime.now();

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
          imageIcon: AllIcons.navSearch3,
          backgroundColor: AllColors.mediumPurple
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      key: _globalKey,
      backgroundColor: AllColors.whiteColor,

        drawer: CustomDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),

        body:
        Stack(
          children: [
            SingleChildScrollView(
              child:
              Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 70),
              child: Column(
                children: [

                  Row(
                    children: [
                      InkWell(onTap:(){
                        _globalKey.currentState?.openDrawer();
                      },
                          child: Icon(Icons.menu_sharp, size: 25,)),

                      SizedBox(width: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello, Sunil !', style: TextStyle(
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AllFonts.nunitoRegular,
                            fontSize: 16,
                          ),),

                          Text('May 14, 2024, 12:45 PM', style: TextStyle(
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: AllFonts.nunitoRegular,
                            fontSize: 12,
                          ),),
                        ],
                      ),

                      Spacer(),

                      Container(
                        height: Get.height/20,
                        width: Get.width/11,
                        decoration: BoxDecoration(
                          color: AllColors.lighterPurple,
                          shape: BoxShape.circle,
                        ),
                        
                        child: Image.asset(AllImages.WelcomeCompanyLogo, scale: 20,),
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 34,
                        width: Get.width / 3.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AllColors.mediumPurple,
                        ),
                        child: Center(
                          child:
                          AllTextStyles.w400_14(color: AllColors.whiteColor, context, AllStrings.Upcoming_upcoming)
                        ),
                      ),

                      Container(
                        height: Get.height / 34,
                        width: Get.width / 3.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AllColors.textfield2,
                        ),
                        child: Center(
                          child:
                       AllTextStyles.w400_14(color: AllColors.blackColor, context, AllStrings.Upcoming_InProgress),
                        ),
                      ),

                      Container(
                        height: Get.height / 34,
                        width: Get.width / 3.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AllColors.textfield2,
                        ),
                        child: Center(
                          child:

                            AllTextStyles.w400_14(color: AllColors.blackColor, context, AllStrings.Upcoming_completed),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded, size: 20, color: AllColors.grey,),
                      SizedBox(width: 10,),
                     AllTextStyles.w500_14_Black(context, AllStrings.Upcoming_upcoming2),

                      Spacer(),

                      Row(
                        children: [
                          Icon(Icons.filter_list_outlined, color: AllColors.lightGrey, size: 16,),
                          SizedBox(width: 5,),
                         AllTextStyles.w400_14(color: AllColors.lightGrey, context, AllStrings.Upcoming_filter),

                          SizedBox(width: 10,),

                         AllTextStyles.w400_13(color: AllColors.blackColor, context, AllStrings.Upcoming_Lastweek),

                          Icon(Icons.arrow_drop_down, size: 30,)
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 15),

                  UpcomingScreenCard(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  UpcomingScreenCard(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  UpcomingScreenCard(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  UpcomingScreenCard(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  UpcomingScreenCard(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),
                ],
              ),
            ),
            ),

            Container(
              height: Get.height/16,
              width: Get.width/1,
              decoration: BoxDecoration(
                color: AllColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.10),
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
            ),


            Positioned(
              bottom: 30,
              right: 16,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  elevation: 2,
                  shape: CircleBorder(),
                  backgroundColor: AllColors.mediumPurple,
                  onPressed: (){},
                  child: Icon(Icons.add, size: 30, color: AllColors.whiteColor,),),
              ),
            ),
          ],
        )








    );
  }
}
