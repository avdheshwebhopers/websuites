import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../Data/response/status.dart';
import '../../../Resources/Assets/app_images.dart';
import '../../../Resources/components/app_colors.dart';
import '../../../View_model/controllers/Login_view_model/login_view_model.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_Count_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_latestCustomers_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_latestTask_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_leadSource_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_leads_by_typeCount_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_transactions_ViewModel.dart';
import '../../../View_model/controllers/userlist_viewmodel/userlist_viewModel.dart';
import '../../../resources/Assets/app_fonts.dart';
import '../../../resources/app_strings/app_strings.dart';
import '../../../resources/app_textstyles/App_TextStyle.dart';
import '../../../resources/components/Cards/app_cards_1.dart';
import '../../../resources/components/Cards/app_cards_2.dart';
import '../../../resources/components/Cards/app_cards_3.dart';
import '../../../resources/components/Containers/app_row_container1.dart';
import '../../../resources/components/Containers/app_row_container2.dart';
import '../../../resources/components/Drawer/AppDrawer.dart';



class MyMobileBody extends StatefulWidget {
 final dynamic name;


 MyMobileBody({
     required this.name,

     super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {

  final DashboardLeadsByTypeCountViewModel _dBLeadCountController = Get.put(DashboardLeadsByTypeCountViewModel());
  final DashboardCountViewModel _DbCountController = Get.put(DashboardCountViewModel());
  final UserlistViewModel _userlistController = Get.put(UserlistViewModel());
  // final DbLeadListViewModel _DBLeadListController = Get.put(DbLeadListViewModel());
  final DashboardViewModel _dashboardController = Get.put(DashboardViewModel());
  final DB_LatestCustomers_ViewModel _latestCustomersController = Get.put(DB_LatestCustomers_ViewModel());
  final Dashboard_LeadSource_ViewModel _leadSourceController = Get.put(Dashboard_LeadSource_ViewModel());
  final DbTransactionsViewmodel _transactionsController = Get.put(DbTransactionsViewmodel());
  final GlobalKey <ScaffoldState> _globalKey =  GlobalKey<ScaffoldState>();
  final DbLatestTaskViewModel _latestTaskController = Get.put(DbLatestTaskViewModel());
  final LoginViewModel _loginController = Get.put(LoginViewModel());



  @override
  void initState(){
    super.initState();

    _loginController.login(context);

    _userlistController.UserList(BuildContext, context);
    _dashboardController.dashboard(context);
    _DbCountController.DBCount(context);
    _dBLeadCountController.DBLeadsByTypeCount(context);
    // _DBLeadListController.DB_LeadList(context);
    _leadSourceController.LeadSource(BuildContext, context);
    _latestCustomersController.DB_LatestCustomers(context);
    _transactionsController.Db_transactions(context);
    _latestTaskController.DBLatestTask(context);

    print('MobileBodyInitState');
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
          key: _globalKey,
          backgroundColor: AppColors.whiteColor,
          drawer: Container(
              color: AppColors.whiteColor,
              width: Get.width/1.8,
              height: Get.height*1,
              child:
              AppDrawer(
                  userName: 'Sunil Kumar',
                  phoneNumber: '+91-8810539227',
                  version: 'version 1.0.12')),
          body: Obx(() {
            switch (_loginController.statusCode.value) {
              case Status.LOADING :
                return Center(child: CircularProgressIndicator());
              case Status.ERROR :
                return Text('error');
              case Status.COMPLETED :
                return Column(
                  children: [
                    Expanded(
                      child:
                      SingleChildScrollView(
                        child:
                        Column(
                          children:[
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  height: Get.height/4.3,
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
                                      Container(
                                        // color: Colors.blue,
                                        margin: EdgeInsets.only(left: 8, right: 15, bottom: Get.height/40, top: Get.height/15),
                                        child:
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: (){
                                                _globalKey.currentState?.openDrawer();
                                              },
                                              icon: const Icon(Icons.menu),
                                              iconSize: 35,
                                              color: AppColors.whiteColor,),

                                            const SizedBox(width: 6),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${widget.name}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    fontFamily: AppFonts.nunitoRegular,
                                                    color: AppColors.whiteColor,
                                                  ),),

                                                Text('24 May, 2024, 12:45 AM ',
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
                                                  Image.asset(AppImages.WelcomeCompanyLogo, scale: 5.5,)
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                          child:
                                          Row(                                                    //SCROLLER ROW WITH CONTAINERS
                                            children: [
                                              AppRowContainerOne(
                                                // height: Get.height/9,
                                                // width: Get.width/3,
                                                backgroundColor: AppColors.whiteColor,
                                                icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                amount: '₹20000',
                                                title: 'Total revenue',
                                                subtitle: '4% (30 days)',),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
                                                  amount: '₹20000',
                                                  title: 'Total revenue',
                                                  subtitle: '4% (30 days)'),


                                              AppRowContainerOne(
                                                  backgroundColor: AppColors.whiteColor,
                                                  icon: Icons.currency_rupee, size: 15, color:AppColors.mediumPurple,
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
                            const SizedBox(height: 20,),

                            Container(
                              // color: Colors.grey,
                              margin: const EdgeInsets.only(left: 10, right: 8,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [

                                  const Icon(Icons.list_alt_outlined, size: 16,),

                                  const SizedBox(width: 8,),

                                  AppTextStyle.HomeTaskPerformance(context, AppStrings.Home_TaskPerformance),

                                  const Spacer(),

                                  AppTextStyle.HomeTaskDate(context, AppStrings.Home_TaskPerformanceDate),

                                  const Icon(Icons.arrow_drop_down, size: 30,)

                                ],
                              ),
                            ), // ROW BAR

                            const SizedBox(height: 8,),

                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              margin: const EdgeInsets.only(right: 6, left: 6),
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
                                    offset: const Offset(0, 0),
                                  ),
                                ],),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
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
                                      lineWidth: 10,
                                      radius: 65,
                                      percent: 0.4,
                                      startAngle: 0,
                                      animation: true,
                                      animationDuration: 2000,
                                      // backgroundWidth: 30,
                                      curve: Curves.decelerate,
                                      circularStrokeCap: CircularStrokeCap.round,
                                      center: Container(
                                        height: Get.height/7,
                                        width: Get.width/4.7,
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
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            AppTextStyle.HomeCompleted(context, AppStrings.Home_Completed),

                                            // SizedBox(height: 5,),

                                            const Text('40%',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: AppFonts.nunitoRegular,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),



                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppTextStyle.HomeTaskProgress(context, AppStrings.Home_TaskProgress),

                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          const Text('06:06:15 /',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: AppFonts.nunitoRegular,
                                              fontWeight: FontWeight.w600,
                                            ),),

                                          SizedBox(width: 5,),

                                          Text('4hrs',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: AppFonts.nunitoRegular,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.vividPurple,
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

                                  AppTextStyle.HomeLatestTask(context, AppStrings.Home_LatestTask),

                                  const Spacer(),

                                  InkWell(
                                    onTap: (){},
                                    child: AppTextStyle.HomeSeeAll(context, AppStrings.Home_LatestTaskSeeAll),
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


                            AppCardOne(
                                title: 'Designing Task',
                                subtitle: 'Somacare inner Images',
                                date: '15 May, 2024 at 12:30 pm',
                                ContainerIcon: Icons.access_time,
                                IconColor: AppColors.darkGreen,
                                statusBackgroundColor: AppColors.lightGreen,
                                statusText: 'In Progress'),


                            AppCardOne(
                                title: 'Designing Task',
                                subtitle: 'Somacare inner Images',
                                date: '15 May, 2024 at 12:30 pm',
                                ContainerIcon: Icons.access_time,
                                IconColor: AppColors.darkBlue,
                                statusBackgroundColor: AppColors.lightBlue,
                                statusText: 'In Progress'),


                            AppCardOne(
                                title: 'Designing Task',
                                subtitle: 'Somacare inner Images',
                                date: '15 May, 2024 at 12:30 pm',
                                ContainerIcon: Icons.access_time,
                                IconColor: AppColors.darkRed,
                                statusBackgroundColor: AppColors.lightRed,
                                statusText: 'In Progress'),


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

                                  AppTextStyle.HomeLeadTypeCount(context, AppStrings.Home_LeadTypeCount),

                                  const Spacer(),

                                  AppTextStyle.HomeLeadTypeDate(context, AppStrings.Home_LeadTypeDate),

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

                                    AppRowContainerTwo(
                                        count: '15 Leads',
                                        statusText: 'Pending',
                                        countColor: AppColors.grey,
                                        statusColor: AppColors.blackColor,
                                        icon: Icons.task,
                                        iconColor: AppColors.skyBlue,
                                        containerColor: AppColors.lightBlue),

                                    AppRowContainerTwo(
                                        count: '15 Leads',
                                        statusText: 'Pending',
                                        countColor: AppColors.grey,
                                        statusColor: AppColors.blackColor,
                                        icon: Icons.account_balance_rounded,
                                        iconColor: AppColors.grassGreen,
                                        containerColor: AppColors.lightGreen),

                                    AppRowContainerTwo(
                                        count: '15 Leads',
                                        statusText: 'Pending',
                                        countColor: AppColors.grey,
                                        statusColor: AppColors.blackColor,
                                        icon: Icons.timelapse,
                                        iconColor: AppColors.mediumPurple,
                                        containerColor: AppColors.lighterPurple),

                                    AppRowContainerTwo(
                                        count: '15 Leads',
                                        statusText: 'Pending',
                                        countColor: AppColors.grey,
                                        statusColor: AppColors.blackColor,
                                        icon: Icons.place,
                                        iconColor: AppColors.darkRed,
                                        containerColor: AppColors.lightRed),

                                    AppRowContainerTwo(
                                        count: '15 Leads',
                                        statusText: 'Pending',
                                        countColor: AppColors.grey,
                                        statusColor: AppColors.blackColor,
                                        icon: Icons.policy,
                                        iconColor: AppColors.darkYellow,
                                        containerColor: AppColors.lightYellow),

                                    AppRowContainerTwo(
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
                            const SizedBox(height: 10,),

                            Container(
                              // color: Colors.grey,
                              margin: const EdgeInsets.only(left: 10, right: 12,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.list_alt_outlined, size: 16,),

                                  const SizedBox(width: 6,),

                                  AppTextStyle.HomeLatestCustomer(context, AppStrings.Home_LatestCustomer),

                                  const Spacer(),

                                  InkWell(
                                    onTap: (){},
                                    child: AppTextStyle.HomeLatestCustomerSeeAll(context, AppStrings.Home_LatestCustomerSeeAll),
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

                                  AppTextStyle.HomeLeadSource(context, AppStrings.Home_LeadSource),

                                  const Spacer(),

                                  Icon(Icons.list, color: AppColors.lightGrey,size: 17,),

                                  const SizedBox(width: 10,),

                                  AppTextStyle.HomeLeadSourceList(context, AppStrings.Home_LeadSourceList),

                                  const SizedBox(width: 10,),

                                  Icon(Icons.pie_chart, color: AppColors.skyBlue,size: 12,),

                                  const SizedBox(width: 5,),

                                  InkWell(
                                    onTap: (){},
                                    child: AppTextStyle.HomeLeadSourceChart(context, AppStrings.Home_LeadSourceChart),
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
                                    color: AppColors.lightGrey
                                ),
                              )
                              ),
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

                                  AppTextStyle.HomeTransactions(context, AppStrings.Home_Transactions),

                                  const Spacer(),

                                  InkWell(
                                    onTap: (){},
                                    child:
                                    AppTextStyle.HomeTransactionsSeeAll(context, AppStrings.Home_TransactionsSeeAll),
                                  ),

                                  const SizedBox(width: 4,),

                                  Icon(Icons.arrow_forward_ios, size: 10, color: AppColors.vividPurple,)
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
                );

            } return Container();


          }),





       );

  }
}
