import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../Resources/Assets/app_images.dart';
import '../../../Resources/components/app_colors.dart';
import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/Utils.dart';
import '../../../View_model/controllers/save_token/save_token.dart';
import '../../../resources/Assets/app_fonts.dart';
import '../../../resources/app_strings/app_strings.dart';
import '../../../resources/components/Cards/app_cards_1.dart';
import '../../../resources/components/Cards/app_cards_2.dart';
import '../../../resources/components/Cards/app_cards_3.dart';
import '../../../resources/components/Containers/app_row_container1.dart';
import '../../../resources/components/Containers/app_row_container2.dart';
import '../../../resources/components/List_TIles/custom_list_tile.dart';
import '../../../resources/components/generic_button.dart';


class MyTabBody extends StatefulWidget {
  const MyTabBody({super.key});

  @override
  State<MyTabBody> createState() => _MyTabBodyState();}

class _MyTabBodyState extends State<MyTabBody> {


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
                      color: AppColors.whiteColor,
                      width: Get.width / 2,
                      height: Get.height * 1,
                      child:
                      Drawer(
                        backgroundColor: AppColors.whiteColor,
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
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            AppImages.Splash_WHLogo)),
                                  ),
                                  SizedBox(width: Get.width / 40,),

                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      const Text('Sunil Kumar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          fontFamily: AppFonts.nunitoRegular,

                                        ),),
                                      Text('+91-8810529887',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            fontFamily: AppFonts.nunitoRegular,
                                            color: AppColors.grey,
                                        ),),
                                    ],
                                  )
                                ],),
                            ),

                            Column(
                              children: [
                                CustomListTileTab(
                                    icon: Icons.dashboard,
                                    title: AppStrings.Drawer_Dashboard,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.leaderboard,
                                    title: AppStrings.Drawer_Lead,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person,
                                    title: AppStrings.Drawer_Customer,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AppStrings.Drawer_Orders,
                                    onTap: (){}
                                ),
                                CustomListTileTab(
                                    icon: Icons.group,
                                    title: AppStrings.Drawer_HRM,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.analytics,
                                    title: AppStrings.Drawer_Analytics,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.dashboard,
                                    title: AppStrings.Drawer_Campaign,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.bar_chart,
                                    title: AppStrings.Drawer_Sales,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person_2,
                                    title: AppStrings.Drawer_Roles,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.verified_user,
                                    title: AppStrings.Drawer_Users,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.add_task,
                                    title: AppStrings.Drawer_Tasks,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.data_object,
                                    title: AppStrings.Drawer_Projects,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.location_city_sharp,
                                    title: AppStrings.Drawer_ServiceArea,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AppStrings.Drawer_Products,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.grade,
                                    title: AppStrings.Drawer_Master,
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
                                height: Get.height/20,
                                width: Get.width/2,
                                padding: EdgeInsets.only(left: 20),

                                child: Text(AppStrings.Drawer_Versions,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 10,
                                      color: AppColors.grey
                                  ),)
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: GenericButton(
                                  height: Get.height/30,
                                  width: Get.width/4,
                                  title: 'Logout',
                                  onPress: () {
                                    SaveToken().removeToken();
                                    Get.toNamed(RoutesName.login_screen);
                                    Utils.SnackbarSuccess('Logout Successful');
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
            color: AppColors.grey,
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
                              AppColors.appBarColorTop,
                              AppColors.appBarColorBottom,
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
                                      color: AppColors.whiteColor,
                                    ),
                                    height: Get.height/13,
                                    width: Get.width/13,
                                    child: Center(
                                        child:
                                        Image.asset(
                                          AppImages.WelcomeCompanyLogo,
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
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 5,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
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

                        Text(AppStrings.Home_TaskPerformance,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AppStrings.Home_TaskPerformanceDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.blackColor,
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
                        Container(
                          // height: Get.height/1,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.vividPurple.withOpacity(0.10),
                                spreadRadius: 10,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),

                          child:
                          CircularPercentIndicator(
                            progressColor: AppColors.mediumPurple,
                            backgroundColor: AppColors.lighterPurple,
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
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.vividPurple.withOpacity(
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
                                  Text(AppStrings.Home_Completed,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 15,
                                    ),
                                  ),

                                  // SizedBox(height: 5,),

                                  Text('40%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFonts.nunitoRegular,
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
                              const Text(AppStrings.Home_TaskProgress,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  const Text('06:06:15 /',
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
                                      color: AppColors.vividPurple,
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

                        Text(AppStrings.Home_LatestTask,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.vividPink,
                      statusBackgroundColor: AppColors.lightPink,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkGreen,
                      statusBackgroundColor: AppColors.lightGreen,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkBlue,
                      statusBackgroundColor: AppColors.lightBlue,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkRed,
                      statusBackgroundColor: AppColors.lightRed,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkYellow,
                      statusBackgroundColor: AppColors.lightYellow,
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

                        Text(AppStrings.Home_LeadTypeCount,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AppStrings.Home_LeadTypeDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.blackColor,
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
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.access_time,
                              iconColor: AppColors.vividPink,
                              containerColor: AppColors.lightPink),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.task,
                              iconColor: AppColors.skyBlue,
                              containerColor: AppColors.lightBlue),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.account_balance_rounded,
                              iconColor: AppColors.grassGreen,
                              containerColor: AppColors.lightGreen),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.timelapse,
                              iconColor: AppColors.mediumPurple,
                              containerColor: AppColors.lighterPurple),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.place,
                              iconColor: AppColors.darkRed,
                              containerColor: AppColors.lightRed),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.policy,
                              iconColor: AppColors.darkYellow,
                              containerColor: AppColors.lightYellow),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.title,
                              iconColor: AppColors.darkGreen,
                              containerColor: AppColors.lightGreen
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

                        Text(AppStrings.Home_LatestCustomer,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LatestCustomerSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),

                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AppStrings.Home_LeadSource,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Icon(Icons.list, color: AppColors.lightGrey, size: 20,),

                        const SizedBox(width: 10,),

                        Text(AppStrings.Home_LeadSourceList,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.grey,
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Icon(
                          Icons.pie_chart, color: AppColors.skyBlue, size: 20,),

                        const SizedBox(width: 5,),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LeadSourceChart,
                            style: TextStyle(
                              fontSize: 12,
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
                    height: Get.height / 5,
                    width: Get.width / 1.05,
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
                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.money, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AppStrings.Home_Transactions,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_TransactionsSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
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
                      color: AppColors.lightBlue,
                      width: Get.width / 4,
                      height: Get.height * 1,
                      child:
                      Drawer(
                        backgroundColor: AppColors.whiteColor,
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
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            AppImages.Splash_WHLogo)),
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
                                          fontFamily: AppFonts.nunitoRegular,

                                        ),),
                                      Text('+91-8810529887',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            fontFamily: AppFonts.nunitoRegular,
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
                                    title: AppStrings.Drawer_Dashboard,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.leaderboard,
                                    title: AppStrings.Drawer_Lead,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person,
                                    title: AppStrings.Drawer_Customer,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AppStrings.Drawer_Orders,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.group,
                                    title: AppStrings.Drawer_HRM,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.analytics,
                                    title: AppStrings.Drawer_Analytics,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.dashboard,
                                    title: AppStrings.Drawer_Campaign,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.bar_chart,
                                    title: AppStrings.Drawer_Sales,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.person_2,
                                    title: AppStrings.Drawer_Roles,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.verified_user,
                                    title: AppStrings.Drawer_Users,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.add_task,
                                    title: AppStrings.Drawer_Tasks,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.data_object,
                                    title: AppStrings.Drawer_Projects,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.location_city_sharp,
                                    title: AppStrings.Drawer_ServiceArea,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.shopping_bag,
                                    title: AppStrings.Drawer_Products,
                                    onTap: () {}
                                ),
                                CustomListTileTab(
                                    icon: Icons.grade,
                                    title: AppStrings.Drawer_Master,
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

                                child: Text(AppStrings.Drawer_Versions,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 10,
                                      color: AppColors.grey
                                  ),)
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: GenericButton(
                                  height: Get.height / 22,
                                  width: Get.width / 4,
                                  title: AppStrings.Drawer_ButtonLogout,
                                  onPress: () {
                                    SaveToken().removeToken();
                                    Get.toNamed(RoutesName.login_screen);
                                    Utils.SnackbarSuccess(AppStrings.Home_Snackbar);
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
            color: AppColors.grey,
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
                              AppColors.appBarColorTop,
                              AppColors.appBarColorBottom,
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
                                      color: AppColors.whiteColor,
                                    ),
                                    height: Get.height / 13,
                                    width: Get.width / 13,
                                    child: Center(
                                        child:
                                        Image.asset(
                                          AppImages.WelcomeCompanyLogo,
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

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 5,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
                                        amount: '₹20000',
                                        title: 'Total revenue',
                                        subtitle: '4% (30 days)'),


                                    AppRowContainerOneTab(
                                      // height: Get.height/8,
                                      // width: Get.width/3,

                                        backgroundColor: AppColors.whiteColor,
                                        icon: Icons.currency_rupee,
                                        size: 15,
                                        color: AppColors.mediumPurple,
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

                        Text(AppStrings.Home_TaskPerformance,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AppStrings.Home_TaskPerformanceDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.blackColor,
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
                        Container(
                          // height: Get.height/1,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.vividPurple.withOpacity(0.10),
                                spreadRadius: 10,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),

                          child:
                          CircularPercentIndicator(
                            progressColor: AppColors.mediumPurple,
                            backgroundColor: AppColors.lighterPurple,
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
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.vividPurple.withOpacity(
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
                                  Text(AppStrings.Home_Completed,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontSize: 15,
                                    ),
                                  ),

                                  // SizedBox(height: 5,),

                                  Text('40%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFonts.nunitoRegular,
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
                              const Text(AppStrings.Home_TaskProgress,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  const Text('06:06:15 /',
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
                                      color: AppColors.vividPurple,
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

                        Text(AppStrings.Home_LatestTask,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.vividPink,
                      statusBackgroundColor: AppColors.lightPink,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkGreen,
                      statusBackgroundColor: AppColors.lightGreen,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkBlue,
                      statusBackgroundColor: AppColors.lightBlue,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkRed,
                      statusBackgroundColor: AppColors.lightRed,
                      statusText: 'In Progress'),


                  AppCardOneTab(
                      title: 'Designing Task',
                      subtitle: 'Somacare inner Images',
                      date: '15 May, 2024 at 12:30 pm',
                      ContainerIcon: Icons.access_time,
                      IconColor: AppColors.darkYellow,
                      statusBackgroundColor: AppColors.lightYellow,
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

                        Text(AppStrings.Home_LeadTypeCount,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Text(AppStrings.Home_LeadTypeDate,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.blackColor,
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
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.access_time,
                              iconColor: AppColors.vividPink,
                              containerColor: AppColors.lightPink),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.task,
                              iconColor: AppColors.skyBlue,
                              containerColor: AppColors.lightBlue),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.account_balance_rounded,
                              iconColor: AppColors.grassGreen,
                              containerColor: AppColors.lightGreen),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.timelapse,
                              iconColor: AppColors.mediumPurple,
                              containerColor: AppColors.lighterPurple),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.place,
                              iconColor: AppColors.darkRed,
                              containerColor: AppColors.lightRed),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.policy,
                              iconColor: AppColors.darkYellow,
                              containerColor: AppColors.lightYellow),


                          AppRowContainerTwoTab(
                              count: '15 Leads',
                              statusText: 'Pending',
                              countColor: AppColors.grey,
                              statusColor: AppColors.blackColor,
                              icon: Icons.title,
                              iconColor: AppColors.darkGreen,
                              containerColor: AppColors.lightGreen
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

                        Text(AppStrings.Home_LatestCustomer,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LatestTaskSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),

                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  AppCardsTwoTab(
                    title: 'Dermi Derm',
                    subtitle: 'AYUSH GOYAL',
                    date: '26 May, 2024 at 12:30 pm',
                    circleColorOne: AppColors.lightPink,
                    circleColorTwo: AppColors.lighterPurple,
                    circleTextColorTwo: AppColors.mediumPurple,
                    circleTextColorOne: AppColors.darkPink,),


                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.list_alt_outlined, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AppStrings.Home_LeadSource,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        Icon(Icons.list, color: AppColors.lightGrey, size: 20,),

                        const SizedBox(width: 10,),

                        Text(AppStrings.Home_LeadSourceList,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w300,
                            color: AppColors.grey,
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Icon(
                          Icons.pie_chart, color: AppColors.skyBlue, size: 20,),

                        const SizedBox(width: 5,),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_LeadSourceChart,
                            style: TextStyle(
                              fontSize: 12,
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
                    height: Get.height / 5,
                    width: Get.width / 1.05,
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
                  const SizedBox(height: 30,),
                  Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.only(left: 10, right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        const Icon(Icons.money, size: 20,),

                        const SizedBox(width: 8,),

                        Text(AppStrings.Home_Transactions,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),

                        const Spacer(),

                        InkWell(
                          onTap: () {},
                          child: Text(AppStrings.Home_TransactionsSeeAll,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              color: AppColors.vividPurple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4,),

                        Icon(Icons.arrow_forward_ios, size: 12,
                          color: AppColors.vividPurple,)
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
