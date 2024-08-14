import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Routes/routes_name.dart';
import '../../../Utils/utils.dart';
import '../../data/models/requestModels/forgotPassword/forgot_password.dart';
import '../../data/repositories/repositories.dart';

class ForgotPasswordViewModel extends GetxController {
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


    _api.forgotApi(user).then((value) {
      print(value.message);


      if(value.message != null){

        Get.toNamed(RoutesName.otp_screen);
        Utils.snackbarSuccess('Password Updated Successfully');
        loading.value = false;

      }else{
        Utils.snackbarFailed('Please check your Password');

      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }
}