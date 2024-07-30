import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../resources/imageStrings/image_strings.dart';
import '../../../views/homeScreen/widgets/cards/latest_customers_card.dart';
import '../../../views/homeScreen/widgets/cards/latest_task_card.dart';
import '../../../views/homeScreen/widgets/cards/lead_type_count_card.dart';
import '../../../views/homeScreen/widgets/cards/revenue_card.dart';
import '../../../views/homeScreen/widgets/cards/transaction_list_card.dart';
import '../../appColors/app_colors.dart';
import '../../components/buttons/common_button.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body:
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
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
                              padding: const EdgeInsets.only(left: 13),
                              height: Get.height/9,
                              child: Row(

                                children: [
                                  Container(
                                    height: Get.height/15,
                                    width: Get.width/15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.whiteColor,
                                    ),
                                    child: Center(
                                        child: Image.asset(ImageStrings.splashWHLogo)),
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
                                            

                                        ),),
                                      Text('+91-8810529887',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                              
                                            color: Colors.grey
                                        ),),
                                    ],
                                  )
                                ],),
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
                                        
                                      fontSize: 10,
                                      color: AllColors.grey
                                  ),)
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              child: CommonButton(
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
              color: AllColors.lightGrey,
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
                                AllColors.appBarColorTop,
                                AllColors.appBarColorBottom,
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

                                        const Spacer(),

                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AllColors.whiteColor,
                                          ),
                                          height: Get.height/13,
                                          width: Get.width/13,
                                          child: Center(
                                              child:
                                              Image.asset(ImageStrings. welcomeCompanyLogo, scale: 7,)
                                          ),
                                        ),
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
                                        RevenueCard(
                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
                                            amount: '₹20000',
                                            title: 'Total revenue',
                                            subtitle: '4% (30 days)'),

                                        const SizedBox(width: 11,),
                                        RevenueCard(
                                            // height: Get.height/11,
                                            // width: Get.width/4,

                                            backgroundColor: AllColors.whiteColor,
                                            icon: Icons.currency_rupee, size: 15, color:AllColors.mediumPurple,
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
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Text('24 May, 2024',
                            style: TextStyle(
                              fontSize: 14,
                                
                              fontWeight: FontWeight.w300,
                              color: AllColors.blackColor,
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
                                elevation: 18,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0), // Half of the width/height to make it a circle
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
                                                
                                              fontSize: 15,
                                            ),),

                                          // SizedBox(height: 5,),

                                          Text('65%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                                
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
                                      
                                    fontWeight: FontWeight.w600,
                                  ),),

                                Row(
                                  children: [
                                    Text('06:06:15/',
                                      style: TextStyle(
                                        fontSize: 16,
                                          
                                        fontWeight: FontWeight.w600,
                                      ),),

                                    SizedBox(width: 5,),

                                    Text('4hrs',
                                      style: TextStyle(
                                        fontSize: 16,
                                          
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
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 14,
                                  
                                fontWeight: FontWeight.w400,
                                color: AllColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 12, color: AllColors.vividPurple,)
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
                    SizedBox(height: 12,),

                    LatestTaskCard(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AllColors.darkGreen,
                        statusBackgroundColor: AllColors.lightGreen,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    LatestTaskCard(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AllColors.darkBlue,
                        statusBackgroundColor: AllColors.lightBlue,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    LatestTaskCard(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AllColors.darkRed,
                        statusBackgroundColor: AllColors.lightRed,
                        statusText: 'In Progress'),
                    SizedBox(height: 12,),

                    LatestTaskCard(
                        title: 'Designing Task',
                        subtitle: 'Somacare inner Images',
                        date: '15 May, 2024 at 12:30 pm',
                        ContainerIcon: Icons.access_time,
                        IconColor: AllColors.darkYellow,
                        statusBackgroundColor: AllColors.lightYellow,
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
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Text('21 May',
                            style: TextStyle(
                              fontSize: 14,
                                
                              fontWeight: FontWeight.w300,
                              color: AllColors.blackColor,
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

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.access_time,
                                iconColor: AllColors.vividPink,
                                containerColor: AllColors.lightPink),

                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.task,
                                iconColor: AllColors.vividBlue,
                                containerColor: AllColors.lightBlue),
                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.account_balance_rounded,
                                iconColor: AllColors.vividGreen,
                                containerColor: AllColors.lightGreen),
                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.timelapse,
                                iconColor: AllColors.mediumPurple,
                                containerColor: AllColors.lighterPurple),
                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.place,
                                iconColor: AllColors.darkRed,
                                containerColor: AllColors.lightRed),
                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.policy,
                                iconColor: AllColors.darkYellow,
                                containerColor: AllColors.lightYellow),
                            const SizedBox(width: 10,),

                            LeadTypeCountCard(
                                count: '15 Leads',
                                statusText: 'Pending',
                                countColor: AllColors.grey,
                                statusColor: AllColors.blackColor,
                                icon: Icons.title,
                                iconColor: AllColors.darkGreen,
                                containerColor: AllColors.lightGreen),
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
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 14,
                                  
                                fontWeight: FontWeight.w400,
                                color: AllColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 16, color: AllColors.vividPurple,)
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
                    SizedBox(height: 12,),

                    LatestCustomersCard(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AllColors.lightPink,
                      circleColorTwo: AllColors.lighterPurple,
                      circleTextColorTwo: AllColors.mediumPurple,
                      circleTextColorOne: AllColors.darkPink,),
                    SizedBox(height: 12,),

                    LatestCustomersCard(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AllColors.lightPink,
                      circleColorTwo: AllColors.lighterPurple,
                      circleTextColorTwo: AllColors.mediumPurple,
                      circleTextColorOne: AllColors.darkPink,),
                    SizedBox(height: 12,),

                    LatestCustomersCard(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AllColors.lightPink,
                      circleColorTwo: AllColors.lighterPurple,
                      circleTextColorTwo: AllColors.mediumPurple,
                      circleTextColorOne: AllColors.darkPink,),
                    SizedBox(height: 12,),

                    LatestCustomersCard(
                      title: 'Dermi Derm',
                      subtitle: 'AYUSH GOYAL',
                      date: '26 May, 2024 at 12:30 pm',
                      circleColorOne: AllColors.lightPink,
                      circleColorTwo: AllColors.lighterPurple,
                      circleTextColorTwo: AllColors.mediumPurple,
                      circleTextColorOne: AllColors.darkPink,),
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
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          Icon(Icons.list, color: AllColors.lightGrey,size: 25,),

                          const SizedBox(width: 10,),

                          Text('List',
                            style: TextStyle(
                              fontSize: 16,
                                
                              fontWeight: FontWeight.w300,
                              color: AllColors.grey,
                            ),
                          ),

                          const SizedBox(width: 10,),

                          Icon(Icons.pie_chart, color: AllColors.vividBlue,size: 15,),

                          const SizedBox(width: 5,),

                          InkWell(
                            onTap: (){},
                            child: Text('Chart',
                              style: TextStyle(
                                fontSize: 16,
                                  
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

                          const Icon(Icons.money, size: 25,),

                          const SizedBox(width: 8,),

                          Text('TRANSACTIONS ',
                            style: TextStyle(
                              fontSize: 16,
                                
                              fontWeight: FontWeight.w500,
                              color: AllColors.blackColor,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: (){},
                            child: Text('See all',
                              style: TextStyle(
                                fontSize: 16,
                                  
                                fontWeight: FontWeight.w400,
                                color: AllColors.vividPurple,
                              ),
                            ),
                          ),

                          const SizedBox(width: 4,),

                          Icon(Icons.arrow_forward_ios, size: 12, color: AllColors.vividPurple,)
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
        ),



      );

  }
}
