import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import 'package:websuites/utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import 'package:websuites/view_models/save_token/save_token.dart';
import 'package:websuites/views/sales_target_screen/widgets/sales_target_card.dart';
import '../Resources/all_fonts/all_fonts.dart';
import '../Utils/components/app_colors.dart';

class SalesTargetScreen extends StatefulWidget {
  const SalesTargetScreen({super.key});

  @override
  State<SalesTargetScreen> createState() => _SalesTargetScreenState();
}

class _SalesTargetScreenState extends State<SalesTargetScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData ()async {
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
                        SizedBox(height: 70),
                        SalesTargetScreenCard(title: 'Dinesh Thakur October Sale Target'),
                        SalesTargetScreenCard(title: 'Dinesh Thakur October Sale Target'),
                        SalesTargetScreenCard(title: 'Dinesh Thakur October Sale Target'),
                        SalesTargetScreenCard(title: 'Dinesh Thakur October Sale Target'),
                        SalesTargetScreenCard(title: 'Dinesh Thakur October Sale Target'),
                      ],
                    ),
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      _globalKey.currentState?.openDrawer();
                    },
                      child: Icon(Icons.menu_sharp,size: 25,)),
                  SizedBox(width: 10,),
                  Text('Sales Target', style: TextStyle(
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: AllFonts.nunitoRegular
                  ),),

                  Spacer(),

                  Container(
                    height: Get.height/30,
                    width: Get.width/4,
                    decoration: BoxDecoration(
                      color: AllColors.mediumPurple,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add, size: 20, color: AllColors.whiteColor,),
                        Text('Add Target', style: TextStyle(
                          color: AllColors.whiteColor,
                          fontFamily: AllFonts.nunitoRegular,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                  )
                ],
              )),
            ]
          )


    );
  }
}
