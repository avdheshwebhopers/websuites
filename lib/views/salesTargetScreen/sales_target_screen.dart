import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/salesTargetScreen/widgets/sales_target_card.dart';
import '../../controler/viewModels/saveToken/save_token.dart';
import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../../resources/iconStrings/icon_strings.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../utils/responsive/bodies/Responsive.dart';


class SalesTargetScreen extends StatefulWidget {
  const SalesTargetScreen({super.key});

  @override
  State<SalesTargetScreen> createState() => _SalesTargetScreenState();
}

class _SalesTargetScreenState extends State<SalesTargetScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
final ScreenController _screenController = Get.put(ScreenController());
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
      // bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
          onPressed: (){},
          imageIcon: IconStrings.navSearch3,
          backgroundColor: AllColors.mediumPurple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // drawer: CustomDrawer(
      //     userName: userName,
      //     phoneNumber: userEmail,
      //     version: '1.0.12',
      //
      //   onTap: (index) {
      //     _screenController.updateIndex(index);
      //     if (ResponsiveUtils.isMobile(context)) {
      //       _globalKey.currentState?.closeDrawer();
      //     }
      //   },
      //
      // ),
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
