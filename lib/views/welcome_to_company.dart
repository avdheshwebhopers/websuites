import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Resources/all_images/all_images.dart';
import '../Resources/all_strings/all_strings.dart';
import '../Resources/all_textStyles/all_textStyles.dart';
import '../utils/components/all_buttons/welcomeScreen_button.dart';
import '../utils/components/app_colors.dart';




class WelcomeToCompany extends StatefulWidget {
  const WelcomeToCompany({super.key});

  @override
  State<WelcomeToCompany> createState() => _WelcomeToCompanyState();
}

class _WelcomeToCompanyState extends State<WelcomeToCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(AllImages.WelcomeCompanyLogo,scale: 5.5,),

              const SizedBox(height: 10,),

              AllTextStyles.w600_universal(color: AllColors.welcomeColor, context, AllStrings.Welcome_Title),

              const SizedBox(height: 7,),

              AllTextStyles.w400_13(color: AllColors.grey, context, AllStrings.Welcome_VerifyYourIdentity),

              const SizedBox(height: 35,),

              AllTextStyles.w500_16(color: AllColors.blackColor, context, AllStrings.Welcome_Email),

              const SizedBox(height: 20,),

              WelcomeScreenButton(
                    title: AllStrings.Welcome_Button1,
                onPress: (){},),

              const SizedBox(height: 15),

              WelcomeScreenButton(
                title: AllStrings.Welcome_Button2,
                onPress: (){},),
            ],
          ),
        ),
      ),
      
    );
  }
}
