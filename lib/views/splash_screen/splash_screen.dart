import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import '../../resources/image_strings/image_strings.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../view_models/services/splash_services.dart';


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
      backgroundColor: AllColors.whiteColor,
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
                      ImageStrings.Splash_WHLogo, scale: 4.7),
                ),
              )
          ),
          Container(
            // color: Colors.blue,
            height: Get.height/8,

            child: Image.asset(
                ImageStrings.Splash_BottomLogo, scale: 3.9),
          ),
        ],
      ),
    );
  }
}
