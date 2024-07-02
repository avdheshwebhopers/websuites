

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/Resources/components/app_colors.dart';

import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/components/Cards/LeadList_screen_card/leadlist_screen_card.dart';
import '../View_model/controllers/save_token/save_token.dart';

// class LeadListScreen extends StatefulWidget {
//   const LeadListScreen({super.key});
//
//   @override
//   State<LeadListScreen> createState() => _LeadListScreenState();
// }
//
// class _LeadListScreenState extends State<LeadListScreen> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: AppColors.whiteColor,
//
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 115,),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     height: Get.height/4.4  ,
//                     width: Get.width/1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.blackColor.withOpacity(0.1),
//                           // spreadRadius: 0,
//                           blurRadius: 10,
//                           offset: const Offset(0, 0),
//                         )
//                       ],
//                       color: AppColors.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sanjay Kumar', style: TextStyle(
//                               fontFamily: AppFonts.nunitoRegular,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.grey
//                           ),),
//
//                           Text('Prelims Pharma Private limited', style: TextStyle(
//                               color: AppColors.welcomeColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 22,
//                               fontFamily: AppFonts.nunitoRegular
//                           ),),
//
//                           Row(
//                             children: [
//                               Icon(Icons.calendar_month_rounded, size: 17,color: AppColors.mediumPurple,),
//
//                               SizedBox(width: 5,),
//                               Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
//                                 color: AppColors.mediumPurple,
//                                 fontFamily: AppFonts.nunitoRegular,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),),
//
//                               Spacer(),
//
//                               Row(
//                                 children: [
//                                   Icon(Icons.language, size: 17, color: AppColors.grey,),
//
//                                   SizedBox(width: 5,),
//
//                                   Text('Google', style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       fontFamily: AppFonts.nunitoRegular
//
//                                   ),)
//                                 ],
//                               )
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Icon(Icons.call_rounded, size: 17, color: AppColors.grey,),
//
//                               Text('+91-9999334481', style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400
//                               ),),
//
//                               Spacer(),
//
//
//                               Container(
//                                 height: Get.height/40,
//                                 width: Get.width/4,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lighterPurple,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Center(
//                                   child: Text('Manish Jain', style: TextStyle(
//                                       color: AppColors.mediumPurple,
//                                       fontFamily: AppFonts.nunitoRegular,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12
//                                   ),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Divider(
//                             thickness: 0.17,
//                             color: AppColors.grey,
//                           ),
//
//                           Container(
//                             height: Get.height/40,
//                             width: Get.width/3,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightBlue,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Text('Pharma Hopers', style: TextStyle(
//                                   color: AppColors.skyBlue,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 12
//
//                               ),),
//                             ),
//                           )
//
//
//
//
//
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     height: Get.height/4.4  ,
//                     width: Get.width/1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.blackColor.withOpacity(0.1),
//                           // spreadRadius: 0,
//                           blurRadius: 10,
//                           offset: const Offset(0, 0),
//                         )
//                       ],
//                       color: AppColors.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sanjay Kumar', style: TextStyle(
//                               fontFamily: AppFonts.nunitoRegular,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.grey
//                           ),),
//
//                           Text('Prelims Pharma Private limited', style: TextStyle(
//                               color: AppColors.welcomeColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 22,
//                               fontFamily: AppFonts.nunitoRegular
//                           ),),
//
//                           Row(
//                             children: [
//                               Icon(Icons.calendar_month_rounded, size: 17,color: AppColors.mediumPurple,),
//
//                               SizedBox(width: 5,),
//                               Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
//                                 color: AppColors.mediumPurple,
//                                 fontFamily: AppFonts.nunitoRegular,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),),
//
//                               Spacer(),
//
//                               Row(
//                                 children: [
//                                   Icon(Icons.language, size: 17, color: AppColors.grey,),
//
//                                   SizedBox(width: 5,),
//
//                                   Text('Google', style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       fontFamily: AppFonts.nunitoRegular
//
//                                   ),)
//                                 ],
//                               )
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Icon(Icons.call_rounded, size: 17, color: AppColors.grey,),
//
//                               Text('+91-9999334481', style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400
//                               ),),
//
//                               Spacer(),
//
//
//                               Container(
//                                 height: Get.height/40,
//                                 width: Get.width/4,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lighterPurple,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Center(
//                                   child: Text('Manish Jain', style: TextStyle(
//                                       color: AppColors.mediumPurple,
//                                       fontFamily: AppFonts.nunitoRegular,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12
//                                   ),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Divider(
//                             thickness: 0.17,
//                             color: AppColors.grey,
//                           ),
//
//                           Container(
//                             height: Get.height/40,
//                             width: Get.width/3,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightBlue,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Text('Pharma Hopers', style: TextStyle(
//                                   color: AppColors.skyBlue,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 12
//
//                               ),),
//                             ),
//                           )
//
//
//
//
//
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     height: Get.height/4.4  ,
//                     width: Get.width/1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.blackColor.withOpacity(0.1),
//                           // spreadRadius: 0,
//                           blurRadius: 10,
//                           offset: const Offset(0, 0),
//                         )
//                       ],
//                       color: AppColors.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sanjay Kumar', style: TextStyle(
//                               fontFamily: AppFonts.nunitoRegular,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.grey
//                           ),),
//
//                           Text('Prelims Pharma Private limited', style: TextStyle(
//                               color: AppColors.welcomeColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 22,
//                               fontFamily: AppFonts.nunitoRegular
//                           ),),
//
//                           Row(
//                             children: [
//                               Icon(Icons.calendar_month_rounded, size: 17,color: AppColors.mediumPurple,),
//
//                               SizedBox(width: 5,),
//                               Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
//                                 color: AppColors.mediumPurple,
//                                 fontFamily: AppFonts.nunitoRegular,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),),
//
//                               Spacer(),
//
//                               Row(
//                                 children: [
//                                   Icon(Icons.language, size: 17, color: AppColors.grey,),
//
//                                   SizedBox(width: 5,),
//
//                                   Text('Google', style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       fontFamily: AppFonts.nunitoRegular
//
//                                   ),)
//                                 ],
//                               )
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Icon(Icons.call_rounded, size: 17, color: AppColors.grey,),
//
//                               Text('+91-9999334481', style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400
//                               ),),
//
//                               Spacer(),
//
//
//                               Container(
//                                 height: Get.height/40,
//                                 width: Get.width/4,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lighterPurple,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Center(
//                                   child: Text('Manish Jain', style: TextStyle(
//                                       color: AppColors.mediumPurple,
//                                       fontFamily: AppFonts.nunitoRegular,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12
//                                   ),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Divider(
//                             thickness: 0.17,
//                             color: AppColors.grey,
//                           ),
//
//                           Container(
//                             height: Get.height/40,
//                             width: Get.width/3,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightBlue,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Text('Pharma Hopers', style: TextStyle(
//                                   color: AppColors.skyBlue,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 12
//
//                               ),),
//                             ),
//                           )
//
//
//
//
//
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     height: Get.height/4.4  ,
//                     width: Get.width/1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.blackColor.withOpacity(0.1),
//                           // spreadRadius: 0,
//                           blurRadius: 10,
//                           offset: const Offset(0, 0),
//                         )
//                       ],
//                       color: AppColors.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sanjay Kumar', style: TextStyle(
//                               fontFamily: AppFonts.nunitoRegular,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.grey
//                           ),),
//
//                           Text('Prelims Pharma Private limited', style: TextStyle(
//                               color: AppColors.welcomeColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 22,
//                               fontFamily: AppFonts.nunitoRegular
//                           ),),
//
//                           Row(
//                             children: [
//                               Icon(Icons.calendar_month_rounded, size: 17,color: AppColors.mediumPurple,),
//
//                               SizedBox(width: 5,),
//                               Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
//                                 color: AppColors.mediumPurple,
//                                 fontFamily: AppFonts.nunitoRegular,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),),
//
//                               Spacer(),
//
//                               Row(
//                                 children: [
//                                   Icon(Icons.language, size: 17, color: AppColors.grey,),
//
//                                   SizedBox(width: 5,),
//
//                                   Text('Google', style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       fontFamily: AppFonts.nunitoRegular
//
//                                   ),)
//                                 ],
//                               )
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Icon(Icons.call_rounded, size: 17, color: AppColors.grey,),
//
//                               Text('+91-9999334481', style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400
//                               ),),
//
//                               Spacer(),
//
//
//                               Container(
//                                 height: Get.height/40,
//                                 width: Get.width/4,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lighterPurple,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Center(
//                                   child: Text('Manish Jain', style: TextStyle(
//                                       color: AppColors.mediumPurple,
//                                       fontFamily: AppFonts.nunitoRegular,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12
//                                   ),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Divider(
//                             thickness: 0.17,
//                             color: AppColors.grey,
//                           ),
//
//                           Container(
//                             height: Get.height/40,
//                             width: Get.width/3,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightBlue,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Text('Pharma Hopers', style: TextStyle(
//                                   color: AppColors.skyBlue,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 12
//
//                               ),),
//                             ),
//                           )
//
//
//
//
//
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     height: Get.height/4.4  ,
//                     width: Get.width/1,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.blackColor.withOpacity(0.1),
//                           // spreadRadius: 0,
//                           blurRadius: 10,
//                           offset: const Offset(0, 0),
//                         )
//                       ],
//                       color: AppColors.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sanjay Kumar', style: TextStyle(
//                               fontFamily: AppFonts.nunitoRegular,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.grey
//                           ),),
//
//                           Text('Prelims Pharma Private limited', style: TextStyle(
//                               color: AppColors.welcomeColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 22,
//                               fontFamily: AppFonts.nunitoRegular
//                           ),),
//
//                           Row(
//                             children: [
//                               Icon(Icons.calendar_month_rounded, size: 17,color: AppColors.mediumPurple,),
//
//                               SizedBox(width: 5,),
//                               Text('Mon, 03 June 2024 at 12:29 pm', style: TextStyle(
//                                 color: AppColors.mediumPurple,
//                                 fontFamily: AppFonts.nunitoRegular,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,
//                               ),),
//
//                               Spacer(),
//
//                               Row(
//                                 children: [
//                                   Icon(Icons.language, size: 17, color: AppColors.grey,),
//
//                                   SizedBox(width: 5,),
//
//                                   Text('Google', style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13,
//                                       fontFamily: AppFonts.nunitoRegular
//
//                                   ),)
//                                 ],
//                               )
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Icon(Icons.call_rounded, size: 17, color: AppColors.grey,),
//
//                               Text('+91-9999334481', style: TextStyle(
//                                   color: AppColors.grey,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400
//                               ),),
//
//                               Spacer(),
//
//
//                               Container(
//                                 height: Get.height/40,
//                                 width: Get.width/4,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lighterPurple,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Center(
//                                   child: Text('Manish Jain', style: TextStyle(
//                                       color: AppColors.mediumPurple,
//                                       fontFamily: AppFonts.nunitoRegular,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12
//                                   ),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           Divider(
//                             thickness: 0.17,
//                             color: AppColors.grey,
//                           ),
//
//                           Container(
//                             height: Get.height/40,
//                             width: Get.width/3,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightBlue,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Text('Pharma Hopers', style: TextStyle(
//                                   color: AppColors.skyBlue,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: AppFonts.nunitoRegular,
//                                   fontSize: 12
//
//                               ),),
//                             ),
//                           )
//
//
//
//
//
//
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15),
//             height: Get.height/8,
//             width: Get.width/1,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.blackColor.withOpacity(0.1) ,
//                   offset: Offset(0, 4),
//                   spreadRadius: 1,
//                   blurRadius: 10
//                 )
//               ],
//               color: AppColors.whiteColor,
//             ),
//             child:
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Row(
//                 children: [
//                   Icon(Icons.menu, size: 25, color: AppColors.blackColor,),
//
//                   SizedBox(width: 15,),
//
//                   Text('Lead List',style: TextStyle(
//                     color: AppColors.blackColor,
//                     fontFamily: AppFonts.nunitoRegular,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20
//                   ),),
//
//                   Spacer(),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(Icons.filter_list_outlined, size: 20, color: AppColors.lightGrey,),
//                       SizedBox(width: 5,),
//
//                       Text('Filter',
//                       style: TextStyle(
//                         color: AppColors.lightGrey,
//                         fontSize: 15,
//                         fontFamily: AppFonts.nunitoRegular,
//                       ),),
//
//                       SizedBox(width: 10,),
//
//                       Text('Last week', style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontFamily: AppFonts.nunitoRegular,
//                         fontSize: 15,
//                       ),),
//
//                       Icon(Icons.arrow_drop_down, size: 37,)
//                     ],
//                   )
//
//
//
//                 ],
//               ),
//             ),
//           )
//         ],
//       )
//
//
//
//     );
//   }
// }


class LeadListScreen extends StatefulWidget {
  const LeadListScreen({super.key});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  final GlobalKey <ScaffoldState> _globalKey =  GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();


  String? userName = '';
  String? userEmail = "";

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.search, size: 27, color: AppColors.whiteColor,),
          backgroundColor: AppColors.vividPurple,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _globalKey,
        backgroundColor: AppColors.whiteColor,

        drawer: Container(
            color: AppColors.whiteColor,
            width: Get.width/1.8,
            height: Get.height*1,
            child :AppDrawer(
                userName: '$userName',
                phoneNumber: '$userEmail',
                version: '1.0.12')),

        body:
        Stack(
          children: [
            const SingleChildScrollView(
              child:
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 109,),

                    Leadlist_screen_card(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),

                    Leadlist_screen_card(
                        title: 'Lokesh Kumar',
                        companyName: 'Biophar Pharma'),

                    Leadlist_screen_card(
                        title: 'Rahul Choudhary',
                        companyName: 'Tata Pharma'),

                    Leadlist_screen_card(
                        title: 'Sanjay Kumar',
                        companyName: 'Prelims Pharma Private Limited'),

                    Leadlist_screen_card(
                        title: 'Mukesh',
                        companyName: 'Prelims Pharma Private Limited'),

                  ],
                ),
              ),
            ),


            //==================================================================
            //Custom App Bar

            Container(
              height: Get.height/7.8,
              width: Get.width/1,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.06),
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 60),
                child: Row(
                  children: [

                    InkWell(
                        onTap: (){
                          _globalKey.currentState?.openDrawer();
                        },
                        child: Icon(Icons.menu_sharp, size: 25,)),

                    SizedBox(width: 10,),

                    Text('Lead list', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize:17,
                        color: AppColors.blackColor
                    ),),

                    Spacer(),

                    Row(
                      children: [
                        Icon(Icons.filter_list_outlined, color: AppColors.lightGrey, size: 17),
                        SizedBox(width: 5,),
                        Text('Filter', style: TextStyle(fontSize: 14,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey),),

                        SizedBox(width: 10,),

                        Text('Last Week', style: TextStyle(
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor
                        ),),

                        Icon(Icons.arrow_drop_down, size: 34, )

                      ],
                    )
                  ],
                ),
              ),
            ),


          ],
        )
    );
  }
}
