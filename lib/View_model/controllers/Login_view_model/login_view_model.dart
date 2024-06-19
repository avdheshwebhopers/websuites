import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../Data/response/status.dart';
import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/Utils.dart';
import '../../../data/models/Request_models/login_request_model.dart';
import '../../../data/repository/Repositories.dart';
import '../save_token/save_token.dart';

class LoginViewModel extends GetxController {
  final _api = Repositories();
  final userPreferences = SaveToken();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final statusCode = Status.LOADING.obs;

  void status(Status statusValue) => statusCode.value = statusValue;
  
  @override
  void onClose() {
    // TODO: implement dispose
    super.onClose();

    emailController();
    passwordController();

    emailFocusNode();
    passwordFocusNode();
  }

  Future<void> login(BuildContext context) async {
    if (emailController.value.text.isEmpty || passwordController.value.text.isEmpty) {
      Utils.flushBarErrorMessage("Please enter email and password", context);
      return;
    }

    status(Status.LOADING);
    LoginRequestedModel data = LoginRequestedModel();
    data.email = emailController.value.text;
    data.password = passwordController.value.text;
    data.deviceId = 'iphone 15 pro';

    _api.loginApi(data).then((value) {
      // print(value.accessToken);
      print(value.user?.firstName);

      if (value.accessToken != null) {
        SaveToken().saveToken(value.accessToken.toString());

        Get.offNamed(RoutesName.Main_page, arguments: value.user?.firstName.toString(),);
        Utils.SnackbarSuccess('login Successful');
        status(Status.COMPLETED);
      } else {
        Utils.SnackbarFailed('Login failed');
      }
    }).onError((error, stackTrace) {
      status(Status.ERROR);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
