import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import '../Resources/Assets/app_images.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splash_screen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   splash_screen.isLogin();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(
              child:
              Center(
                child:
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Image.asset(
                      AppImages.Splash_WHLogo, scale: 4.7),
                ),
              )
          ),
          Container(
            // color: Colors.blue,
            height: Get.height/8,

            child: Image.asset(
                AppImages.Spalsh_BottomLogo, scale: 3.9),
          ),
        ],
      ),
    );
  }
}
