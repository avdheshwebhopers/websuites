import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Utils/Routes/routes_name.dart';
import '../saveToken/save_token.dart';

class SplashServices {
  final SaveUserData userPreference = SaveUserData();

  void isLogin() {
    userPreference.getUser().then((value) {
      debugPrint('Token: ${value.accessToken}');

      if (value.accessToken == null || value.accessToken.toString().isEmpty) {
        Timer(
          const Duration(seconds: 2),
              () => Get.offNamed(RoutesName.login_screen),
        );
      } else {
        debugPrint('Token is not null');
        Timer(
          const Duration(seconds: 1),
              () => Get.offNamed(
            RoutesName.home_screen,
            arguments: {
              'accessToken': value.accessToken,
              'email': value.user?.email,
              'first_name': value.user?.firstName
            },
          ),
        );
      }
    }).catchError((error) {
      debugPrint('Error retrieving user data: $error');
      Timer(
        const Duration(seconds: 2),
            () => Get.offNamed(RoutesName.login_screen),
      );
    });
  }
}