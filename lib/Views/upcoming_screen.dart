import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/Assets/app_images.dart';
import 'package:websuites/Resources/components/Cards/Upcoming_screen_card/upcoming_screen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';

import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

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
            width: Get.width/1.8,
            height: Get.height*1,
            child :AppDrawer(
                userName: '$userName',
                phoneNumber: '$userEmail',
                version: '1.0.12')),

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
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 16,
                          ),),

                          Text('May 14, 2024, 12:45 PM', style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 12,
                          ),),
                        ],
                      ),

                      Spacer(),

                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundColor: AppColors.lightPurple,
                      //   backgroundImage: AssetImage(AppImages.Splash_WHLogo),
                      // ),

                      Container(
                        height: Get.height/20,
                        width: Get.width/11,
                        decoration: BoxDecoration(
                          color: AppColors.lighterPurple,
                          shape: BoxShape.circle,
                        ),
                        
                        child: Image.asset(AppImages.WelcomeCompanyLogo, scale: 20,),
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
                          color: AppColors.mediumPurple,
                        ),
                        child: Center(
                          child: Text('Upcoming', style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 14,
                            fontWeight: FontWeight.w400

                          ),),
                        ),
                      ),

                      Container(
                        height: Get.height / 34,
                        width: Get.width / 3.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.textfield2,
                        ),
                        child: Center(
                          child: Text('In Progress', style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: AppFonts.nunitoRegular,
                              fontSize: 14,
                              fontWeight: FontWeight.w400

                          ),),
                        ),
                      ),

                      Container(
                        height: Get.height / 34,
                        width: Get.width / 3.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.textfield2,
                        ),
                        child: Center(
                          child: Text('Completed', style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: AppFonts.nunitoRegular,
                              fontSize: 14,
                              fontWeight: FontWeight.w400

                          ),),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded, size: 20, color: AppColors.grey,),
                      SizedBox(width: 10,),
                      Text('UPCOMING', style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: AppFonts.nunitoRegular,
                      ),),

                      Spacer(),

                      Row(
                        children: [
                          Icon(Icons.filter_list_outlined, color: AppColors.lightGrey, size: 16,),
                          SizedBox(width: 5,),
                          Text('Filter', style: TextStyle(fontSize: 14,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightGrey),),

                          SizedBox(width: 10,),

                          Text('Last Week', style: TextStyle(
                              fontFamily: AppFonts.nunitoRegular,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor
                          ),),

                          Icon(Icons.arrow_drop_down, size: 30, )
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 15),

                  Upcoming_screen_card(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  Upcoming_screen_card(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  Upcoming_screen_card(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  Upcoming_screen_card(
                      title: 'SEO - Content Writing',
                      companyName: 'Ayurvedic PCD Franchise Company in Nagaland'),

                  Upcoming_screen_card(
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
                color: AppColors.whiteColor,
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
                  backgroundColor: AppColors.mediumPurple,
                  onPressed: (){},
                  child: Icon(Icons.add, size: 30, color: AppColors.whiteColor,),),
              ),
            ),


          ],
        )








    );
  }
}
