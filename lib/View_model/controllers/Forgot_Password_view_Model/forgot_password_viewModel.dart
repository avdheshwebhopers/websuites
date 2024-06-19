import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/Utils.dart';
import '../../../data/models/Request_models/forgot_password_request_model.dart';
import '../../../data/repository/Repositories.dart';


class ForgotPasswordViewmodel extends GetxController {
  final emailController = TextEditingController().obs;
  RxBool loading = false.obs;
  final _api = Repositories();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController();
  }

  Future<void> forgot(BuildContext context)async{
    if (emailController.value.text.isEmpty) {
      Utils.flushBarErrorMessage("Please enter email", context);
      return;
    }

    loading.value = true;
    ForgotPasswordRequestedModel user = ForgotPasswordRequestedModel();
    user.email = emailController.value.text;


    _api.ForgotApi(user).then((value) {
      print(value.message);


      if(value.message != null){

        Get.toNamed(RoutesName.otp_screen);
        Utils.SnackbarSuccess('Password Updated Successfully');
        loading.value = false;

      }else{
        Utils.SnackbarFailed('Please check your Password');

      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }
}