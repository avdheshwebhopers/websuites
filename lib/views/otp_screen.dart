import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../Resources/all_images/all_images.dart';
import '../Resources/all_strings/all_strings.dart';
import '../Resources/all_textStyles/all_textStyles.dart';
import '../Utils/Routes/routes_name.dart';
import '../utils/components/All_Buttons/common_button.dart';
import '../utils/components/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AllColors.whiteColor,
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Container(
            height: Get.height*1,
            margin: EdgeInsets.only(right: 40, left: 40,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AllImages.WelcomeCompanyLogo, scale: 5.5,),
                SizedBox(height: 30),

                AllTextStyles.w600_universal(fontSize: 20, color: AllColors.welcomeColor, context, AllStrings.Otp_WelcomeTo),

                SizedBox(height: 10),

                AllTextStyles.w400_12(color: AllColors.grey,context, AllStrings.Otp_WeTextedYou),

                Center(
                  child:
                  AllTextStyles.w400_12(color: AllColors.grey,context, AllStrings.Otp_TheCodeToSignIn),
                ),
                SizedBox(height: 10),

                AllTextStyles.w600_universal(color: AllColors.blackColor, fontSize: 14,context, AllStrings.Otp_EnterCode),
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
                  child: CommonButton(
                    title: AllStrings.Login_Button,
                    onPress: () {
                      Get.offNamed(RoutesName.main_page_screen);
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
                        AllTextStyles.w300_10(context, AllStrings.Otp_ResendOtp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
