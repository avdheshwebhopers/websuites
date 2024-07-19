import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../Data/models/Response_model/LoginResponseModel.dart';
import '../../../Resources/all_fonts/all_fonts.dart';
import '../../../Resources/all_images/all_images.dart';
import '../../../Resources/all_strings/all_strings.dart';
import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/Utils.dart';
import '../../../utils/components/All_Buttons/common_button.dart';
import '../../../utils/components/List_TIles/custom_list_tile.dart';
import '../../../utils/components/app_colors.dart';
import '../../../utils/components/cards/dashboard_screen_card/latest_customers_card.dart';
import '../../../utils/components/cards/dashboard_screen_card/latest_task_card.dart';
import '../../../utils/components/cards/dashboard_screen_card/transaction_list_card.dart';
import '../../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../../utils/components/dashboard_screen_rows/db_screen_leads_row.dart';
import '../../../utils/components/dashboard_screen_rows/db_screen_revenue_row.dart';
import '../../../view_models/controllers/save_token/save_token.dart';


class MyTabBody extends StatefulWidget {
  const MyTabBody({super.key});

  @override
  State<MyTabBody> createState() => _MyTabBodyState();}

class _MyTabBodyState extends State<MyTabBody> {

  String userName = '';
  String? userEmail = "";
  SaveUserData userPreference = SaveUserData();

  @override
  void initState(){
    super.initState();
    fetchUserData();}

  Future<void> fetchUserData() async {
    try {
      // Fetch token and email from SharedPreferences using SaveToken class
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;// Extract email from response

      setState(() {
        userName = first_name!;
        userEmail = email!;
        // Update userEmail state variable with fetched email
      });
    } catch (e) {
      print('Error fetching userData: $e');
      // Handle error if necessary
    }
  }






  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        backgroundColor: Colors.white,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return portraitMode();
            } else {
              return landscapeMode();
            }
          },
        ),

      );
  }

  Widget portraitMode() {
    return
      Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child:
            SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      color: AllColors.whiteColor,
                      width: Get.width / 2,
                      height: Get.height * 1,
                      child: AppTabDrawer(
                          userName: '$userName',
                          phoneNumber: '$userEmail',
                          version: '1.0.12')
                      // Drawer(
                      //   backgroundColor: AppColors.whiteColor,
                      //   child:
                      //   ListView(
                      //     children: [
                      //       Container(
                      //         padding: EdgeInsets.only(left: 13),
                      //         height: Get.height / 9,
                      //         child: Row(
                      //
                      //           children: [
                      //             Container(
                      //               height: Get.height / 14,
                      //               width: Get.width / 14,
                      //               decoration: BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: AppColors.whiteColor,
                      //               ),
                      //               child: Center(
                      //                   child: Image.asset(
                      //                       AppImages.Splash_WHLogo)),
                      //             ),
                      //             SizedBox(width: Get.width / 40,),
                      //
                      //              Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment: CrossAxisAlignment
                      //                   .start,
                      //
                      //               children: [
                      //                 Text('$userName',
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.w500,
                      //                     fontSize: 17,
                      //                     fontFamily: Fonts.nunitoRegular,
                      //
                      //                   ),),
                      //                 Text('$userEmail',
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.w400,
                      //                       fontSize: 13,
                      //                       fontFamily: Fonts.nunitoRegular,
                      //                       color: AppColors.grey,
                      //                   ),),
                      //               ],
                      //             )
                      //           ],),
                      //       ),
                      //
                      //       Column(
                      //         children: [
                      //           CustomListTileTab(
                      //               icon: Icons.dashboard,
                      //               title: AppStrings.Drawer_Dashboard,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.leaderboard,
                      //               title: AppStrings.Drawer_Lead,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.person,
                      //               title: AppStrings.Drawer_Customer,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.shopping_bag,
                      //               title: AppStrings.Drawer_Orders,
                      //               onTap: (){}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.group,
                      //               title: AppStrings.Drawer_HRM,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.analytics,
                      //               title: AppStrings.Drawer_Analytics,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.dashboard,
                      //               title: AppStrings.Drawer_Campaign,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.bar_chart,
                      //               title: AppStrings.Drawer_Sales,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.person_2,
                      //               title: AppStrings.Drawer_Roles,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.verified_user,
                      //               title: AppStrings.Drawer_Users,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.add_task,
                      //               title: AppStrings.Drawer_Tasks,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.data_object,
                      //               title: AppStrings.Drawer_Projects,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.location_city_sharp,
                      //               title: AppStrings.Drawer_ServiceArea,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.shopping_bag,
                      //               title: AppStrings.Drawer_Products,
                      //               onTap: () {}
                      //           ),
                      //           CustomListTileTab(
                      //               icon: Icons.grade,
                      //               title: AppStrings.Drawer_Master,
                      //               onTap: () {}
                      //           ),
                      //         ],
                      //       ),
                      //
                      //       SizedBox(height: 30,),
                      //
                      //       const Divider(
                      //         thickness: 1,
                      //         indent: 20,
                      //         endIndent: 20,
                      //       ),
                      //
                      //       Container(
                      //           height: Get.height/20,
                      //           width: Get.width/2,
                      //           padding: EdgeInsets.only(left: 20),
                      //
                      //           child: Text(AppStrings.Drawer_Versions,
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w300,
                      //                 fontFamily: Fonts.nunitoRegular,
                      //                 fontSize: 10,
                      //                 color: AppColors.grey
                      //             ),)
                      //       ),
                      //
                      //       Container(
                      //         margin: EdgeInsets.only(left: 20, right: 20),
                      //         child: GenericButton(
                      //             height: Get.height/30,
                      //             width: Get.width/4,
                      //             title: 'Logout',
                      //             onPress: () {
                      //               SaveUserData().removeUser();
                      //               Get.toNamed(RoutesName.login_screen);
                      //               Utils.SnackbarSuccess('Logout Successful');
                      //             }
                      //         ),
                      //       ),
                      //       SizedBox(height: 10,),
                      //     ],
                      //   ),
                      // )
                  ),
                ],
              ),
            ),
          ),


          Container(
            height: Get.height * 1,
            width: 0.08,
            margin: EdgeInsets.only(top: 30, bottom: 30),
            color: AllColors.grey,
          ),

          const SizedBox(width: 10,),

          Expanded(
            flex: 2,
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: Get.height/5.4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AllColors.appBarColorTop,
                              AllColors.appBarColorBottom,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // App Bar
                            Container(
                              // color: Colors.blue,
                              margin: const EdgeInsets.only(
                                  left: 2, right: 12, top: 45, bottom: 25),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.whiteColor,
                                    ),
                                    height: Get.height/13,
                                    width: Get.width/13,
                                    child: Center(
                                        child:
                                        Image.asset(
                                          AllImages.WelcomeCompanyLogo,
                                          scale:10,)
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              // color: Colors.blue,
                              padding: EdgeInsets.only(left: 8, right: 8,),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:
                                Row( //SCROLLER ROW WITH CONTAINERS
                                  children: [
                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 5,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 8,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_TaskPerformance,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AllStrings.Home_TaskPerformanceDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Icon(Icons.arrow_drop_down, size: 40,)

                      ],
                    ),
                  ), // ROW BAR

                  const SizedBox(height: 20,),

                  Container(
                    margin: const EdgeInsets.only(right: 6, left: 6),
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    // height: Get.height/4,
                    // width: Get.width/1.05,
                    decoration: BoxDecoration(
                      color: AllColors.whiteColor,
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
                        Container(
                          // height: Get.height/1,
                          decoration: BoxDecoration(
                            color: AllColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AllColors.vividPurple.withOpacity(0.10),
                                spreadRadius: 10,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),

                          child:
                          CircularPercentIndicator(
                            progressColor: AllColors.mediumPurple,
                            backgroundColor: AllColors.lighterPurple,
                            lineWidth: 14,
                            radius: 90,
                            percent: 0.4,
                            startAngle: 0,
                            animation: true,
                            animationDuration: 2000,
                            // backgroundWidth: 30,
                            curve: Curves.decelerate,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Container(

                              height: Get.height / 10,
                              width: Get.width * 1,
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AllColors.vividPurple.withOpacity(
                                        0.04),
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
                                  Text(AllStrings.Home_Completed,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 15,
                                    ),
                                  ),

                                  // SizedBox(height: 5,),

                                  Text('40%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        Container(

                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(AllStrings.Home_TaskProgress,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  const Text('06:06:15 /',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w600,
                                    ),),

                                  SizedBox(width: 5,),

                                  Text('4hrs',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w600,
                                      color: AllColors.vividPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),


                  const SizedBox(height: 40,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LatestTask,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.vividPink,
                      statusBackgroundColor: AllColors.lightPink,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkGreen,
                      statusBackgroundColor: AllColors.lightGreen,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkBlue,
                      statusBackgroundColor: AllColors.lightBlue,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkRed,
                      statusBackgroundColor: AllColors.lightRed,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkYellow,
                      statusBackgroundColor: AllColors.lightYellow,
                      statusText: 'In Progress'),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 8,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LeadTypeCount,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AllStrings.Home_LeadTypeDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Icon(Icons.arrow_drop_down, size: 30,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),


                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    child:
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child:
                      Row( //SCROLLER ROW WITH CONTAINERS
                        children: [

                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.access_time,
                              iconColor: AllColors.vividPink,
                              containerColor: AllColors.lightPink),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.task,
                              iconColor: AllColors.vividBlue,
                              containerColor: AllColors.lightBlue),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.account_balance_rounded,
                              iconColor: AllColors.vividGreen,
                              containerColor: AllColors.lightGreen),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.timelapse,
                              iconColor: AllColors.mediumPurple,
                              containerColor: AllColors.lighterPurple),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.place,
                              iconColor: AllColors.darkRed,
                              containerColor: AllColors.lightRed),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.policy,
                              iconColor: AllColors.darkYellow,
                              containerColor: AllColors.lightYellow),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.title,
                              iconColor: AllColors.darkGreen,
                              containerColor: AllColors.lightGreen
                          ),
                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 20,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LatestCustomer,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LatestCustomerSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),

                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LeadSource,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Icon(Icons.list, color: AllColors.lightGrey, size: 20,),

                        const SizedBox(width: 10,),

                        Text(AllStrings.Home_LeadSourceList,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.grey,
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Icon(
                          Icons.pie_chart, color: AllColors.vividBlue, size: 20,),

                        const SizedBox(width: 5,),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LeadSourceChart,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: Get.height / 5,
                    width: Get.width / 1.05,
                    decoration: BoxDecoration(
                      color: AllColors.whiteColor,
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
                          color: AllColors.lightGrey),)),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.money, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_Transactions,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_TransactionsSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),


                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),

        ],
      );
  }


  Widget landscapeMode() {
    return
      Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child:
            SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      color: AllColors.lightBlue,
                      width: Get.width / 4,
                      height: Get.height * 1,
                      child:
                      Drawer(
                        backgroundColor: AllColors.whiteColor,
                        child:
                        ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 13),
                              height: Get.height / 9,
                              child: Row(

                                children: [
                                  Container(

                                    height: Get.height / 14,
                                    width: Get.width / 14,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.whiteColor,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            AllImages.Splash_WHLogo)),
                                  ),
                                  SizedBox(width: Get.width / 40,),

                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      Text('Sunil Kumar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          fontFamily: AllFonts.nunitoRegular,

                                        ),),
                                      Text('+91-8810529887',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            fontFamily: AllFonts.nunitoRegular,
                                            color: Colors.grey
                                        ),),
                                    ],
                                  )
                                ],),
                            ),

                            Column(
                              children: [
                                CustomListTileTab(
                                    icon: Icons.dashboard,
                                    title: AllStrings.Drawer_Dashboard,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.leaderboard,
                                    title: AllStrings.Drawer_Lead,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person,
                                    title: AllStrings.Drawer_Customer,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AllStrings.Drawer_Orders,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.group,
                                    title: AllStrings.Drawer_HRM,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.analytics,
                                    title: AllStrings.Drawer_Analytics,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.dashboard,
                                    title: AllStrings.Drawer_Campaign,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.bar_chart,
                                    title: AllStrings.Drawer_Sales,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person_2,
                                    title: AllStrings.Drawer_Roles,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.verified_user,
                                    title: AllStrings.Drawer_Users,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.add_task,
                                    title: AllStrings.Drawer_Tasks,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.data_object,
                                    title: AllStrings.Drawer_Projects,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.location_city_sharp,
                                    title: AllStrings.Drawer_ServiceArea,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AllStrings.Drawer_Products,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.grade,
                                    title: AllStrings.Drawer_Master,
                                    onTap: () {}
                                ),
                              ],
                            ),

                            SizedBox(height: 30,),

                            const Divider(
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,

                            ),

                            Container(
                                height: Get.height / 20,
                                width: Get.width / 2,
                                padding: EdgeInsets.only(left: 20),

                                child: Text(AllStrings.Drawer_Versions,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 10,
                                      color: AllColors.grey
                                  ),)
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: CommonButton(
                                  height: Get.height / 22,
                                  width: Get.width / 4,
                                  title: AllStrings.Drawer_ButtonLogout,
                                  onPress: () {
                                    SaveUserData().removeUser();
                                    Get.toNamed(RoutesName.login_screen);
                                    Utils.SnackbarSuccess(AllStrings.Home_Snackbar);
                                  }
                                  ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),


          Container(
            height: Get.height * 1,
            width: 0.08,
            margin: EdgeInsets.only(top: 30, bottom: 30),
            color: AllColors.grey,
          ),

          const SizedBox(width: 10,),

          Expanded(
            flex: 3,
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: Get.height / 4.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AllColors.appBarColorTop,
                              AllColors.appBarColorBottom,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // App Bar
                            Container(
                              // color: Colors.blue,
                              margin: const EdgeInsets.only(
                                  left: 2, right: 12, top: 45, bottom: 25),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.whiteColor,
                                    ),
                                    height: Get.height / 13,
                                    width: Get.width / 13,
                                    child: Center(
                                        child:
                                        Image.asset(
                                          AllImages.WelcomeCompanyLogo,
                                          scale: 10,)
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              // color: Colors.blue,
                              padding: EdgeInsets.only(left: 8, right: 8,),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:
                                Row( //SCROLLER ROW WITH CONTAINERS
                                  children: [
                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 5,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AllColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AllColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 8,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_TaskPerformance,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AllStrings.Home_TaskPerformanceDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Icon(Icons.arrow_drop_down, size: 40,)

                      ],
                    ),
                  ), // ROW BAR

                  const SizedBox(height: 20,),

                  Container(
                    margin: const EdgeInsets.only(right: 6, left: 6),
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    // height: Get.height/4,
                    // width: Get.width/1.05,
                    decoration: BoxDecoration(
                      color: AllColors.whiteColor,
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
                        Container(
                          // height: Get.height/1,
                          decoration: BoxDecoration(
                            color: AllColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AllColors.vividPurple.withOpacity(0.10),
                                spreadRadius: 10,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),

                          child:
                          CircularPercentIndicator(
                            progressColor: AllColors.mediumPurple,
                            backgroundColor: AllColors.lighterPurple,
                            lineWidth: 14,
                            radius: 90,
                            percent: 0.4,
                            startAngle: 0,
                            animation: true,
                            animationDuration: 2000,
                            // backgroundWidth: 30,
                            curve: Curves.decelerate,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Container(

                              height: Get.height / 7,
                              width: Get.width * 1,
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AllColors.vividPurple.withOpacity(
                                        0.04),
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
                                  Text(AllStrings.Home_Completed,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 15,
                                    ),
                                  ),

                                  // SizedBox(height: 5,),

                                  Text('40%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        Container(

                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(AllStrings.Home_TaskProgress,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  const Text('06:06:15 /',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w600,
                                    ),),

                                  SizedBox(width: 5,),

                                  Text('4hrs',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w600,
                                      color: AllColors.vividPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),


                  const SizedBox(height: 40,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LatestTask,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.vividPink,
                      statusBackgroundColor: AllColors.lightPink,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkGreen,
                      statusBackgroundColor: AllColors.lightGreen,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkBlue,
                      statusBackgroundColor: AllColors.lightBlue,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkRed,
                      statusBackgroundColor: AllColors.lightRed,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AllColors.darkYellow,
                      statusBackgroundColor: AllColors.lightYellow,
                      statusText: 'In Progress'),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 8,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LeadTypeCount,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AllStrings.Home_LeadTypeDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Icon(Icons.arrow_drop_down, size: 30,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),


                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    child:
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child:
                      Row( //SCROLLER ROW WITH CONTAINERS
                        children: [

                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.access_time,
                              iconColor: AllColors.vividPink,
                              containerColor: AllColors.lightPink),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.task,
                              iconColor: AllColors.vividBlue,
                              containerColor: AllColors.lightBlue),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.account_balance_rounded,
                              iconColor: AllColors.vividGreen,
                              containerColor: AllColors.lightGreen),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.timelapse,
                              iconColor: AllColors.mediumPurple,
                              containerColor: AllColors.lighterPurple),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.place,
                              iconColor: AllColors.darkRed,
                              containerColor: AllColors.lightRed),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.policy,
                              iconColor: AllColors.darkYellow,
                              containerColor: AllColors.lightYellow),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AllColors.grey,
                              statusColor: AllColors.blackColor,
                              icon: Icons.title,
                              iconColor: AllColors.darkGreen,
                              containerColor: AllColors.lightGreen
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LatestCustomer,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),

                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AllColors.lightPink,
                    circleColorTwo: AllColors.lighterPurple,
                    circleTextColorTwo: AllColors.mediumPurple,
                    circleTextColorOne: AllColors.darkPink,),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_LeadSource,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Icon(Icons.list, color: AllColors.lightGrey, size: 20,),

                        const SizedBox(width: 10,),

                        Text(AllStrings.Home_LeadSourceList,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AllColors.grey,
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Icon(
                          Icons.pie_chart, color: AllColors.vividBlue, size: 20,),

                        const SizedBox(width: 5,),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_LeadSourceChart,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: Get.height / 5,
                    width: Get.width / 1.05,
                    decoration: BoxDecoration(
                      color: AllColors.whiteColor,
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
                          color: AllColors.lightGrey),)),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.money, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AllStrings.Home_Transactions,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AllFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AllColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AllStrings.Home_TransactionsSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AllFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AllColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AllColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),

                  const AppCardsThreeTab(
                      title: 'Premium 60 Packages Self Done...',
                      name: 'Prakash shah',
                      amount: '₹4000',
                      subtitle: '25 May, 2024 at 12:30 pm'),


                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),

        ],
      );
  }


}
