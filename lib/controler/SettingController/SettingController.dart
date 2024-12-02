// import 'package:get/get.dart';
// import '../../utils/MasterScreen/MasterUtils.dart';
//
// class SettingScreenController extends GetxController {
//   var userName = ''.obs;
//   var userEmail = ''.obs;
//   var selectedSetting = 'column'.obs;
//
//   // Use onInit to fetch data when the controller is initialized
//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserDataAndDivisions();
//   }
//
//   // Method to fetch user data and divisions
//   Future<void> fetchUserDataAndDivisions() async {
//     try {
//       final userData = await MasterScreenUtils.fetchUserData();
//       // Ensure that the fetched data is properly updated in the observables
//       userName.value = userData['userName'] ?? '';
//       userEmail.value = userData['userEmail'] ?? '';
//     } catch (e) {
//       // Handle any errors here (e.g., logging)
//       print('Error fetching user data: $e');
//     }
//   }
// }

