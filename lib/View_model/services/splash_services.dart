

import 'dart:async';

import 'package:get/get.dart';

import '../../Utils/Routes/routes_name.dart';
import '../controllers/save_token/save_token.dart';




class SplashServices {

//   Future<LoginResponseModel> getUserData() => SaveToken().getToken();
//
//   checkAuthentication(BuildContext context) async {
//     getUserData().then((value) async {
//       if (value.accessToken == "null" || value.accessToken.toString() == '') {
//         Get.toNamed(RoutesName.code_check_new);
//       } else {
//         Get.toNamed(RoutesName.code_check_new);
//       }
//     }).onError((error, stackTrace) {
//       Utils.flushBarErrorMessage(error.toString(), context);
//     });
//   }
// }

  SaveToken userPreference = SaveToken();
  void isLogin() {

    userPreference.getToken().then((value){
      print(value.accessToken);

      if(value.accessToken == "null" || value.accessToken.toString() == ''){
        Timer(const Duration(seconds: 2) ,
                () => Get.toNamed(RoutesName.login_screen));
      }else {
        print('token is Not null');


        Timer(
          const Duration(seconds: 1),
              () => Get.toNamed(
            RoutesName.Main_page,
            arguments: {'accessToken': value.accessToken},
          ),
        );
      }
    }
    );
  }
}

