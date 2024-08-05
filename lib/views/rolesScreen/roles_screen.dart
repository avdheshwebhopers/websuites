import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/views/rolesScreen/widgets/rolesScreenCard/roles_screen_card.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../viewModels/saveToken/save_token.dart';

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
      }
      );
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
          version: '1.0.12'
      ),

      body:
          Stack(
            children: [
              const SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 70),
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
