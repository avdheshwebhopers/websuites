import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';


import '../Resources/all_fonts/all_fonts.dart';
import '../utils/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../utils/components/app_colors.dart';
import '../utils/components/cards/order_products_screen_card/order_product_screen_card.dart';
import '../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';
import '../view_models/controllers/save_token/save_token.dart';

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
      backgroundColor: AllColors.whiteColor,

      drawer: CustomDrawer(
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
                
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
                      OrderProductScreenCard(title: 'LifeCare Neuro'),
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
                  SizedBox10w(),
                  Text('Order Products', style: TextStyle(
                      color: AllColors.blackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  fontFamily: AllFonts.nunitoRegular)),

                  Spacer(),

                  Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
                  SizedBox5w(),
                  Text('Filter', style: TextStyle(color: AllColors.lightGrey,
                  fontFamily: AllFonts.nunitoRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),)
                ],
              )),

            ],
          )




    );
  }
}
