import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Resources/components/Cards/AllCompanies_screenCard/allCompanies_ScreenCard.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';

import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

class AllCompaniesScreen extends StatefulWidget {
  const AllCompaniesScreen({super.key});

  @override
  State<AllCompaniesScreen> createState() => _AllCompaniesScreenState();
}

class _AllCompaniesScreenState extends State<AllCompaniesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userEmail = email;
        userName = first_name;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColors.whiteColor,

      drawer: AppDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(

                children: [
                  SizedBox(height: 130,),
                  
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),
                  AllCompanies_ScreenCard(title: 'Eras International'),

                ],
              ),
            ),
          ),


          //====================================================================
          //CUSTOM APP BAR

          CustomAppBar(child: Row(
            children: [
              InkWell
                (onTap : (){
                _globalKey.currentState?.openDrawer();
              },
                  child: Icon(Icons.menu_sharp, size: 25,)),
              SizedBox(width: 10,),
              Text('All Companies', style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w700
              ),),

              Spacer(),

              Icon(Icons.filter_list_outlined, size: 15, color: AppColors.lightGrey,),
              SizedBox(width: 5,),
              Text('Filter', style: TextStyle(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.nunitoRegular,
                  fontSize: 14
              ),)




            ],
          ),
          )



        ],
      )



    );
  }
}
