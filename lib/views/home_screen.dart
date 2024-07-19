
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Resources/all_fonts/all_fonts.dart';
import '../Resources/all_images/all_images.dart';
import '../Utils/Routes/routes_name.dart';
import '../Utils/Utils.dart';
import '../utils/components/All_Buttons/common_button.dart';
import '../utils/components/app_colors.dart';
import '../utils/components/cards/dashboard_screen_card/latest_customers_card.dart';
import '../utils/components/cards/dashboard_screen_card/latest_task_card.dart';
import '../utils/components/cards/dashboard_screen_card/transaction_list_card.dart';
import '../utils/components/dashboard_screen_rows/db_screen_leads_row.dart';
import '../utils/components/dashboard_screen_rows/db_screen_revenue_row.dart';
import '../view_models/controllers/save_token/save_token.dart';




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
            color: AllColors.whiteColor,
            width: Get.width/2,
            height: Get.height*1,
            child: Drawer(
              backgroundColor: AllColors.whiteColor,
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
                            color: AllColors.whiteColor,
                          ),
                          child: Center(
                              child: Image.asset(AllImages.Splash_WHLogo )),
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
                                fontFamily: AllFonts.nunitoRegular,

                              ),),
                            Text('+91-8810529887',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  fontFamily: AllFonts.nunitoRegular,
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
                            fontFamily: AllFonts.nunitoRegular,
                            fontSize: 10,
                            color: AllColors.grey
                        ),)
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: CommonButton(
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
                                      AllColors.appBarColorTop,
                                      AllColors.appBarColorBottom,
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
                                                      fontFamily: AllFonts.nunitoRegular,
                                                      color: AllColors.whiteColor,
                                                    ),),

                                                  Text('24 May, 2024',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      fontFamily: AllFonts.nunitoRegular,
                                                      color: AllColors.whiteColor,
                                                    ),),
                                                ],
                                              ),

                                              const Spacer(),

                                              Container(
                                                //CONTAINER CONTAINS RUPEE ICON
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AllColors.whiteColor,
                                                ),
                                                height: Get.height/11,
                                                width: Get.width/11,
                                                child: Center(
                                                    child:
                                                    Image.asset(AllImages.WelcomeCompanyLogo, scale: 7,)
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
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Leads',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Customers',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,
                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Orders',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,

                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Repeated Leads',
                                                  subtitle: '4% (30 days)'),

                                              const SizedBox(width: 8,),
                                              DBRevenueRow(
                                                  // height: Get.height/9,
                                                  // width: Get.width/2.5,

                                                  backgroundColor: AllColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Text('24 May, 2024',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AllColors.blackColor,
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
                                Center(
                                  child:
                                  Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AllColors.whiteColor,
                                        shape: BoxShape.circle,
                                        boxShadow:[
                                          BoxShadow(
                                            color: AllColors.vividPurple.withOpacity(0.10),
                                            spreadRadius: 10,
                                            blurRadius: 10,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),

                                      child:
                                      CircularPercentIndicator(
                                        progressColor: AllColors.mediumPurple,
                                        backgroundColor: AllColors.lighterPurple,
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
                                            color: AllColors.whiteColor,
                                            shape: BoxShape.circle,
                                            boxShadow:[
                                              BoxShadow(
                                                color: AllColors.vividPurple.withOpacity(0.04),
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
                                                  fontFamily: AllFonts.nunitoRegular,
                                                  fontSize:9,
                                                ),
                                              ),

                                              // SizedBox(height: 5,),

                                              Text('40%',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: AllFonts.nunitoRegular,
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
                                        fontFamily: AllFonts.nunitoRegular,
                                        fontWeight: FontWeight.w600,
                                      ),),

                                    Row(
                                      children: [
                                        Text('06:06:15/',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: AllFonts.nunitoRegular,
                                            fontWeight: FontWeight.w600,
                                          ),),

                                        SizedBox(width: 5,),

                                        Text('4hrs',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: AllFonts.nunitoRegular,
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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                InkWell(
                                  onTap: (){},
                                  child: Text('See all',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AllColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 10, color: AllColors.vividPurple,)
                              ],
                            ),
                          ),

                          const SizedBox(height: 20,),

                          LatestTaskCard(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AllColors.vividPink,
                              statusBackgroundColor: AllColors.lightPink,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          LatestTaskCard(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AllColors.darkGreen,
                              statusBackgroundColor: AllColors.lightGreen,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          LatestTaskCard(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AllColors.darkBlue,
                              statusBackgroundColor: AllColors.lightBlue,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          LatestTaskCard(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AllColors.darkRed,
                              statusBackgroundColor: AllColors.lightRed,
                              statusText: 'In Progress'),
                          const SizedBox(height: 8,),

                          LatestTaskCard(
                              title: 'Designing Task',
                              subtitle: 'Somacare inner Images',
                              date: '15 May, 2024 at 12:30 pm',
                              ContainerIcon: Icons.access_time,
                              IconColor: AllColors.darkYellow,
                              statusBackgroundColor: AllColors.lightYellow,
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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Text('21 May',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AllColors.blackColor,
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

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.access_time,
                                      iconColor: AllColors.vividPink,
                                      containerColor: AllColors.lightPink),

                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.task,
                                      iconColor: AllColors.vividBlue,
                                      containerColor: AllColors.lightBlue),
                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.account_balance_rounded,
                                      iconColor: AllColors.vividGreen,
                                      containerColor: AllColors.lightGreen),
                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.timelapse,
                                      iconColor: AllColors.mediumPurple,
                                      containerColor: AllColors.lighterPurple),
                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.place,
                                      iconColor: AllColors.darkRed,
                                      containerColor: AllColors.lightRed),
                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.policy,
                                      iconColor: AllColors.darkYellow,
                                      containerColor: AllColors.lightYellow),
                                  const SizedBox(width: 8,),

                                  DBLeadsRow(
                                      count: '15 Leads',
                                      statusText: 'Pending',
                                      countColor: AllColors.grey,
                                      statusColor: AllColors.blackColor,
                                      icon: Icons.title,
                                      iconColor: AllColors.darkGreen,
                                      containerColor: AllColors.lightGreen),
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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                InkWell(
                                  onTap: (){},
                                  child: Text('See all',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AllColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 11, color: AllColors.vividPurple,)
                              ],
                            ),
                          ),

                          const SizedBox(height: 20,),

                          LatestCustomersCard(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AllColors.lightPink,
                            circleColorTwo: AllColors.lighterPurple,
                            circleTextColorTwo: AllColors.mediumPurple,
                            circleTextColorOne: AllColors.darkPink,),

                          LatestCustomersCard(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AllColors.lightPink,
                            circleColorTwo: AllColors.lighterPurple,
                            circleTextColorTwo: AllColors.mediumPurple,
                            circleTextColorOne: AllColors.darkPink,),

                          LatestCustomersCard(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AllColors.lightPink,
                            circleColorTwo: AllColors.lighterPurple,
                            circleTextColorTwo: AllColors.mediumPurple,
                            circleTextColorOne: AllColors.darkPink,),

                          LatestCustomersCard(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AllColors.lightPink,
                            circleColorTwo: AllColors.lighterPurple,
                            circleTextColorTwo: AllColors.mediumPurple,
                            circleTextColorOne: AllColors.darkPink,),

                          LatestCustomersCard(
                            title: 'Dermi Derm',
                            subtitle: 'AYUSH GOYAL',
                            date: '26 May, 2024 at 12:30 pm',
                            circleColorOne: AllColors.lightPink,
                            circleColorTwo: AllColors.lighterPurple,
                            circleTextColorTwo: AllColors.mediumPurple,
                            circleTextColorOne: AllColors.darkPink,),


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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                Icon(Icons.list, color: AllColors.lightGrey,size: 17,),

                                const SizedBox(width: 10,),

                                Text('List',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w300,
                                    color: AllColors.grey,
                                  ),
                                ),

                                const SizedBox(width: 10,),

                                Icon(Icons.pie_chart, color: AllColors.vividBlue,size: 12,),

                                const SizedBox(width: 5,),

                                InkWell(
                                  onTap: (){},
                                  child: Text('Chart',
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
                            height: Get.height/5,
                            width: Get.width/1.05,
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
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    color: AllColors.blackColor,
                                  ),
                                ),

                                const Spacer(),

                                InkWell(
                                  onTap: (){},
                                  child: Text('See all',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w300,
                                      color: AllColors.vividPurple,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4,),

                                Icon(Icons.arrow_forward_ios, size: 10, color: AllColors.vividPurple,)
                              ],
                            ),
                          ),

                          const SizedBox(height:20,),

                          const TransactionListCard(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const TransactionListCard(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const TransactionListCard(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const TransactionListCard(
                              title: 'Premium 60 Packages Self Done...',
                              name: 'Prakash shah',
                              amount: '₹4000',
                              subtitle: '25 May, 2024 at 12:30 pm'),

                          const TransactionListCard(
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









