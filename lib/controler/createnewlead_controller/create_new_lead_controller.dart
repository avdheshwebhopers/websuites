// // import 'package:get/get.dart';
// // import '../../../data/models/responseModels/login/login_response_model.dart';
// //
// // import '../../viewModels/saveToken/save_token.dart';
// //
// // class CreateNewLeadController extends GetxController {
// //   final SaveUserData userPreference = SaveUserData();
// //   var userName = ''.obs;
// //   var userEmail = ''.obs;
// //
// //   @override
// //   void onInit() {
// //     fetchUserData();
// //     super.onInit();
// //   }
// //
// //   Future<void> fetchUserData() async {
// //     try {
// //       LoginResponseModel response = await userPreference.getUser();
// //       userName.value = response.user?.first_name ?? '';
// //       userEmail.value = response.user?.email ?? '';
// //     } catch (e) {
// //       print('Error fetching userData: $e');
// //     }
// //   }
// // }
//
// import 'package:get/get.dart';
// import 'package:websuites/resources/appUrls/app_urls.dart';
// import '../../data/network/network_api_services.dart';
//
// class LeadSourceController extends GetxController {
//   var leadSources = <dynamic>[].obs;
//   var isLoading = true.obs;
//   var errorMessage = ''.obs;
//
//   final NetworkApiServices apiService;
//
//   LeadSourceController({required this.apiService});
//
//   @override
//   void onInit() {
//     fetchLeadSources(AppUrls.createNewLeadSource);
//     super.onInit();
//   }
//
//   Future<void> fetchLeadSources(String query) async {
//     try {
//       isLoading(true);
//
//       // Pass the query string to the API
//       var sources = await apiService.getApi('${AppUrls.createNewLeadSource}$query');
//
//       if (sources != null && sources is List) {
//         leadSources.assignAll(sources);
//       } else {
//         errorMessage.value = "Invalid response from API";
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//     } finally {
//       isLoading(false);
//     }
//   }
//
// }
//
//
//
//
