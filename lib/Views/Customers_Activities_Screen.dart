import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/CutomerActivitiesScreen_card/cutomer_activities_screen_card.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class CustomersActivitiesScreen extends StatefulWidget {
  const CustomersActivitiesScreen({super.key});

  @override
  State<CustomersActivitiesScreen> createState() => _CustomersActivitiesScreenState();
}

class _CustomersActivitiesScreenState extends State<CustomersActivitiesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData () async {
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name;
        userEmail = email;
      });


    }catch(e){
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      key: _globalKey,

      drawer: Container(
        height: Get.height/1,
        width: Get.width/1.8,
        color: AppColors.whiteColor,
        child: AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: 'version'),
      ),


      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column (
                children: [
                  SizedBox(height: 115,),

                  CustomerActvities_Card(
                      title: 'Ms. Komal Sharma',
                      subtitle: 'Medisys biotech Private Limited'),

                  CustomerActvities_Card(
                      title: 'Ms. Komal Sharma',
                      subtitle: 'Medisys biotech Private Limited'),

                  CustomerActvities_Card(
                      title: 'Ms. Komal Sharma',
                      subtitle: 'Medisys biotech Private Limited'),

                  CustomerActvities_Card(
                      title: 'Ms. Komal Sharma',
                      subtitle: 'Medisys biotech Private Limited'),
                ],
              ),
            ),
          ),


          //====================================================================
          //APP DRAWER


          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: Get.height/8,
            width: Get.width/1,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4)
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      _globalKey.currentState?.openDrawer();
                    },
                      child: Icon(Icons.menu_sharp, size: 25,)),
                  SizedBox(width: 12,),
                  Text('Lead List', style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                  ),),

                  Spacer(),

                  Icon(Icons.filter_list_outlined, size: 17, color: AppColors.grey,),

                  SizedBox(width: 4,),

                  Text('Filter', style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.nunitoRegular
                  ),),

                  SizedBox(width: 10,),

                  Text('Details', style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),),

                  Icon(Icons.keyboard_arrow_right, size: 20,)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
