import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import 'package:websuites/views/customer_screen/customer_service/customer_services_screen.dart';
import 'package:websuites/views/order_screen/order_payments/order_payments_screen.dart';
import 'package:websuites/views/roles_screen/roles_screen.dart';
import 'package:websuites/views/users_screen/users_screen.dart';
import '../../views/bottom_navBar_screen/bottom_navBar_screen.dart';
import '../../views/customer_screen/customer_activationList/customer_activationList_screen.dart';
import '../../views/customer_screen/customer_companies/customer_all_companies_screen.dart';
import '../../views/customer_screen/customer_list/customer_list_screen.dart';
import '../../views/customer_screen/customer_myTeam/customer_myTeam_Screen.dart';
import '../../views/customer_screen/customer_order_products/customer_order_products_screen.dart';
import '../../views/customer_screen/customer_payment_reminder/customer_payment_reminder.dart';
import '../../views/customer_screen/customer_activities/customers_activities_screen.dart';
import '../../views/forgot_password_screen/forgot_password_screen.dart';
import '../../views/home_screen/home_screen.dart';
import '../../views/lead_screen/create_newLead/create_newLead_screen.dart';
import '../../views/lead_screen/lead_activities/lead_activities_screen.dart';
import '../../views/lead_screen/lead_list/leadlist_screen.dart';
import '../../views/lead_screen/lead_master/lead_master_screen.dart';
import '../../views/lead_screen/search_google_leads/search_google_leads.dart';
import '../../views/lead_screen/team_lead/team_lead_screen.dart';
import '../../views/lead_screen/trash_lead/trash_lead_screen.dart';
import '../../views/login_screen/login_screen.dart';
import '../../views/order_screen/order_activity/order_activity_screen.dart';
import '../../views/order_screen/order_list/orderList_screen.dart';
import '../../views/order_screen/order_proforma/proforma_list.dart';
import '../../views/otp_screen/otp_screen.dart';
import '../../views/purchase_now_screen/purchase_now_screen.dart';
import '../../views/sales_target_screen/sales_target_screen.dart';
import '../../views/splash_screen/splash_screen.dart';
import '../../views/upcoming_screen/upcoming_screen.dart';
import '../../views/welcome_to_company_screen/welcome_to_company_screen.dart';

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

    //     GetPage(
    //   name: RoutesName.home_screen,
    //   page: () => HomeScreen(),
    //   transitionDuration : Duration(milliseconds: 450),
    //   // transition :Transition.leftToRightWithFade,
    // ),


    GetPage(
      name: RoutesName.home_screen,
      page: () => HomeScreen(),
      transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
      ),

    GetPage(
      name: RoutesName.login_screen,
      page: () => LoginScreen(),
      transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
    ),

        GetPage(
          name: RoutesName.bottomNavBar_screen,
          page: () => BottomNavBarScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),



        //======================================================================
        // Lead Screen

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
      page: () => CreateNewLeadScreen(),
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
      name: RoutesName.my_teamLead_screen,
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
        // Customer Screen

    GetPage(
      name: RoutesName.customer_list_screen,
      page: () => CustomersListScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

        GetPage(
          name: RoutesName.customer_activities_screen,
          page: () => CustomersActivitiesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),


        GetPage(
          name: RoutesName.customer_companies_screen,
          page: () => CustomerCompaniesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customer_services_screen,
          page: () => CustomerServicesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customer_orderProducts_screen,
          page: () => CustomerOrderProductsScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customer_payment_reminder,
          page: () => CustomerPaymentReminders(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customer_myTeam_screen,
          page: () => CustomerMyTeamScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.customer_activation_list,
          page: () => CustomerActivationListScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        //======================================================================
        // Order Screens

        GetPage(
          name: RoutesName.order_list_screen,
          page: () => OrderListScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.order_activity_screen,
          page: () => OrderActivityScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.order_proformaList_screen,
          page: () => OrderProformaList(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.order_payments_screen,
          page: () => OrderPaymentsScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        //======================================================================
        //SALES TARGET

        GetPage(
          name: RoutesName.sales_target_screen,
          page: () => SalesTargetScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        //======================================================================
        //ROLES SCREEN

        GetPage(
          name: RoutesName.roles_screen,
          page: () => RolesScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

        //======================================================================
        //USERS

        GetPage(
          name: RoutesName.users_screen,
          page: () => UsersScreen(),
          transitionDuration : Duration(milliseconds: 450),
          // transition :Transition.leftToRightWithFade,
        ),

















      ];
}