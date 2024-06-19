import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Resources/Assets/app_images.dart';
import '../../../Resources/components/app_colors.dart';
import '../../../resources/Assets/app_fonts.dart';
import '../../../resources/components/Cards/app_cards_1.dart';
import '../../../resources/components/Cards/app_cards_2.dart';
import '../../../resources/components/Cards/app_cards_3.dart';
import '../../../resources/components/Containers/app_row_container1.dart';
import '../../../resources/components/Containers/app_row_container2.dart';
import '../../../resources/components/List_TIles/custom_list_tile.dart';
import '../../../resources/components/generic_button.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        // appBar:
        // AppBar(
        //   backgroundColor: App_Colors.whiteColor,
        // ),
        backgroundColor: Colors.white,
        //   drawer: Container(
        //   color: App_Colors.whiteColor,
        //     width: Get.width/2,
        //     height: Get.height*1,
        //     child: Drawer(
        //       backgroundColor: App_Colors.whiteColor,
        //       child:
        //       ListView(
        //         children: [
        //           Container(
        //             padding: EdgeInsets.only(left: 13),
        //             height: Get.height/9,
        //             child: Row(
        //
        //               children: [
        //                 Container(
        //                   height: Get.height/10,
        //                   width: Get.width/10,
        //                   decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: App_Colors.whiteColor,
        //                   ),
        //                   child: Center(
        //                       child: Image.asset(AppImages.Splash_WHLogo )),
        //                 ),
        //                 SizedBox(width:Get.width/40,),
        //
        //                 const Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //
        //                   children: [
        //                     Text('Sunil Kumar',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w500,
        //                         fontSize: 16,
        //                         fontFamily: AppFonts.nunitoRegular,
        //
        //                       ),),
        //                     Text('+91-8810529887',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 10,
        //                         fontFamily: AppFonts.nunitoRegular,
        //                         color: Colors.grey
        //                       ),),
        //                   ],
        //                 )
        //               ],),
        //           ),
        //
        //           Column(
        //             children: [
        //               CustomListTile(
        //                   icon: Icons.dashboard,
        //                   title: 'Dashboard',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.leaderboard,
        //                   title: 'Lead',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.person,
        //                   title: 'Customer',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.shopping_bag,
        //                   title: 'Orders',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.group,
        //                   title: 'HRM',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.analytics,
        //                   title: 'Analytics',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.dashboard,
        //                   title: 'Campaign',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.bar_chart,
        //                   title: 'Sales',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.person_2,
        //                   title: 'Roles',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.verified_user,
        //                   title: 'Users',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.add_task,
        //                   title: 'Tasks',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.data_object,
        //                   title: 'Projects',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.location_city_sharp,
        //                   title: 'Service Area',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.shopping_bag,
        //                   title: 'Products',
        //                   onTap: (){}
        //               ),
        //               CustomListTile(
        //                   icon: Icons.grade,
        //                   title: 'Master',
        //                   onTap: (){}
        //               ),
        //             ],
        //           ),
        //
        //           SizedBox(height: 100,),
        //
        //           Divider(
        //             thickness: 1,
        //             indent: 20,
        //             endIndent: 20,
        //
        //           ),
        //
        //           Container(
        //             height: Get.height/20,
        //             width: Get.width/2,
        //             padding: EdgeInsets.only(left: 20),
        //
        //             child: Text('version 1.0.12',
        //             style: TextStyle(
        //               fontWeight: FontWeight.w300,
        //               fontFamily: AppFonts.nunitoRegular,
        //               fontSize: 10,
        //               color: App_Colors.grey
        //             ),)
        //           ),
        //
        //           Container(
        //             margin: EdgeInsets.only(left: 20, right: 20),
        //             child: GenericButton(
        //               height: Get.height/30,
        //                 width: Get.width/4,
        //                 title: 'Logout',
        //                 onPress: (){}
        //             ),
        //           )
        //
        //         ],
        //       ),
        //     )
        // ),
        body:
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                      color: AppColors.whiteColor,
                      width: Get.width/2,
                      height: Get.height*1,
                      child: Drawer(
                        backgroundColor: AppColors.whiteColor,
                        child:
                        ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 13),
                              height: Get.height/9,
                              child: Row(

                                children: [
                                  Container(
                                    height: Get.height/15,
                                    width: Get.width/15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Center(
                                        child: Image.asset(AppImages.Splash_WHLogo )),
                                  ),
                                  SizedBox(width:Get.width/40,),

                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text('Sunil Kumar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppFonts.nunitoRegular,

                                        ),),
                                      Text('+91-8810529887',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            fontFamily: AppFonts.nunitoRegular,
                                            color: Colors.grey
                                        ),),
                                    ],
                                  )
                                ],),
                            ),

                            Column(
                              children: [
                                CustomListTile(
                                    icon: Icons.dashboard,
                                    title: 'Dashboard',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.leaderboard,
                                    title: 'Lead',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.person,
                                    title: 'Customer',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.shopping_bag,
                                    title: 'Orders',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.group,
                                    title: 'HRM',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.analytics,
                                    title: 'Analytics',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.dashboard,
                                    title: 'Campaign',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.bar_chart,
                                    title: 'Sales',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.person_2,
                                    title: 'Roles',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.verified_user,
                                    title: 'Users',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.add_task,
                                    title: 'Tasks',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.data_object,
                                    title: 'Projects',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.location_city_sharp,
                                    title: 'Service Area',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.shopping_bag,
                                    title: 'Products',
                                    onTap: (){}
                                ),
                                CustomListTile(
                                    icon: Icons.grade,
                                    title: 'Master',
                                    onTap: (){}
                                ),
                              ],
                            ),

                            const SizedBox(height: 100,),

                            const Divider(
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,

                            ),

                            Container(
                                height: Get.height/20,
                                width: Get.width/2,
                                padding: const EdgeInsets.only(left: 20),

                                child: Text('version 1.0.12',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 10,
                                      color: AppColors.grey
                                  ),)
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              child: GenericButton(
                                  height: Get.height/30,
                                  width: Get.width/4,
                                  title: 'Logout',
                                  onPress: (){}
                              ),
                            )

                          ],
                        ),
                      )
                  )
                ],
              ),
            ),

            const SizedBox(width: 10,),

            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              height: Get.height*1,
              width: 0.1,
              color: AppColors.lightGrey,
            ),

            const SizedBox(width: 10,),


            Expanded(
              flex: 2,
              child:
              SingleChildScrollView(
                child:
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: Get.mediaQuery.size.height/5.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors:[
                                AppColors.appBarColorTop,
                                AppColors.appBarColorBottom,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2,),

                        SizedBox(
                          height: Get.height/3.85,
                          child:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // App Bar
                                Container(
                                  margin: const EdgeInsets.only(bottom: 40, top: 43),
                                  // color: Colors.blue,
                                  padding: const EdgeInsets.only(left: 6,right: 6),


                                  child:
                                  Container(
                                    // color: Colors.grey,
                                    margin: const EdgeInsets.only(right: 12,),
                                    child:
                                    Row(
                                      children: [
                                        const SizedBox(width: 6),

                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   crossAxisAlignment: CrossAxisAlignment.start,
                                        //   children: [
                                        //     Text('Hello, Sunil!', style: TextStyle(
                                        //       fontWeight: FontWeight.w600,
                                        //       fontSize: 18,
                                        //       fontFamily: AppFonts.nunitoRegular,
                                        //       color: App_Colors.whiteColor,
                                        //     ),),
                                        //
                                        //     Text('24 May, 2024',
                                        //       style: TextStyle(
                                        //         fontWeight: FontWeight.w400,
                                        //         fontSize: 10,
                                        //         fontFamily: AppFonts.nunitoRegular,
                                        //         color: App_Colors.whiteColor,
                                        //       ),),
                                        //
                                        //
                                        //   ],
                                        // ),

                                        const Spacer(),

                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.whiteColor,
                                          ),
                                          height: Get.height/13,
                                          width: Get.width/13,
                                          child: Center(
                                              child:
                                              Image.asset(AppImages.WelcomeCompanyLogo, scale: 7,)
                                          ),
                                        ),
                                        // IconButton(onPressed: (){},
                                        //     icon: Icon(Icons.circle,
                                        //       color: Colors.white,
                                        //       size: 45,)
                                        // )
                                      ],
                                    ),
                                  ),
                                ),


                                Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, ),
                                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                    child:
                                    Row(                                                    //SCROLLER ROW WITH CONTAINERS
                                      children: [
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        AppRowContainerOne(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AppColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),],
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),


                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 8,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.list_alt_outlined, size: 25,),

                          const SizedBox(width: 10,),

                          Text('TASK PERFORMANCE',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Text('24 May, 2024',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w300,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Icon(Icons.arrow_drop_down, size: 40,)

                        ],
                      ),
                    ), // ROW BAR

                    const SizedBox(height: 8,),

                    Container(
                        margin: const EdgeInsets.only(right: 12, left: 6),
                        height: Get.height/5,
                        width: Get.width/1.05,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.06),
                              spreadRadius: 0.5,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child:
                              Card(
                                elevation: 18,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0), // Half of the width/height to make it a circle
                                ),

                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle,
                                    boxShadow:[
                                      BoxShadow(
                                        color: AppColors.vividPurple.withOpacity(0.10),
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child:
                                  CircularPercentIndicator(
                                    progressColor: AppColors.mediumPurple,
                                    backgroundColor: AppColors.lighterPurple,
                                    lineWidth: 15,
                                    radius: 95,
                                    percent: 0.4,
                                    startAngle: 0,
                                    animation: true,
                                    animationDuration: 2000,
                                    // backgroundWidth: 30,
                                    curve: Curves.decelerate,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Container(

                                      height: Get.height/10,
                                      width: Get.width/5,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle,
                                        boxShadow:[
                                          BoxShadow(
                                            color: AppColors.vividPurple.withOpacity(0.04),
                                            spreadRadius: 10,
                                            blurRadius: 3,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: const
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('COMPLETED',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppFonts.nunitoRegular,
                                              fontSize: 15,
                                            ),),

                                          // SizedBox(height: 5,),

                                          Text('65%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: AppFonts.nunitoRegular,
                                              fontSize: 20,
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                            ),


                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('TASK PROGRESS',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w600,
                                  ),),

                                Row(
                                  children: [
                                    Text('06:06:15/',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontWeight: FontWeight.w600,
                                      ),),

                                    SizedBox(width: 5,),

                                    Text('4hrs',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff5131ff),
                                      ),),


                                  ],
                                ),
                              ],
                            )

                          ],
                        )
                    ),

                    const SizedBox(height:40,),

                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 12,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.list_alt_outlined, size: 25,),

                          const SizedBox(width: 8,),

                          Text(' LATEST TASK ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                color: AppColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.vividPurple,)
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),


                    AppCardOne(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AppColors.vividPink,
                        statusBackgroundColor: AppColors.lightPink,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    AppCardOne(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AppColors.darkGreen,
                        statusBackgroundColor: AppColors.lightGreen,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    AppCardOne(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AppColors.darkBlue,
                        statusBackgroundColor: AppColors.lightBlue,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    AppCardOne(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AppColors.darkRed,
                        statusBackgroundColor: AppColors.lightRed,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    AppCardOne(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AppColors.darkYellow,
                        statusBackgroundColor: AppColors.lightYellow,
                        statusText: 'In Progress'),
                    SizedBox(height: 18,),






                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 8,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.list_alt_outlined, size: 25,),

                          const SizedBox(width: 10,),

                          Text('LEAD TYPE COUNT',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Text('21 May',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w300,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Icon(Icons.arrow_drop_down, size: 40,)
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4 ),
                      child:
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child:
                        Row(                                                    //SCROLLER ROW WITH CONTAINERS
                          children: [

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.access_time,
                                iconColor: AppColors.vividPink,
                                containerColor: AppColors.lightPink),

                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.task,
                                iconColor: AppColors.skyBlue,
                                containerColor: AppColors.lightBlue),
                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.account_balance_rounded,
                                iconColor: AppColors.grassGreen,
                                containerColor: AppColors.lightGreen),
                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.timelapse,
                                iconColor: AppColors.mediumPurple,
                                containerColor: AppColors.lighterPurple),
                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.place,
                                iconColor: AppColors.darkRed,
                                containerColor: AppColors.lightRed),
                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.policy,
                                iconColor: AppColors.darkYellow,
                                containerColor: AppColors.lightYellow),
                            const SizedBox(width: 10,),

                            AppRowContainerTwo(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AppColors.grey,
                                statusColor: AppColors.blackColor,
                                icon: Icons.title,
                                iconColor: AppColors.darkGreen,
                                containerColor: AppColors.lightGreen),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),



                    const SizedBox(height: 10,),

                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 12,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.list_alt_outlined, size: 25,),

                          const SizedBox(width: 10,),

                          Text(' LATEST CUSTOMER ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                color: AppColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.vividPurple,)
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    AppCardsTwo(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AppColors.lightPink,
                      circleColorTwo: AppColors.lighterPurple,
                      circleTextColorTwo: AppColors.mediumPurple,
                      circleTextColorOne: AppColors.darkPink,),
                    SizedBox(height: 12,),

                    AppCardsTwo(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AppColors.lightPink,
                      circleColorTwo: AppColors.lighterPurple,
                      circleTextColorTwo: AppColors.mediumPurple,
                      circleTextColorOne: AppColors.darkPink,),
                    SizedBox(height: 12,),

                    AppCardsTwo(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AppColors.lightPink,
                      circleColorTwo: AppColors.lighterPurple,
                      circleTextColorTwo: AppColors.mediumPurple,
                      circleTextColorOne: AppColors.darkPink,),
                    SizedBox(height: 12,),

                    AppCardsTwo(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AppColors.lightPink,
                      circleColorTwo: AppColors.lighterPurple,
                      circleTextColorTwo: AppColors.mediumPurple,
                      circleTextColorOne: AppColors.darkPink,),
                    SizedBox(height: 12,),

                    AppCardsTwo(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AppColors.lightPink,
                      circleColorTwo: AppColors.lighterPurple,
                      circleTextColorTwo: AppColors.mediumPurple,
                      circleTextColorOne: AppColors.darkPink,),
                    const SizedBox(height: 10,),




                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 12,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.list_alt_outlined, size: 25,),

                          const SizedBox(width: 10,),

                          Text(' LEAD SOURCE ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Icon(Icons.list, color: AppColors.lightGrey,size: 25,),

                          const SizedBox(width: 10,),

                          Text('List',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w300,
                              color: AppColors.grey,
                            ),
                          ),

                          const SizedBox(width: 10,),

                          Icon(Icons.pie_chart, color: AppColors.skyBlue,size: 15,),

                          const SizedBox(width: 5,),

                          InkWell(
                            onTap: (){},
                            child: Text('Chart',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                color: AppColors.skyBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      height: Get.height/5,
                      width: Get.width/1.05,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45.withOpacity(0.06),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],),
                      child: Center(child: Text('Graph',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.lightGrey),)),
                    ),

                    const SizedBox(height:20,),

                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(left: 10, right: 12,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          const Icon(Icons.money, size: 25,),

                          const SizedBox(width: 8,),

                          Text('TRANSACTIONS ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                color: AppColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.vividPurple,)
                        ],
                      ),
                    ),

                    const SizedBox(height:20,),

                    const AppCardsThree(
                        title: 'Premium 60 Packages Self Done...',
                        name: 'Prakash shah',
                        amount: '₹4000',
                        subtitle: '25 May, 2024 at 12:30 pm'),

                    const AppCardsThree(
                        title: 'Premium 60 Packages Self Done...',
                        name: 'Prakash shah',
                        amount: '₹4000',
                        subtitle: '25 May, 2024 at 12:30 pm'),

                    const AppCardsThree(
                        title: 'Premium 60 Packages Self Done...',
                        name: 'Prakash shah',
                        amount: '₹4000',
                        subtitle: '25 May, 2024 at 12:30 pm'),

                    const AppCardsThree(
                        title: 'Premium 60 Packages Self Done...',
                        name: 'Prakash shah',
                        amount: '₹4000',
                        subtitle: '25 May, 2024 at 12:30 pm'),

                    const AppCardsThree(
                        title: 'Premium 60 Packages Self Done...',
                        name: 'Prakash shah',
                        amount: '₹4000',
                        subtitle: '25 May, 2024 at 12:30 pm'),
                  ],
                ),
              ),
            ),
          ],
        ),



      );

  }
}
