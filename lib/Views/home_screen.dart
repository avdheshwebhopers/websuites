
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/Assets/app_images.dart';
import '../Resources/components/Cards/DashboardScreen_Card/app_cards_1.dart';
import '../Resources/components/Cards/DashboardScreen_Card/app_cards_2.dart';
import '../Resources/components/Cards/DashboardScreen_Card/app_cards_3.dart';
import '../Resources/components/Containers/app_row_container1.dart';
import '../Resources/components/Containers/app_row_container2.dart';
import '../Resources/components/List_TIles/custom_list_tile.dart';
import '../Resources/components/app_colors.dart';
import '../Resources/components/App_Buttons/generic_button.dart';
import '../Utils/Routes/routes_name.dart';
import '../Utils/Utils.dart';
import '../View_model/controllers/save_token/save_token.dart';




class HomeScreen extends StatefulWidget {


  HomeScreen({


    super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   GlobalKey <ScaffoldState> _globalKey =  GlobalKey<ScaffoldState>();
   RxBool loading = false.obs;
   @override
  void initState(){

    // TODO: implement initState
    super.initState();

  }

   Widget build(BuildContext context){
    // final items = List.generate(10, (index) => 'Item $index');
     return
      Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        drawer:
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
                    padding: EdgeInsets.only(left: 13),
                    height: Get.height/9,
                    child: Row(

                      children: [
                        Container(
                          height: Get.height/10,
                          width: Get.width/10,
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
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Column(
                  //   children: [
                  //     CustomListTile(
                  //         leading_image: Icons.dashboard,
                  //         title: 'Dashboard',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.leaderboard,
                  //         title: 'Lead',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.person,
                  //         title: 'Customer',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.shopping_bag,
                  //         title: 'Orders',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.group,
                  //         title: 'HRM',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.analytics,
                  //         title: 'Analytics',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.dashboard,
                  //         title: 'Campaign',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.bar_chart,
                  //         title: 'Sales',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.person_2,
                  //         title: 'Roles',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.verified_user,
                  //         title: 'Users',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.add_task,
                  //         title: 'Tasks',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.data_object,
                  //         title: 'Projects',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.location_city_sharp,
                  //         title: 'Service Area',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.shopping_bag,
                  //         title: 'Products',
                  //         onTap: (){}
                  //     ),
                  //     CustomListTile(
                  //         leading_image: Icons.grade,
                  //         title: 'Master',
                  //         onTap: (){}
                  //     ),
                  //   ],
                  // ),

                  const SizedBox(height: 100),

                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),

                  Container(
                      height: Get.height/20,
                      width: Get.width/2,
                      padding: EdgeInsets.only(left: 20),

                      child: Text('version 1.0.12',
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
                        onPress: (){
                          SaveUserData().removeUser();
                          Get.toNamed(RoutesName.login_screen);
                          Utils.SnackbarSuccess('Logout Successful');
                        }
                        ),
                  )
                ],
              )
            )
        ),
        body:
             // Obx((){
        //   switch (countController.rxRequestStatus.value){
        //     case Status.LOADING:
        //       return Center(child: CircularProgressIndicator());
        //     case Status.ERROR:
        //       return Text('something went wrong');
        //     case Status.COMPLETED:
        //       return
                Column(
                children: [
                  Expanded(
                    child:
                    SingleChildScrollView(
                      child:
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                height: Get.mediaQuery.size.height/4,
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
                              SizedBox(height: 2,),

                              SizedBox(
                                height: Get.mediaQuery.size.height/3,
                                child:
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // App Bar
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 40, top: 55),
                                        // color: Colors.blue,
                                        padding: const EdgeInsets.only(left: 6,right: 6),

                                        child:
                                        Container(
                                          margin: const EdgeInsets.only(left: 2, right: 6),
                                          child:
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: (){

                                                  _globalKey.currentState?.openDrawer();
                                                },
                                                icon: const Icon(Icons.menu),
                                                iconSize: 35,
                                                color: Colors.white,),

                                              const SizedBox(width: 6),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:[
                                                  Text('Hello, Sunil!!',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontFamily: AppFonts.nunitoRegular,
                                                      color: AppColors.whiteColor,
                                                    ),),

                                                  Text('24 May, 2024',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      fontFamily: AppFonts.nunitoRegular,
                                                      color: AppColors.whiteColor,
                                                    ),),
                                                ],
                                              ),

                                              const Spacer(),

                                              Container(
                                                //CONTAINER CONTAINS RUPEE ICON
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.whiteColor,
                                                ),
                                                height: Get.height/11,
                                                width: Get.width/11,
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
                                        padding: const EdgeInsets.only(left: 8, right: 8, ),
                                        child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                          child:
                                          Row(                                                    //SCROLLER ROW WITH CONTAINERS
                                            children: [
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Leads',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Customers',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Orders',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,

                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Repeated Leads',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              AppRowContainerOne(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,

                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Company Pool',
                                                  subtitle: '4% (30 days)'),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15,),

                          Container(
                            // color: Colors.grey,
                            margin: const EdgeInsets.only(left: 10, right: 8,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [

                                const Icon(Icons.list_alt_outlined, size: 16,),

                                const SizedBox(width: 8,),

                                Text('TASK PERFORMANCE',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Text('24 May, 2024',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                const Icon(Icons.arrow_drop_down, size: 30,)

                              ],
                            ),
                          ), // ROW BAR

                          const SizedBox(height: 8,),

                          // Container(
                          //   height: Get.height/5,
                          //   width: Get.width/1.05,
                          //   decoration: BoxDecoration(
                          //     color: App_Colors.whiteColor,
                          //     borderRadius: BorderRadius.circular(10),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.black45.withOpacity(0.06),
                          //         spreadRadius: 0.5,
                          //         blurRadius: 4,
                          //         offset: const Offset(0, 3),
                          //       ),
                          //     ],),
                          //   child: const Center(
                          //     child: Text('Progress Indicator', style: TextStyle(
                          //       fontSize: 12,
                          //     ),),
                          //   ),
                          // ),

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
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.0),
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
                                        lineWidth: 11,
                                        radius: 65,
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
                                                  fontSize:9,
                                                ),
                                              ),

                                              // SizedBox(height: 5,),

                                              Text('40%',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: AppFonts.nunitoRegular,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                const
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('TASK PROGRESS',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: AppFonts.nunitoRegular,
                                        fontWeight: FontWeight.w600,
                                      ),),

                                    Row(
                                      children: [
                                        Text('06:06:15/',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w600,
                                          ),),

                                        SizedBox(width: 5,),

                                        Text('4hrs',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff5131ff),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          const SizedBox(height:30,),

                          Container(
                            // color: Colors.grey,
                            margin: const EdgeInsets.only(left: 10, right: 12,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                const Icon(Icons.list_alt_outlined, size: 16,),

                                const SizedBox(width: 6,),

                                Text('LATEST TASK',
                                  style: TextStyle(
                                    fontSize: 14,
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
                                      fontSize: 12,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 10, color: AppColors.vividPurple,)
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
                          const SizedBox(height: 8,),

                          AppCardOne(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AppColors.darkGreen,
                              statusBackgroundColor: AppColors.lightGreen,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          AppCardOne(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AppColors.darkBlue,
                              statusBackgroundColor: AppColors.lightBlue,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          AppCardOne(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AppColors.darkRed,
                              statusBackgroundColor: AppColors.lightRed,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          AppCardOne(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AppColors.darkYellow,
                              statusBackgroundColor: AppColors.lightYellow,
                              statusText: 'In Progress'),

                          const SizedBox(height: 20,),

                          Container(
                            // color: Colors.grey,
                            margin: const EdgeInsets.only(left: 10, right: 8,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [

                                const Icon(Icons.list_alt_outlined, size: 16,),

                                const SizedBox(width: 8,),

                                Text('LEAD TYPE COUNT',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Text('21 May',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                const Icon(Icons.arrow_drop_down, size: 30,)
                              ],
                            ),
                          ),



                          const SizedBox(height: 5,),



                          Container(
                            padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
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

                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.task,
                                      iconColor: AppColors.vividBlue,
                                      containerColor: AppColors.lightBlue),
                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.account_balance_rounded,
                                      iconColor: AppColors.vividGreen,
                                      containerColor: AppColors.lightGreen),
                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.timelapse,
                                      iconColor: AppColors.mediumPurple,
                                      containerColor: AppColors.lighterPurple),
                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.place,
                                      iconColor: AppColors.darkRed,
                                      containerColor: AppColors.lightRed),
                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.policy,
                                      iconColor: AppColors.darkYellow,
                                      containerColor: AppColors.lightYellow),
                                  const SizedBox(width: 8,),

                                  AppRowContainerTwo(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AppColors.grey,
                                      statusColor: AppColors.blackColor,
                                      icon: Icons.title,
                                      iconColor: AppColors.darkGreen,
                                      containerColor: AppColors.lightGreen),
                                  const SizedBox(width: 8,),
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

                                const Icon(Icons.list_alt_outlined, size: 16,),

                                const SizedBox(width: 6,),

                                Text(' LATEST CUSTOMER ',
                                  style: TextStyle(
                                    fontSize: 14,
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
                                      fontSize: 12,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 11, color: AppColors.vividPurple,)
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

                          AppCardsTwo(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AppColors.lightPink,
                            circleColorTwo: AppColors.lighterPurple,
                            circleTextColorTwo: AppColors.mediumPurple,
                            circleTextColorOne: AppColors.darkPink,),

                          AppCardsTwo(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AppColors.lightPink,
                            circleColorTwo: AppColors.lighterPurple,
                            circleTextColorTwo: AppColors.mediumPurple,
                            circleTextColorOne: AppColors.darkPink,),

                          AppCardsTwo(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AppColors.lightPink,
                            circleColorTwo: AppColors.lighterPurple,
                            circleTextColorTwo: AppColors.mediumPurple,
                            circleTextColorOne: AppColors.darkPink,),

                          AppCardsTwo(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AppColors.lightPink,
                            circleColorTwo: AppColors.lighterPurple,
                            circleTextColorTwo: AppColors.mediumPurple,
                            circleTextColorOne: AppColors.darkPink,),


                          const SizedBox(height: 15,),

                          Container(
                            // color: Colors.grey,
                            margin: const EdgeInsets.only(left: 10, right: 12,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [

                                const Icon(Icons.list_alt_outlined, size: 16,),

                                const SizedBox(width: 8,),

                                Text(' LEAD SOURCE ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Icon(Icons.list, color: AppColors.lightGrey,size: 17,),

                                const SizedBox(width: 10,),

                                Text('List',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.grey,
                                  ),
                                ),

                                const SizedBox(width: 10,),

                                Icon(Icons.pie_chart, color: AppColors.vividBlue,size: 12,),

                                const SizedBox(width: 5,),

                                InkWell(
                                  onTap: (){},
                                  child: Text('Chart',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.vividBlue,
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

                                const Icon(Icons.money, size: 16,),

                                const SizedBox(width: 8,),

                                Text('TRANSACTIONS ',
                                  style: TextStyle(
                                    fontSize: 14,
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
                                      fontSize: 12,
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 10, color: AppColors.vividPurple,)
                              ],
                            ),
                          ),

                          const SizedBox(height:20,),

                          const Transaction_list_Widget(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const Transaction_list_Widget(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const Transaction_list_Widget(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const Transaction_list_Widget(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const Transaction_list_Widget(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                        ],
                      ),
                    ),
                  ),
                ],
                )
      );
   }
}









