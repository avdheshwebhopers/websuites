import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10w.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_20h.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../../Resources/Assets/app_fonts.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10h.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5h.dart';
import '../../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../Resources/components/app_colors.dart';

class CustomerMyTeamScreen extends StatefulWidget {
  const CustomerMyTeamScreen({super.key});

  @override
  State<CustomerMyTeamScreen> createState() => _CustomerMyTeamScreenState();
}

class _CustomerMyTeamScreenState extends State<CustomerMyTeamScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

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
      backgroundColor: AppColors.whiteColor,

      drawer: AppDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),

      body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [

                    SizedBox(height: 150,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User', style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        ),

                        Text('T.Customers', style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.nunitoRegular,
                        ),)
                      ],
                    ),

                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Anshuman Khurana', style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular
                        ),),

                        Text('234', style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),)
                      ],
                    ),

                    Divider(
                      thickness: 0.7,
                    ),

                    SizedBox(height: 3,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Anmol Rana' , style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular
                        ),),

                        Text('345', style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),)
                      ],
                    ),

                    Divider(
                      thickness: 0.7,
                    ),

                    SizedBox(height: 3,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ashu Kumar' , style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular
                        ),),

                        Text('265', style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),)
                      ],
                    ),

                    Divider(
                      thickness: 0.7,
                    ),

                    SizedBox(height: 3,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ankit Pathak' , style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular
                        ),),

                        Text('143', style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),)
                      ],
                    ),


                  ],
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(child:
              Row(
                children: [
                  InkWell(
                      onTap:(){
                        _globalKey.currentState?.openDrawer();
                      },
                      child: Icon(Icons.menu_sharp, size: 25,)),
                  SizedBox_10w(),
                  Text('My Team' ,style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.nunitoRegular,
                  ),),

                  Spacer(),
                  
                  Icon(Icons.filter_list_outlined, size: 15, color: AppColors.lightGrey,),
                  SizedBox_5w(),
                  Text('Filter', style: TextStyle(
                    color: AppColors.lightGrey,
                    fontFamily: AppFonts.nunitoRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                  ),),





                  
                ],
              ))

            ]

           ,),





    );
  }
}
