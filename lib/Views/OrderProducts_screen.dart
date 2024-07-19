import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/OrderProducts_ScreenCard/OrderProduct_ScreenCard.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_10w.dart';
import '../Resources/components/app_colors.dart';

class OrderProductsScreen extends StatefulWidget {
  const OrderProductsScreen({super.key});

  @override
  State<OrderProductsScreen> createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreferences = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }


  Future<void> FetchUserData () async {
    try{
      LoginResponseModel response = await userPreferences.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });



    }catch (e){

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
          version: '1.10.12'),

      body:
          Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 130,),
                
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                      OrderProduct_ScreenCard(title: 'LifeCare Neuro'),
                    ],
                  ),
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
                      child: Icon(Icons.menu, size: 25,)),
                  SizedBox_10w(),
                  Text('Order Products', style: TextStyle(
                      color: AppColors.blackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFonts.nunitoRegular)),

                  Spacer(),

                  Icon(Icons.filter_list_outlined, size: 15, color: AppColors.lightGrey,),
                  SizedBox_5w(),
                  Text('Filter', style: TextStyle(color: AppColors.lightGrey,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),)
                ],
              )),

            ],
          )




    );
  }
}
