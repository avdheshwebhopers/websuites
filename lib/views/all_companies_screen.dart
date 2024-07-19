import 'package:flutter/material.dart';



import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/all_fonts/all_fonts.dart';


import '../utils/components/app_colors.dart';
import '../utils/components/cards/all_companies_screen_card/all_companies_screen_card.dart';
import '../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../view_models/controllers/save_token/save_token.dart';

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
      backgroundColor: AllColors.whiteColor,

      drawer: CustomDrawer(
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
                  
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),
                  AllCompaniesScreenCard(title: 'Eras International'),

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
                  color: AllColors.blackColor,
                  fontSize: 16,
                  fontFamily: AllFonts.nunitoRegular,
                  fontWeight: FontWeight.w700
              ),),

              Spacer(),

              Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
              SizedBox(width: 5,),
              Text('Filter', style: TextStyle(
                  color: AllColors.lightGrey,
                  fontWeight: FontWeight.w400,
                  fontFamily: AllFonts.nunitoRegular,
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
