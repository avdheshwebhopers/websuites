import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/customer_screen/customer_activationList/widgets/customer_activation_list_screen_card/customer_activation_list_screen_card.dart';
import '../../../data/models/responseModels/login.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_10w.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_5w.dart';
import '../../../view_models/save_token/save_token.dart';

class CustomerActivationListScreen extends StatefulWidget {
  const CustomerActivationListScreen({super.key});

  @override
  State<CustomerActivationListScreen> createState() => _CustomerActivationListScreenState();
}

class _CustomerActivationListScreenState extends State<CustomerActivationListScreen> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
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
      backgroundColor: AllColors.whiteColor,
      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),

      body:
          Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 135),
                      CustomerActivationListCard(title: 'RealNova Healthcare'),
                      CustomerActivationListCard(title: 'RealNova Healthcare'),
                      CustomerActivationListCard(title: 'RealNova Healthcare'),


                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: Get.height/6,
                        width: Get.width/1,
                        decoration: BoxDecoration(
                            color: AllColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AllColors.blackColor.withOpacity(0.06),
                                spreadRadius: 2,
                                blurRadius: 4,
                              )
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                            children: [
                              Row(
                                children: [
                                  Text('Pharmahopers', style: TextStyle(
                                      color: AllColors.lightGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                        
                                  ),),
                                  Spacer(),
                
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    height: Get.height/40,
                                    decoration: BoxDecoration(
                                      color: AllColors.lightBlue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('View', style: TextStyle(
                                        color: AllColors.darkBlue,
                
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                
                              Text('RealNova Healthcare', style: TextStyle(
                                  color: AllColors.welcomeColor,
                                    
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),),
                
                              Row(children: [
                                Icon(Icons.calendar_month_outlined, size: 14, color: AllColors.mediumPurple,),
                                SizedBox5w(),
                                Text('Wed, June 26, 2024 at 11:08 AM', style: TextStyle(
                                    color: AllColors.mediumPurple,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                      
                                ),
                                ),
                              ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: Get.height/40,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AllColors.lighterOrange,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Approval Date', style: TextStyle(
                                          color: AllColors.vividOrange,
                                          fontSize: 12,
                                            
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ),
                                  ),
                                  SizedBox10w(),
                
                                  Text('Invalid Date', style: TextStyle(
                                    color: AllColors.lightGrey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 12,
                                  ),),

                                  Spacer(),

                                  Container(
                                    height: Get.height/40,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AllColors.lighterPurple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text('Roshan jha', style: TextStyle(
                                          color: AllColors.mediumPurple,
                                          fontSize: 12,
                                            
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),// Another type
                      CustomerActivationListCard(title: 'RealNova Healthcare'),
                      CustomerActivationListCard(title: 'RealNova Healthcare'),
                    ],
                  ),
                ),
              ),

              //================================================================
              // CUSTOM APP BAR

              CustomAppBar(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            _globalKey.currentState?.openDrawer();
                          },
                          child: Icon(Icons.menu_sharp, size: 25,)),
                      SizedBox10w(),
                      Text('Activation List', style: TextStyle(
                          
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: AllColors.blackColor,
                      ),
                      ),

                      Spacer(),
                      
                      Icon(Icons.filter_list_outlined, size: 14, color: AllColors.lightGrey,),
                      SizedBox5w(),
                      Text('Filter', style: TextStyle(
                        color: AllColors.lightGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                          
                      ),),
                    ],
                  ))
            ],
          )


    );
  }
}
