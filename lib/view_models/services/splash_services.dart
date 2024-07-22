

import 'dart:async';
import 'package:get/get.dart';
import '../../Utils/Routes/routes_name.dart';
import '../save_token/save_token.dart';


class SplashServices {

  SaveUserData userPreference = SaveUserData();
  void isLogin() {

    userPreference.getUser().then((value){
      print(value.accessToken);

      if(value.accessToken == "null" || value.accessToken.toString() == ''){
        Timer(const Duration(seconds: 2),
                () => Get.toNamed(RoutesName.login_screen));
      }else {
         print('token is Not null');


        Timer(
          const Duration(seconds: 1),
              () => Get.offNamed(
            RoutesName.main_page_screen,
            arguments: {
              'accessToken': value.accessToken,
              'email' : value.user!.email,
              'first_name' : value.user!.first_name,
            },
          ),
        );
      }
    }
    );
  }
}

