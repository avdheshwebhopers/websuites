
import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import 'package:websuites/Views/bottomNavBar_screen.dart';
import 'package:websuites/Views/leadlist_screen.dart';
import 'package:websuites/Views/trash_lead_screen.dart';
import 'package:websuites/Views/upcoming_screen.dart';

import '../../Views/CustomerList_screen.dart';
import '../../Views/Customers_Activities_Screen.dart';
import '../../Views/Search_Google_Leads.dart';
import '../../Views/Team_Lead_Screen.dart';
import '../../Views/activities_screen.dart';
import '../../Views/forgot_password_screen.dart';
import '../../Views/home/MainPage.dart';
import '../../Views/home_screen.dart';
import '../../Views/leadMaster_Screen.dart';
import '../../Views/login_screen.dart';
import '../../Views/new_LeadList_screen.dart';
import '../../Views/otp_screen.dart';
import '../../Views/purchase_now_screen.dart';
import '../../Views/splash_screen.dart';
import '../../Views/welcome_to_company.dart';
import '../../code_check/code_check.dart';

class AppRoutes{

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
      name: RoutesName.code_check,
      page: () => CodeCheck(),
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
      page: () => New_LeadList_screen(),
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

    GetPage(
      name: RoutesName.customerList_screen,
      page: () => CustomersListScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.bottomNavBar_screen,
      page: () => BottomNavBarScreen(),
      transitionDuration : Duration(milliseconds: 450),
      // transition :Transition.leftToRightWithFade,
    ),





  ];
}