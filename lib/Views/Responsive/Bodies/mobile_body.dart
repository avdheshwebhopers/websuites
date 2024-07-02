import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';
import '../../../Data/models/Response_model/LoginResponseModel.dart';
import '../../../Data/response/status.dart';
import '../../../Resources/Assets/app_fonts.dart';
import '../../../Resources/Assets/app_images.dart';
import '../../../Resources/app_strings/app_strings.dart';
import '../../../Resources/app_textstyles/App_TextStyle.dart';
import '../../../Resources/components/Cards/DashboardScreen_Card/app_cards_1.dart';
import '../../../Resources/components/Cards/DashboardScreen_Card/app_cards_2.dart';
import '../../../Resources/components/Containers/app_row_container1.dart';
import '../../../Resources/components/Containers/app_row_container2.dart';
import '../../../Resources/components/Drawer/AppDrawer.dart';
import '../../../Resources/components/app_colors.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_latestTask_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_leadSource_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_leads_by_typeCount_ViewModel.dart';
import '../../../View_model/controllers/dashboard_viewModels/DB_transactions_ViewModel.dart';



class MyMobileBody extends StatefulWidget {
  // final dynamic name;


  MyMobileBody({
    // required this.name,

    super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  final GlobalKey <ScaffoldState> _globalKey =  GlobalKey<ScaffoldState>();



  final DashboardLeadsByTypeCountViewModel _dBLeadTypeCountController = Get.put(DashboardLeadsByTypeCountViewModel());
  // final DashboardCountViewModel _DbCountController = Get.put(DashboardCountViewModel());
  // final UserlistViewModel _userlistController = Get.put(UserlistViewModel());
  // // final DbLeadListViewModel _DBLeadListController = Get.put(DbLeadListViewModel());
  // final DashboardViewModel _dashboardController = Get.put(DashboardViewModel());
  // final DB_LatestCustomers_ViewModel _latestCustomersController = Get.put(DB_LatestCustomers_ViewModel());
  final Dashboard_LeadSource_ViewModel _leadSourceController = Get.put(Dashboard_LeadSource_ViewModel());
  final DbTransactionsViewmodel _transactionsController = Get.put(DbTransactionsViewmodel());
  final DbLatestTaskViewModel _latestTaskController = Get.put(DbLatestTaskViewModel());




  String userName = '';
  String? userEmail = "";
  SaveUserData userPreference = SaveUserData();
  DateTime dateTime = DateTime.now();



  @override
  void initState(){
    super.initState();
    fetchUserData();

    // _userlistController.UserList(BuildContext, context);
    // _dashboardController.dashboard(context);
    // _DbCountController.DBCount(context);
    _dBLeadTypeCountController.DBLeadsByTypeCount(context);
    // // _DBLeadListController.DB_LeadList(context);
    _leadSourceController.LeadSource(BuildContext, context);
    // _latestCustomersController.DB_LatestCustomers(context);
    _transactionsController.Db_transactions(BuildContext, context);
    _latestTaskController.Db_LatestTask(BuildContext, context);

    print('MobileBodyInitState');
  }

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
              userName: '$userName',
              phoneNumber: '$userEmail',
              version: 'version 1.0.12')),
      body: Column(
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
                                            Text( '$userName',
                                          style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                fontFamily: AppFonts.nunitoRegular,
                                                color: AppColors.whiteColor,
                                              ),),

                                            Text('${dateTime.day}/${dateTime.month}/${dateTime.year}, ''${dateTime.hour}:${dateTime.minute}pm',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
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

                        // Obx((){
                        // return
                        //   AppCardOne(
                        //       title: _latestTaskController.LatestTaskModel.value.items![0].subject.toString(),
                        //       subtitle: 'Somacare inner Images',
                        //       date: '15 May, 2024 at 12:30 pm',
                        //       ContainerIcon: Icons.access_time,
                        //       IconColor: AppColors.vividPink,
                        //       statusBackgroundColor: AppColors.lightPink,
                        //       statusText: 'In Progress');}
                        // ),

                        //
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
                                // Obx(() {
                                //   switch (_dBLeadTypeCountController.rxStatus.value) {
                                //     case Status.LOADING :
                                //       return CircularProgressIndicator();
                                //     case Status.ERROR :
                                //       return Text(_dBLeadTypeCountController.error.toString());
                                //     case Status.COMPLETED :
                                //       return
                                //         AppRowContainerTwo(
                                //             count: '_dBLeadTypeCountController.Db_LeadTypeCountModel.value.name.toString()',
                                //             statusText: '_dBLeadTypeCountController.Db_LeadTypeCountModel.value.status.toString()',
                                //             countColor: AppColors.grey,
                                //             statusColor: AppColors.blackColor,
                                //             icon: Icons.access_time,
                                //             iconColor: AppColors.vividPink,
                                //             containerColor: AppColors
                                //                 .lightPink);
                                //   };
                                //   return SizedBox();
                                // }),

                                AppRowContainerTwo(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AppColors.grey,
                                    statusColor: AppColors.blackColor,
                                    icon: Icons.task,
                                    iconColor: AppColors.vividBlue,
                                    containerColor: AppColors.lightBlue),
                                //
                                AppRowContainerTwo(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AppColors.grey,
                                    statusColor: AppColors.blackColor,
                                    icon: Icons.account_balance_rounded,
                                    iconColor: AppColors.vividGreen,
                                    containerColor: AppColors.lightGreen),
                                //
                                AppRowContainerTwo(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AppColors.grey,
                                    statusColor: AppColors.blackColor,
                                    icon: Icons.timelapse,
                                    iconColor: AppColors.mediumPurple,
                                    containerColor: AppColors.lighterPurple),
                                //
                                // AppRowContainerTwo(
                                //     count: '15 Leads',
                                //     statusText: 'Pending',
                                //     countColor: AppColors.grey,
                                //     statusColor: AppColors.blackColor,
                                //     icon: Icons.place,
                                //     iconColor: AppColors.darkRed,
                                //     containerColor: AppColors.lightRed),
                                //
                                // AppRowContainerTwo(
                                //     count: '15 Leads',
                                //     statusText: 'Pending',
                                //     countColor: AppColors.grey,
                                //     statusColor: AppColors.blackColor,
                                //     icon: Icons.policy,
                                //     iconColor: AppColors.darkYellow,
                                //     containerColor: AppColors.lightYellow),
                                //
                                // AppRowContainerTwo(
                                //     count: '15 Leads',
                                //     statusText: 'Pending',
                                //     countColor: AppColors.grey,
                                //     statusColor: AppColors.blackColor,
                                //     icon: Icons.title,
                                //     iconColor: AppColors.darkGreen,
                                //     containerColor: AppColors.lightGreen
                                // ),

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

                              Icon(Icons.pie_chart, color: AppColors.vividBlue,size: 12,),

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

                        // Obx((){
                        //   switch (_transactionsController.transactionList.value){
                        //     case Status.LOADING :
                        //       return CircularProgressIndicator();
                        //     case Status.ERROR :
                        //       return Text(_transactionsController.error.toString());
                        //     case Status.COMPLETED :
                        //       return Transaction_list_Widget(
                        //   title: '_transactionsController.transactionList.value.meta!.itemCount.toString(),',
                        //   name: _transactionsController.transactionList.value.meta!.itemsPerPage.toString(),
                        //   amount: _transactionsController.transactionList.value.meta!.totalAmount.toString(),
                        //   subtitle: _transactionsController.transactionList.value.meta!.totalPages.toString()
                        //       );}
                        //   return SizedBox();
                        // }),

                    // Transaction_list_Widget(
                    //   title: _transactionsController.transactionList.value.meta!.itemCount.toString(),
                    //   name: _transactionsController.transactionList.value.meta!.itemsPerPage.toString(),
                    //   amount: _transactionsController.transactionList.value.meta!.totalAmount.toString(),
                    //   subtitle: _transactionsController.transactionList.value.meta!.totalPages.toString()),


                        // const Transaction_list_Widget(
                        //     title: 'Premium 60 Packages Self Done...',
                        //     name: 'Prakash shah',
                        //     amount: '₹4000',
                        //     subtitle: '25 May, 2024 at 12:30 pm'),
                        //
                        //
                        // const Transaction_list_Widget(
                        //     title: 'Premium 60 Packages Self Done...',
                        //     name: 'Prakash shah',
                        //     amount: '₹4000',
                        //     subtitle: '25 May, 2024 at 12:30 pm'),
                        //
                        //
                        // const Transaction_list_Widget(
                        //     title: 'Premium 60 Packages Self Done...',
                        //     name: 'Prakash shah',
                        //     amount: '₹4000',
                        //     subtitle: '25 May, 2024 at 12:30 pm'),
                        //
                        //
                        // const Transaction_list_Widget(
                        //     title: 'Premium 60 Packages Self Done...',
                        //     name: 'Prakash shah',
                        //     amount: '₹4000',
                        //     subtitle: '25 May, 2024 at 12:30 pm'),
                      ],
                    ),
                  ),
                ),
              ],
      ),


    );
  }
}
