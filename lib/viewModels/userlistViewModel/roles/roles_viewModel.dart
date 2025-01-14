import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../data/models/responseModels/roles/roles_response_model.dart';


class RolesViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<RolesResponseModel> roles = <RolesResponseModel>[].obs;

  Future<void> fetchRoles(BuildContext context) async {
    loading.value = true;

    try {
      List<RolesResponseModel> response = await _api.rolesApi();
      if (response.isNotEmpty) {
        roles.assignAll(response); // Assign all roles to the observable list
      } else {
        print('No roles found');
      }
    } catch (error) {
      Utils.snackbarFailed('Error fetching roles: $error');
    } finally {
      loading.value = false; // Set loading to false after fetching
    }
  }
}