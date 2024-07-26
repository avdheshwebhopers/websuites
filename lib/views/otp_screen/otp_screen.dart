import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../Utils/Routes/routes_name.dart';
import '../../resources/image_strings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/text_styles/text_styles.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/components/buttons/common_button.dart';

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
                Image.asset(ImageStrings.WelcomeCompanyLogo, scale: 5.5,),
                SizedBox(height: 30),

                TextStyles.w600_universal(fontSize: 20, color: AllColors.welcomeColor, context, Strings.Otp_WelcomeTo),

                SizedBox(height: 10),

                TextStyles.w400_12(color: AllColors.grey,context, Strings.Otp_WeTextedYou),

                Center(
                  child:
                  TextStyles.w400_12(color: AllColors.grey,context, Strings.Otp_TheCodeToSignIn),
                ),
                SizedBox(height: 10),

                TextStyles.w600_universal(color: AllColors.blackColor, fontSize: 14,context, Strings.Otp_EnterCode),
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
                    title: Strings.Login_Button,
                    onPress: () {
                      Get.offNamed(RoutesName.home_screen);
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
                        TextStyles.w300_10(context, Strings.Otp_ResendOtp)
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
