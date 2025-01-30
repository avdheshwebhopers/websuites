import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/product/update_product_request_model/update_product_request_model.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../data/models/requestModels/userlist/status/UserListStatusRequestModel.dart';
import '../../../data/models/requestModels/userlist/user_update/UserUpdaterRequestModel.dart';
import '../../../data/models/responseModels/userList/status/UserStatusResponseModel.dart';
import '../../../data/models/responseModels/userList/user_update/UserUpdateResponseModel.dart';
import '../../../data/network/network_api_services.dart';
import '../../../resources/appUrls/app_urls.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/userlist/user_update/UserUpdaterRequestModel.dart';
import '../../../data/network/network_api_services.dart';
import '../../../resources/appUrls/app_urls.dart';

class UserUpdateViewModel extends GetxController {
  final _loading = false.obs;
  final _error = ''.obs;
  final NetworkApiServices _apiService = NetworkApiServices();

  bool get loading => _loading.value;
  String get error => _error.value;

  Future<bool> updateUser (
      String userId, {
        required String firstName,
        required String lastName,
        required String email,
        required String mobile,
        required String department,
        required String parent,
        required List<String> roleList,
        String? password,
        String? cpassword,
      }) async {
    try {
      _loading.value = true;
      _error.value = '';

      final data = UserUpdaterRequestModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        mobile: mobile,
        department: department,
        parent: parent,
        roleList: roleList,
        password: password,
        cpassword: cpassword,
      ).toJson();

      String url = AppUrls.userUpdateApi(userId);
      await _apiService.patchApi(url, data);
      return true;
    } catch (e) {
      // Log the error for debugging purposes
      print("Error updating user: $e");
      _error.value = e.toString();
      return false;
    } finally {
      _loading.value = false;
    }
  }
}