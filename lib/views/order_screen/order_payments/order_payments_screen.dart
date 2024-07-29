import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/login.dart';
import 'package:websuites/resources/icon_strings/icon_strings.dart';
import 'package:websuites/utils/components/widgets/nav_bar/custom_navBar.dart';
import 'package:websuites/utils/components/widgets/nav_bar/floating_action_button/floating_action_button.dart';
import 'package:websuites/view_models/save_token/save_token.dart';
  
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';


class OrderPaymentsScreen extends StatefulWidget {
  const OrderPaymentsScreen({super.key});

  
  @override
  State<OrderPaymentsScreen> createState() => _OrderPaymentsScreenState();
}

class _OrderPaymentsScreenState extends State<OrderPaymentsScreen> {
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

      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
          onPressed: (){},
          imageIcon: IconStrings.navSearch3, backgroundColor: AllColors.mediumPurple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'
      ),

      body:
      Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height/30,
                          width: Get.width/3.5,
                          decoration: BoxDecoration(
                              color: AllColors.mediumPurple,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('Total: 27,87,000', style: TextStyle(
                                color: AllColors.whiteColor,
                                fontSize: 12,
                                  
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),

                        Container(
                          height: Get.height/30,
                          width: Get.width/3.5,
                          decoration: BoxDecoration(
                              color: AllColors.textfield2,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('verified: 0', style: TextStyle(
                              color: AllColors.blackColor,
                              fontWeight: FontWeight.w500,
                                
                              fontSize: 12,
                            ),),
                          ),
                        ),

                        Container(
                          height: Get.height/30,
                          width: Get.width/3.5,
                          decoration: BoxDecoration(
                            color: AllColors.textfield2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text('Cancelled: 0', style: TextStyle(
                                color: AllColors.blackColor,
                                fontSize: 12,
                                  
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
              
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/2.8,
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
                        padding: const EdgeInsets.all(15),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Mr.Ahemad', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 12
                                ),),
              
                                SizedBox(width: 10,),
              
                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  decoration: BoxDecoration(
                                    color: AllColors.greenJungleLight,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Paid', style: TextStyle(
                                        color: AllColors.greenJungle,
                                        fontSize: 12,
                                          
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ),

                                Spacer(),
              
                                Text('₹71,890', style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                    
                                  fontSize: 19,
                                ),),
                              ],
                            ),
              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('B&B Life Science LLP', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 19,
                                      
                                    fontWeight: FontWeight.w700
                                ),),
              
                                Icon(Icons.arrow_drop_down_sharp, size: 30,)
                              ],
                            ),
              
                            Row(
                              children: [
                                Text('PRODUCT :', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                      
                                    fontSize: 13
                                ),),
              
                                Text(' Premium 60(Quarterly)', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 12,
                                      
                                    fontWeight: FontWeight.w400
                                ),),
              
                                Spacer(),
              
                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AllColors.lightRed,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Cheque', style: TextStyle(
                                        color: AllColors.vividRed,
                                        fontWeight: FontWeight.w500,
                                          
                                        fontSize: 12
                                    ),),
                                  ),
                                )
                              ],
                            ),
              
                            const Divider(
                              thickness: 0.4,
                            ),
              
                            Text('DIVISION', style: TextStyle(
                              color: AllColors.blackColor,
                              fontSize: 13,
                                
                              fontWeight: FontWeight.w600,
                            ),),
              
                            Row(
                              children: [
                                Container(
              
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color:AllColors.greenJungleLight,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Pharmahopers', style: TextStyle(
                                        color: AllColors.greenJungle,
                                        fontWeight: FontWeight.w500,
                                          
                                        fontSize: 12
                                    ),),
                                  ),
                                ),
              
                                SizedBox(width: 10,),
              
                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: AllColors.greenJungleLight,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child: Text('Webhopers.Pvt.Ltd.', style: TextStyle(
                                        color: AllColors.greenJungle,
                                        fontSize: 12,
                                          
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
              
                            Row(
              
                              children: [
                                Text('CREATED BY', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                      
                                    fontSize: 13
                                ),),
              
                                Spacer(),
              
                                Text('REMARK', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 13,
                                      
                                    fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
              
                            Row(
                              children: [
                                Container(
                                  height: Get.height/40,
                                  width: Get.width/4,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Nitin Sharma', style: TextStyle(
                                        color: AllColors.mediumPurple,
                                        fontWeight: FontWeight.w500,
                                          
                                        fontSize: 12
                                    ),),
                                  ),
                                ),
              
                                Spacer(),
              
                                Text('Premium 60(Quarterly) renewal', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 12,
                                      
                                    fontWeight: FontWeight.w400
                                ),)
                              ],
                            ),
                            SizedBox(height: 10,),
              
                            Row(
                              children: [
                                Text('ORDER ID -', style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                    
                                  fontSize: 13,
                                ),),
              
                                Text('#003870', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 13,
                                      
                                    fontWeight: FontWeight.w400
                                ),),
              
                                Spacer(),
              
                                Text('PAYMENT -', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                      
                                    fontSize: 13
                                ),),
              
                                Text(' Fresh', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 13,
                                      
                                    fontWeight: FontWeight.w400
                                ),)
                              ],
                            ),
                            SizedBox(height: 10,),
              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('TXNID/CHEQUE NO', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                      
                                    fontSize: 13
                                ),),
              
                                Text('PAID ON', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontSize: 13,
                                      
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
              
              
                            Row(
                              children: [
                                Text('DOC', style: TextStyle(
                                  color: AllColors.grey,
                                  fontWeight: FontWeight.w400,
                                    
                                  fontSize: 12,
                                ),),

                                SizedBox(width: 5,),

                                Icon(Icons.autorenew, size: 18, color: AllColors.mediumPurple,),
                                Spacer(),
                                Text('June 25, 2024, 10:47 AM', style: TextStyle(
                                    color: AllColors.grey,
                                    fontSize: 13,
                                      
                                    fontWeight: FontWeight.w400
                                ),),
                              ],
                            )
              
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/5.5,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AllColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
              
                          children: [
                            Row(
                              children: [
                                Text('Mr.Arindam Gupta', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 13
                                ),),
                                SizedBox(width: 10,),
              
                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AllColors.lightYellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Pending', style: TextStyle(
                                        color: AllColors.darkYellow,
                                        fontSize: 13,
                                          
                                      fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                ),
                                Spacer(),
              
                                Text('₹54,168', style: TextStyle(
                                    color: AllColors.blackColor,
                                      
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Zoic Life Science', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                      
                                ),),
              
                                Icon(Icons.arrow_drop_down_sharp, size: 25,),
                              ],
                            ),
              
                            Text('Product : Starter(Yearly)', style: TextStyle(
                                color: AllColors.grey,
                                  
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),
                            
                            const Divider(
                              thickness: 0.4,
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Get.height/40,
                                  width: Get.width/3.5,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Ashish Mohan', style: TextStyle(
                                        color: AllColors.mediumPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),
              
                                Text('#003859', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                      
                                ),)
              
              
                              ],
                            )
              
              
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/5.5,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AllColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text('Mr.Arindam Gupta', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 14
                                ),),
                                SizedBox(width: 10,),

                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AllColors.lightYellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Pending', style: TextStyle(
                                        color: AllColors.darkYellow,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),
                                Spacer(),

                                Text('₹54,168', style: TextStyle(
                                    color: AllColors.blackColor,
                                      
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Zoic Life Science', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                      
                                ),),

                                Icon(Icons.arrow_drop_down_sharp, size: 25,),
                              ],
                            ),

                            Text('Product : Starter(Yearly)', style: TextStyle(
                                color: AllColors.grey,
                                  
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),

                            Divider(
                              thickness: 0.4,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Get.height/40,
                                  width: Get.width/3.5,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Ashish Mohan', style: TextStyle(
                                        color: AllColors.mediumPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),

                                Text('#003859', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                      
                                ),)


                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/5.5,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AllColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text('Mr.Arindam Gupta', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 14
                                ),),
                                SizedBox(width: 10,),

                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AllColors.lightYellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Pending', style: TextStyle(
                                        color: AllColors.darkYellow,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),
                                Spacer(),

                                Text('₹54,168', style: TextStyle(
                                    color: AllColors.blackColor,
                                      
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Zoic Life Science', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                      
                                ),),

                                Icon(Icons.arrow_drop_down_sharp, size: 25,),
                              ],
                            ),

                            Text('Product : Starter(Yearly)', style: TextStyle(
                                color: AllColors.grey,
                                  
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),

                            Divider(
                              thickness: 0.4,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Get.height/40,
                                  width: Get.width/3.5,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Ashish Mohan', style: TextStyle(
                                        color: AllColors.mediumPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),

                                Text('#003859', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                      
                                ),)


                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: Get.height/5.5,
                      width: Get.width/1,
                      decoration: BoxDecoration(
                          color: AllColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AllColors.blackColor.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text('Mr.Arindam Gupta', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                      
                                    fontSize: 14
                                ),),
                                SizedBox(width: 10,),

                                Container(
                                  height: Get.height/40,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AllColors.lightYellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Pending', style: TextStyle(
                                        color: AllColors.darkYellow,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),
                                Spacer(),

                                Text('₹54,168', style: TextStyle(
                                    color: AllColors.blackColor,
                                      
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Zoic Life Science', style: TextStyle(
                                    color: AllColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                      
                                ),),

                                Icon(Icons.arrow_drop_down_sharp, size: 25,),
                              ],
                            ),

                            Text('Product : Starter(Yearly)', style: TextStyle(
                                color: AllColors.grey,
                                  
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),

                            Divider(
                              thickness: 0.4,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Get.height/40,
                                  width: Get.width/3.5,
                                  decoration: BoxDecoration(
                                    color: AllColors.lighterPurple,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('Ashish Mohan', style: TextStyle(
                                        color: AllColors.mediumPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                          
                                    ),),
                                  ),
                                ),

                                Text('#003859', style: TextStyle(
                                    color: AllColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                      
                                ),)


                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //====================================================================
          //CUSTOM APP BAR

          CustomAppBar(
              child:
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      _globalKey.currentState?.openDrawer();
                    },
                      child: Icon(Icons.menu_sharp, size: 25,)
                  ),
                  SizedBox(width: 10,),

                  Text('Payments', style: TextStyle(
                      color: AllColors.blackColor,
                        
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),

                  Spacer(),

                  Icon(Icons.filter_list_outlined,size: 15, color: AllColors.mediumPurple,),
                  SizedBox(width: 5,),

                  Text('Filter', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AllColors.grey,
                      
                  ),),

                  SizedBox(width: 15,),

                  Container(
                    height: Get.height/30,
                    width: Get.width/13,
                    decoration: BoxDecoration(
                        color: AllColors.mediumPurple,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Icon(Icons.upload, size: 20, color: AllColors.whiteColor,),
                  )
                ],
              ),
          )
        ],
      ),
    );
  }
}
