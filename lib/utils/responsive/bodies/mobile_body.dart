import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../data/models/responseModels/login.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/imageStrings/image_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../viewModels/homeScreen/lead_source.dart';
import '../../../viewModels/homeScreen/leads_by_type_count.dart';
import '../../../viewModels/homeScreen/transactions.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../../views/homeScreen/widgets/cards/latest_customers_card.dart';
import '../../../views/homeScreen/widgets/cards/latest_task_card.dart';
import '../../../views/homeScreen/widgets/cards/lead_type_count_card.dart';
import '../../../views/homeScreen/widgets/cards/revenue_card.dart';
import '../../../views/homeScreen/widgets/cards/transaction_list_card.dart';
import '../../appColors/app_colors.dart';
import '../../components/widgets/drawer/custom_drawer.dart';
import '../../components/widgets/navBar/custom_navBar.dart';
import '../../components/widgets/navBar/floatingActionButton/floating_action_button.dart';




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



  final HomeScreenLeadsByTypeCountViewModel _dBLeadTypeCountController = Get.put(HomeScreenLeadsByTypeCountViewModel());
  // final DashboardCountViewModel _DbCountController = Get.put(DashboardCountViewModel());
  // final UserlistViewModel _userlistController = Get.put(UserlistViewModel());
  // // final DbLeadListViewModel _DBLeadListController = Get.put(DbLeadListViewModel());
  // final DashboardViewModel _dashboardController = Get.put(DashboardViewModel());
  // final DB_LatestCustomers_ViewModel _latestCustomersController = Get.put(DB_LatestCustomers_ViewModel());
  final HomeScreenLeadSourceViewModel _leadSourceController = Get.put(HomeScreenLeadSourceViewModel());
  final HomeScreenTransactionsViewmodel _transactionsController = Get.put(HomeScreenTransactionsViewmodel());
  // final HomeScreenLatestTaskViewModel _latestTaskController = Get.put(HomeScreenLatestTaskViewModel());


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
    // _latestTaskController.Db_LatestTask(BuildContext, context);

    print('MobileBodyInitState');
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
  Widget build(BuildContext context){

    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
          onPressed: (){},
          imageIcon: IconStrings.navSearch3,
          backgroundColor: AllColors.mediumPurple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: 'version 1.0.12'),
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
                                          color: AllColors.whiteColor,),

                                        const SizedBox(width: 6),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text( '$userName',
                                          style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                  
                                                color: AllColors.whiteColor,
                                              ),),

                                            Text('${dateTime.day}/${dateTime.month}/${dateTime.year}, ''${dateTime.hour}:${dateTime.minute}pm',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                                  
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
                                              InkWell(
                                                onTap: (){

                                                },
                                                  child: Image.asset(ImageStrings. welcomeCompanyLogo, scale: 5.5,))
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
                                          RevenueCard(
                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)',),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                              amount: '₹20000',
                                              title: 'Total revenue',
                                              subtitle: '4% (30 days)'),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                              amount: '₹20000',
                                              title: 'Total revenue',
                                              subtitle: '4% (30 days)'),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                              amount: '₹20000',
                                              title: 'Total revenue',
                                              subtitle: '4% (30 days)'),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                              amount: '₹20000',
                                              title: 'Total revenue',
                                              subtitle: '4% (30 days)'),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                              amount: '₹20000',
                                              title: 'Total revenue',
                                              subtitle: '4% (30 days)'),

                                          RevenueCard(
                                              backgroundColor: AllColors.whiteColor,
                                              icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
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

                              TextStyles.w500_14(color: AllColors.blackColor, context, Strings.taskPerformance),

                              const Spacer(),

                              TextStyles.w300_12(color: AllColors.blackColor, context, Strings.taskPerformanceDate),

                              const Icon(Icons.arrow_drop_down, size: 30,)

                            ],
                          ),
                        ), // ROW BAR

                        const SizedBox(height: 8,),

                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(right: 6, left: 6),
                          decoration: BoxDecoration(
                            color: AllColors.whiteColor,
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
                                  color: AllColors.whiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow:[
                                    BoxShadow(
                                      color: AllColors.vividPurple.withOpacity(0.10),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),

                                child:
                                CircularPercentIndicator(
                                  progressColor: AllColors.mediumPurple,
                                  backgroundColor: AllColors.lighterPurple,
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
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TextStyles.w600_universal(fontSize: 10,context, Strings.completed),

                                        // SizedBox(height: 5,),

                                        const Text('40%',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                              
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
                                  TextStyles.w600_15(context, Strings.taskProgress),

                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      const Text('06:06:15 /',
                                        style: TextStyle(
                                          fontSize: 11,
                                            
                                          fontWeight: FontWeight.w600,
                                        ),),

                                      SizedBox(width: 5,),

                                      Text('4hrs',
                                        style: TextStyle(
                                          fontSize: 10,
                                            
                                          fontWeight: FontWeight.w600,
                                          color: AllColors.vividPurple,
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

                              TextStyles.w500_14(color: AllColors.blackColor, context, Strings.latestTask),

                              const Spacer(),

                              InkWell(
                                onTap: (){},
                                child:
                                TextStyles.w300_12(color: AllColors.vividPurple, context, Strings.latestTaskSeeAll),
                              ),

                              const SizedBox(width: 4,),
                              Icon(Icons.arrow_forward_ios, size: 10, color: AllColors.vividPurple,)
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
                        LatestTaskCard(
                            title: 'Designing Task',
                            subtitle: 'Somacare inner Images',
                            date: '15 May, 2024 at 12:30 pm',
                            ContainerIcon: Icons.access_time,
                            IconColor: AllColors.darkGreen,
                            statusBackgroundColor: AllColors.lightGreen,
                            statusText: 'In Progress'),


                        LatestTaskCard(
                            title: 'Designing Task',
                            subtitle: 'Somacare inner Images',
                            date: '15 May, 2024 at 12:30 pm',
                            ContainerIcon: Icons.access_time,
                            IconColor: AllColors.darkBlue,
                            statusBackgroundColor: AllColors.lightBlue,
                            statusText: 'In Progress'),


                        LatestTaskCard(
                            title: 'Designing Task',
                            subtitle: 'Somacare inner Images',
                            date: '15 May, 2024 at 12:30 pm',
                            ContainerIcon: Icons.access_time,
                            IconColor: AllColors.darkRed,
                            statusBackgroundColor: AllColors.lightRed,
                            statusText: 'In Progress'),


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

                              TextStyles.w500_14(color: AllColors.blackColor, context, Strings.leadTypeCount),

                              const Spacer(),

                              TextStyles.w300_12(color: AllColors.blackColor, context, Strings.leadTypeDate),

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

                                LeadTypeCountCard(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AllColors.grey,
                                    statusColor: AllColors.blackColor,
                                    icon: Icons.task,
                                    iconColor: AllColors.vividBlue,
                                    containerColor: AllColors.lightBlue),
                                //
                                LeadTypeCountCard(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AllColors.grey,
                                    statusColor: AllColors.blackColor,
                                    icon: Icons.account_balance_rounded,
                                    iconColor: AllColors.vividGreen,
                                    containerColor: AllColors.lightGreen),
                                //
                                LeadTypeCountCard(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AllColors.grey,
                                    statusColor: AllColors.blackColor,
                                    icon: Icons.timelapse,
                                    iconColor: AllColors.mediumPurple,
                                    containerColor: AllColors.lighterPurple),

                                LeadTypeCountCard(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AllColors.grey,
                                    statusColor: AllColors.blackColor,
                                    icon: Icons.place,
                                    iconColor: AllColors.darkRed,
                                    containerColor: AllColors.lightRed),

                                LeadTypeCountCard(
                                    count: '15 Leads',
                                    statusText: 'Pending',
                                    countColor: AllColors.grey,
                                    statusColor: AllColors.blackColor,
                                    icon: Icons.policy,
                                    iconColor: AllColors.darkYellow,
                                    containerColor: AllColors.lightYellow),

                                LeadTypeCountCard(
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
                        const SizedBox(height: 10,),

                        Container(
                          // color: Colors.grey,
                          margin: const EdgeInsets.only(left: 10, right: 12,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.list_alt_outlined, size: 16,),

                              const SizedBox(width: 6,),

                              TextStyles.w500_14(color: AllColors.blackColor, context, Strings.latestCustomer),

                              const Spacer(),

                              InkWell(
                                onTap: (){},
                                child:
                                TextStyles.w300_12(color: AllColors.vividPurple, context, Strings.latestCustomerSeeAll),
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

                              TextStyles.w500_14(color: AllColors.blackColor, context, Strings.leadSource),

                              const Spacer(),

                              Icon(Icons.list, color: AllColors.lightGrey,size: 17,),

                              const SizedBox(width: 10,),

                              TextStyles.w300_12(color: AllColors.grey, context, Strings.leadSourceList),

                              const SizedBox(width: 10,),

                              Icon(Icons.pie_chart, color: AllColors.vividBlue,size: 12,),

                              const SizedBox(width: 5,),

                              InkWell(
                                onTap: (){},
                                child:
                                TextStyles.w400_12(color: AllColors.vividBlue, context, Strings.leadSourceChart),
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
                                color: AllColors.lightGrey
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

                              TextStyles.w500_14_Black(context, Strings.transactions),

                              const Spacer(),

                              InkWell(
                                onTap: (){},
                                child:
                                TextStyles.w300_12(color: AllColors.vividPurple, context, Strings.transactionsSeeAll),
                              ),

                              const SizedBox(width: 4,),

                              Icon(Icons.arrow_forward_ios, size: 10, color: AllColors.vividPurple,)
                            ],
                          ),
                        ),

                        const SizedBox(height:20,),

                        // Obx((){
                        //   switch (_transactionsController.rxStatus.value){
                        //     case Status.loading :
                        //       return CircularProgressIndicator();
                        //     case Status.error :
                        //       return Text(_transactionsController.error.toString());
                        //     case Status.completed :
                        //       return
                        //         TransactionListCard(
                        //   title: _transactionsController.transactionList.value.meta!.itemCount.toString(),
                        //   name: _transactionsController.transactionList.value.meta!.itemsPerPage.toString(),
                        //   amount: _transactionsController.transactionList.value.meta!.totalAmount.toString(),
                        //   subtitle: _transactionsController.transactionList.value.meta!.totalPages.toString()
                        //       );
                        //   }
                        // }
                        // ),

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
      ),


    );
  }
}
