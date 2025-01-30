// controllers/lead_master_controller.dart
import 'package:get/get.dart';
import '../../../../data/models/responseModels/login/login_response_model.dart';

import '../../../viewModels/saveToken/save_token.dart';

class LeadMasterController extends GetxController {
  final SaveUserData userPreference = SaveUserData();
  var userName = ''.obs;
  var userEmail = ''.obs;
  var selectedTab = 'types'.obs; // Track selected tab

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      userName.value = response.user?.firstName ?? '';
      userEmail.value = response.user?.email ?? '';
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  void updateSelectedTab(String tabName) {
    selectedTab.value = tabName;
  }
}
