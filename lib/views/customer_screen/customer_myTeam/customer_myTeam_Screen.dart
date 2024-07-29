import 'package:flutter/material.dart';
import '../../../Data/models/Response_model/login.dart';
  
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_10w.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_5w.dart';
import '../../../view_models/save_token/save_token.dart';

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
      backgroundColor: AllColors.whiteColor,

      drawer: CustomDrawer(
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
                            color: AllColors.blackColor,
                              
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                        ),

                        Text('T.Customers', style: TextStyle(
                          color: AllColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                            
                        ),)
                      ],
                    ),

                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Anshuman Khurana', style: TextStyle(
                            color: AllColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                              
                        ),),

                        Text('234', style: TextStyle(
                            color: AllColors.grey,
                              
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
                            color: AllColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                              
                        ),),

                        Text('345', style: TextStyle(
                            color: AllColors.grey,
                              
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
                            color: AllColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                              
                        ),),

                        Text('265', style: TextStyle(
                            color: AllColors.grey,
                              
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
                            color: AllColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                              
                        ),),

                        Text('143', style: TextStyle(
                            color: AllColors.grey,
                              
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
                  SizedBox10w(),
                  Text('My Team' ,style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                      
                  ),),

                  Spacer(),
                  
                  Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
                  SizedBox5w(),
                  Text('Filter', style: TextStyle(
                    color: AllColors.lightGrey,
                      
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
