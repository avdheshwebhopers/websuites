import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../Resources/Assets/app_images.dart';
import '../Resources/components/app_colors.dart';
import '../Utils/Routes/routes_name.dart';
import '../resources/app_strings/app_strings.dart';
import '../resources/app_textstyles/App_TextStyle.dart';
import '../resources/components/generic_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Container(
            height: Get.height*1,
            margin: EdgeInsets.only(right: 40, left: 40,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.WelcomeCompanyLogo, scale: 5.5,),
                SizedBox(height: 30),

                AppTextStyle.OtpWelcomeTo(context, AppStrings.Otp_WelcomeTo),

                SizedBox(height: 10),

                AppTextStyle.OtpWeTextedYou(context, AppStrings.Otp_WeTextedYou),

                Center(
                  child:
                    AppTextStyle.OtpTheCodeTo(context, AppStrings.Otp_TheCodeToSignIn),
                ),
                SizedBox(height: 10),

                AppTextStyle.OtpEnterCode(context, AppStrings.Otp_EnterCode),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: Get.height/15,
                  child: const Pinput(
                    keyboardType: TextInputType.number,
                    length: 6,
                    hapticFeedbackType: HapticFeedbackType.mediumImpact,
                    showCursor: true,
                  ),
                ),

                const SizedBox(height: 20),
                SizedBox(
                  // height: Get.height/17,
                  width: 380,
                  child: GenericButton(
                    title: AppStrings.Login_Button,
                    onPress: () {
                      Get.offNamed(RoutesName.Main_page);
                    },
                  ),
                ),

                SizedBox(height: 50,),


                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesName.forgot_password_screen);
                  },
                  child: SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppTextStyle.OtpResendOtp(context, AppStrings.Otp_ResendOtp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
