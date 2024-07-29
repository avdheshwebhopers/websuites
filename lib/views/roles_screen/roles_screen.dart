import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/login.dart';
import 'package:websuites/resources/icon_strings/icon_strings.dart';
import 'package:websuites/utils/components/widgets/app_bar/custom_appBar.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/components/widgets/nav_bar/custom_navBar.dart';
import 'package:websuites/utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import 'package:websuites/view_models/save_token/save_token.dart';
import 'package:websuites/views/roles_screen/widgets/roles_screen_card/roles_screen_card.dart';
  
import '../../utils/app_colors/app_colors.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchuserData();
    super.initState();
  }
  Future<void> FetchuserData () async {
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });

    }catch (e){
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
          onPressed: (){},
          imageIcon: IconStrings.navSearch3,
          backgroundColor: AllColors.mediumPurple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      drawer: CustomDrawer(
          userName: userName,
          phoneNumber: userEmail,
          version: '1.0.12'),

      body:
          Stack(
            children: [
              const SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        RolesScreenCard(title: 'Graphic Designer'),
                        RolesScreenCard(title: 'Graphic Designer'),
                        RolesScreenCard(title: 'Graphic Designer'),
                        RolesScreenCard(title: 'Graphic Designer'),
                        RolesScreenCard(title: 'Graphic Designer'),
                        RolesScreenCard(title: 'Graphic Designer')
                      ],
                    ),
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(
                  child: Row(
                    children: [
                      InkWell(
                        onTap:(){
                          _globalKey.currentState?.openDrawer();
                        },
                          child: Icon(Icons.menu_sharp, size: 25,)),
                      SizedBox(width: 10),
                      Text('Roles', style: TextStyle(
                        color: AllColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                          
                      ),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: Get.height/30,
                        width: Get.width/4.3,
                        decoration: BoxDecoration(
                          color: AllColors.mediumPurple,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 20, color: AllColors.whiteColor,),
                            SizedBox(width: 5,),
                            Text('Add Role', style: TextStyle(
                              color: AllColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                                
                            ),)
                          ],
                        )
                      ),




                    ],

                  ))

            ],
          )




    );
  }
}
