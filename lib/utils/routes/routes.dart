import 'package:get/get.dart';
import 'package:websuites/Utils/Routes/routes_name.dart';
import 'package:websuites/views/bottomNavBarScreen/bottom_navBar_screen.dart';
import 'package:websuites/views/leadScreens/Setting/SettingScreen.dart';
import 'package:websuites/views/leadScreens/leadList/leadlist_screen.dart';
import 'package:websuites/views/splashScreen/splash_screen.dart';

import '../../views/forgotPasswordScreen/forgot_password_screen.dart';
import '../../views/homeScreen/home_screen.dart';
import '../../views/leadScreens/createNewLead/create_newLead_screen.dart';
import '../../views/leadScreens/leadActivities/lead_activities_screen.dart';
import '../../views/leadScreens/leadMaster/lead_master_screen.dart';
import '../../views/leadScreens/searchGoogleLeads/search_google_leads.dart';
import '../../views/leadScreens/teamLead/team_lead_screen.dart';
import '../../views/leadScreens/trashLead/trash_lead_screen.dart';
import '../../views/loginScreen/login_screen.dart';
import '../../views/otpScreen/otp_screen.dart';
import '../../views/purchase_now_screen/purchase_now_screen.dart';
import '../../views/upcomingScreen/upcoming_screen.dart';
import '../../views/welcomeToCompanyScreen/welcome_to_company_screen.dart';

class AllRoutes {
      static List<GetPage> appRoutes() => [
            GetPage(name: RoutesName.splash_screen, page: () => const SplashScreen()),
            GetPage(name: RoutesName.welcome_company_screen, page: () => const WelcomeToCompany()),
            GetPage(name: RoutesName.otp_screen, page: () => const OtpScreen()),
            GetPage(name: RoutesName.forgot_password_screen, page: () => const ForgotPasswordScreen()),
            GetPage(name: RoutesName.login_screen, page: () => const LoginScreen()),
            GetPage(name: RoutesName.bottomNavBar_screen, page: () => const BottomNavBarScreen()),
            GetPage(name: RoutesName.home_screen, page: () => const HomeScreen()),
            GetPage(name: RoutesName.createNewLead_screen, page: () => const CreateNewLeadScreen()), // Unique route for CreateNewLeadScreen
            GetPage(name: RoutesName.createNewLead_screen, page: () => const SearchGoogleLeads()), // Unique route for CreateNewLeadScreen
            GetPage(name: RoutesName.lead_list_screen, page: () => const LeadListScreen()), // This should be unique as well
            GetPage(name: RoutesName.upcoming_screen, page: () => const LeadActivitiesScreen()),
            GetPage(name: RoutesName.search_google_leads_screen, page: () => const TrashLeadScreen()),
            GetPage(name: RoutesName.search_google_leads_screen, page: () => const SettingScreen()),
            GetPage(name: RoutesName.search_google_leads_screen, page: () => LeadMasterScreen()),
            // Uncomment if you want to use this route
            // GetPage(name: RoutesName.lead_activities_screen, page: () => const LeadActivitiesScreen()),
            GetPage(name: RoutesName.my_teamLead_screen, page: () => const TeamLeadScreen()),
            GetPage(name: RoutesName.trashLead_screen, page: () => const TrashLeadScreen()),
      ];
}