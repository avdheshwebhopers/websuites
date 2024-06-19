
import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';

import '../../Views/forgot_password_screen.dart';
import '../../Views/home/MainPage.dart';
import '../../Views/home_screen.dart';
import '../../Views/login_screen.dart';
import '../../Views/otp_screen.dart';
import '../../Views/purchase_now_screen.dart';
import '../../Views/splash_screen.dart';
import '../../Views/welcome_to_company.dart';
import '../../code_check/code_check.dart';

class AppRoutes{

  static appRoutes () => [
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
          name: RoutesName.Main_page,
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











      ];
}