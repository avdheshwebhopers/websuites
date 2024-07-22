import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Data/models/Request_models/login_request_model.dart';
import '../../../Data/models/Response_model/LoginResponseModel.dart';
import '../../../Data/repositories/repositories.dart';
import '../../../Data/response/status.dart';
import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/utils.dart';
import '../save_token/save_token.dart';

class LoginViewModel extends GetxController {
  final _api = Repositories();
  final _saveToken = SaveUserData();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  // final rxLoginStatus = Status.LOADING.obs;
  // final loginModel = LoginResponseModel().obs;
  // RxString error = ''.obs;
  //
  // void setRxStatus (Status _value) =>  rxLoginStatus.value = _value;
  // void setLogin (LoginResponseModel _value) =>  loginModel.value = _value;
  // void setError (String _value) =>  error.value = _value;

  RxBool loading = false.obs;
  
  @override
  void onClose() {
    // TODO: implement dispose
    super.onClose();

    emailController();
    passwordController();

    emailFocusNode();
    passwordFocusNode();
  }

  Future<void> login (BuildContext context) async {
    if (emailController.value.text.isEmpty || passwordController.value.text.isEmpty) {
      await Utils.SnackbarFailed('Please enter email and password');
      return;
    }
    LoginRequestedModel data = LoginRequestedModel();
    data.email = emailController.value.text;
    data.password = passwordController.value.text;
    data.deviceId = 'iphone 15 pro';

    loading.value = true;
    // setRxStatus(Status.LOADING);
    _api.loginApi(data).then((value) {


      if (value.accessToken!= null) {
        _saveToken.saveUser(value.accessToken.toString(), value.user?.first_name ?? '', value.user?.email ?? '' );
        print(value.accessToken);
        print(value.user?.first_name);
        print(value.user?.email);

        Get.offNamed(RoutesName.main_page_screen,
        );

        Utils.SnackbarSuccess('login Successful');
        // setRxStatus(Status.COMPLETED);
      } else {
        Utils.SnackbarFailed('Login failed');
      }
      loading.value = false;
      // setRxStatus(Status.ERROR);
    }).onError((error, stackTrace) {

      // setRxStatus(Status.ERROR);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
