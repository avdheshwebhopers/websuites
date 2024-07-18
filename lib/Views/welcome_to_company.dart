import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Resources/Assets/app_images.dart';
import '../Resources/app_strings/app_strings.dart';
import '../Resources/app_textstyles/App_TextStyle.dart';
import '../Resources/app_textstyles/app_textstyle2.dart';
import '../Resources/components/App_Buttons/app_buttons.dart';
import '../Resources/components/app_colors.dart';


class WelcomeToCompany extends StatefulWidget {
  const WelcomeToCompany({super.key});

  @override
  State<WelcomeToCompany> createState() => _WelcomeToCompanyState();
}

class _WelcomeToCompanyState extends State<WelcomeToCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(AppImages.WelcomeCompanyLogo,scale: 5.5,),

              const SizedBox(height: 10,),

              AppTextStyle2.w600_universal(color: AppColors.welcomeColor, context, AppStrings.Welcome_Title),

              const SizedBox(height: 7,),

              AppTextStyle2.w400_13(color: AppColors.grey, context, AppStrings.Welcome_VerifyYourIdentity),

              const SizedBox(height: 35,),

              AppTextStyle2.w500_16(color: AppColors.blackColor, context, AppStrings.Welcome_Email),

              const SizedBox(height: 20,),

              App_Button(
                    title: AppStrings.Welcome_Button1,
                onPress: (){},),

              const SizedBox(height: 15),

              App_Button(
                title: AppStrings.Welcome_Button2,
                onPress: (){},),
            ],
          ),
        ),
      ),
      
    );
  }
}
