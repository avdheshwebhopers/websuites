import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Resources/Assets/app_images.dart';
import '../Resources/components/app_colors.dart';
import '../Utils/Routes/routes_name.dart';
import '../Utils/Utils.dart';
import '../View_model/controllers/Forgot_Password_view_Model/forgot_password_viewModel.dart';
import '../resources/Assets/app_fonts.dart';
import '../resources/app_strings/app_strings.dart';
import '../resources/app_textstyles/App_TextStyle.dart';
import '../resources/components/generic_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final ForgotPasswordViewmodel forgotPasswordController = Get.put(ForgotPasswordViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            // color: Colors.grey,
            height: Get.height*1,
            width: Get.width/1.2,
            margin: EdgeInsets.only(left: 40, right: 40),
            child:
            Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.WelcomeCompanyLogo, scale: 7,),

                SizedBox(height: 30,),

                AppTextStyle.ForgotForgotPassword(context, AppStrings.Forgot_ForgotPassword),

                SizedBox(height: 5,),

                Center(
                  child:
                  AppTextStyle.ForgotEnterYour(context, AppStrings.Forgot_EnterYour),
                ),
                SizedBox(height: 20,),
                Obx(() =>
                    Container(
                      // width: Get.width/1,
                      // height: Get.height/19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.textfield2,
                      ),

                      child:
                      TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.black45,
                        controller: forgotPasswordController.emailController.value,
                        validator: (value){
                          if(value!.isEmpty){
                                    // return 'Please enter email';

                            Utils.flushBarErrorMessage(AppStrings.Forgot_Flush_Email, context);
                          }
                          return null;
                          },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppStrings.Forgot_Hint_Email,
                          // contentPadding: EdgeInsets.symmetric(vertical: 17.0),
                          hintStyle: TextStyle(
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          prefixIcon: Icon(Icons.email_outlined,),
                        ),
                      ),
                    ),
                ),

                SizedBox(height: 15,),

                Obx(() =>
                    GenericButton(
                      title: AppStrings.Forgot_ButtonSubmit,
                      width: Get.width*1,
                      // height: Get.height/17,
                      loading: forgotPasswordController.loading.value,
                      onPress: (){
                        forgotPasswordController.forgot(context);

                      }),
                ),

                SizedBox(height: 70,),

                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesName.login_screen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 10,color: AppColors.grey,),

                      AppTextStyle.ForgotBacktoLogin(context, AppStrings.Forgot_BackToLogin),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
