import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/utils.dart';
import '../../../data/models/responseModels/userList/activity/UserActivitiesResponseModel.dart';
import '../../../data/repositories/repositories.dart';

class UserActivitiesModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<Items> userActivities = <Items>[].obs;  // Corrected type to Items

  // Fetch user data
  Future<void> usersActivitiesApi() async {
    loading.value = true;
    try {
      UserActivitiesResponseModel response = await _api.usersActivitiesApi();
      if (response.items != null && response.items!.isNotEmpty) {
        userActivities.value = response.items!;  // Update the user list
        Utils.snackbarSuccess('Users fetched');
      } else {
        Utils.snackbarFailed('No users found');
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
      Utils.snackbarFailed('Failed to fetch users');
    } finally {
      loading.value = false;
    }
  }
}
