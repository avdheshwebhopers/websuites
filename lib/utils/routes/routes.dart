
import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import 'package:websuites/Views/Customer_screen/customer_activationList_screen.dart';
import 'package:websuites/Views/Order_screen/proforma_list.dart';
import 'package:websuites/Views/bottom_NavBar_screen.dart';
import 'package:websuites/Views/Lead_screen/trash_lead_screen.dart';
import 'package:websuites/Views/payment_reminder.dart';
import 'package:websuites/Views/upcoming_screen.dart';

import '../../Views/all_companies_screen.dart';
import '../../Views/customer_list_screen.dart';
import '../../Views/Customer_screen/customer_myTeam_Screen.dart';
import '../../Views/customers_activities_screen.dart';
import '../../Views/Lead_screen/search_google_leads.dart';
import '../../Views/Lead_screen/lead_master_screen.dart';
import '../../Views/Lead_screen/leadlist_screen.dart';
import '../../Views/order_products_screen.dart';
import '../../Views/Lead_screen/team_lead_screen.dart';
import '../../Views/Order_screen/order_activity_screen.dart';
import '../../Views/Order_screen/orderList_screen.dart';
import '../../Views/activities_screen.dart';
import '../../Views/customer_services_screen.dart';
import '../../Views/forgot_password_screen.dart';
import '../../Views/home_screen.dart';
import '../../Views/login_screen.dart';
import '../../Views/Lead_screen/create_LeadList_screen.dart';
import '../../Views/otp_screen.dart';
import '../../Views/purchase_now_screen.dart';
import '../../Views/splash_screen.dart';
import '../../Views/welcome_to_company.dart';
import '../../views/main_page/MainPage.dart';

class AllRoutes{

  static appRoutes () =>

      [
        GetPage(
        name: RoutesName.splash_screen,
        page: () => SplashScreen(),
    transitionDuration : Duration(milliseconds: 450),
    // transition :Transition.leftToRightWithFade,
    ),


    //WELCOME COMPANY SCREEN
    GetPage(
      name: RoutesName.welcome_company_screen,
      page: () => WelcomeToCompany(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    //OTP SCREEN
    GetPage(
      name: RoutesName.otp_screen,
      page: () => OtpScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    //FORGOT PASSWORD SCREEN
    GetPage(
      name: RoutesName.forgot_password_screen,
      page: () => ForgotPasswordScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    //PURCHASE NOW SCREEN
   GetPage(
      name: RoutesName.purchase_now_screen,
      page: () => PurchaseNowScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

        GetPage(
      name: RoutesName.home_screen,
      page: () => HomeScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.main_page_screen,
      page: () => MainPage(),
      transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
      ),

    GetPage(
      name: RoutesName.login_screen,
      page: () => LoginScreen(),
      transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
    ),


        //======================================================================

    GetPage(
      name: RoutesName.lead_list_screen,
      page: () => LeadListScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.upcoming_screen,
      page: () => UpcomingScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.createNewLead_screen,
      page: () => Create_LeadList_screen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.search_google_leads_screen,
      page: () => SearchGoogleLeads(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.LeadActivities_screen,
      page: () => LeadActivities_Screen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.teamLead_screen,
      page: () => TeamLeadScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.trashLead_screen,
      page: () => TrashLeadScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.leadMaster_screen,
      page: () => LeadMasterScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

        //======================================================================
        //

    GetPage(
      name: RoutesName.customerList_screen,
      page: () => CustomersListScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

        GetPage(
          name: RoutesName.customerActivities_screen,
          page: () => CustomersActivitiesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

    GetPage(
      name: RoutesName.bottomNavBar_screen,
      page: () => BottomNavBarScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),


        GetPage(
          name: RoutesName.AllCompanies_screen,
          page: () => AllCompaniesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.AllServices_screen,
          page: () => AllServicesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.OrderProducts_screen,
          page: () => OrderProductsScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.payment_reminder,
          page: () => CustomerPaymentReminders(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customerMyTeam,
          page: () => CustomerMyTeamScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customerMyTeam,
          page: () => CustomerMyTeamScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customerActivationList,
          page: () => CustomerActivationListScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        //======================================================================
        // Order Screens

        GetPage(
          name: RoutesName.orderListScreen,
          page: () => OrderListScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.orderActivityScreen,
          page: () => OrderActivityScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.orderProformaList,
          page: () => OrderProformaList(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),
















      ];
}