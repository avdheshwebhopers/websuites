import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Resources/all_fonts/all_fonts.dart';
import '../../Utils/Routes/routes_name.dart';
import '../../Utils/utils.dart';
import '../../resources/image_strings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/text_styles/text_styles.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/components/buttons/common_button.dart';
import '../../view_models/forgot_password_viewModel/forgot_password_viewModel.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final ForgotPasswordViewModel forgotPasswordController = Get.put(ForgotPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
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
                Image.asset(ImageStrings.WelcomeCompanyLogo, scale: 7,),

                SizedBox(height: 30,),

                TextStyles.w600_universal(fontSize: 20, color: AllColors.welcomeColor, context, Strings.Forgot_ForgotPassword),

                SizedBox(height: 5,),

                Center(
                  child:
                  TextStyles.w400_13(color: AllColors.lightGrey,context, Strings.Forgot_EnterYour),
                ),
                SizedBox(height: 20,),
                Obx(() =>
                    Container(
                      // width: Get.width/1,
                      // height: Get.height/19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AllColors.textfield2,
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

                            Utils.flushBarErrorMessage(Strings.Forgot_Flush_Email, context);
                          }
                          return null;
                          },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: Strings.Forgot_Hint_Email,
                          // contentPadding: EdgeInsets.symmetric(vertical: 17.0),
                          hintStyle: TextStyle(
                            fontFamily: AllFonts.nunitoRegular,
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
                    CommonButton(
                      title: Strings.Forgot_ButtonSubmit,
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
                      Icon(Icons.arrow_back_ios, size: 10,color: AllColors.grey,),

                      TextStyles.w300_10(color: AllColors.grey, context, Strings.Forgot_BackToLogin),
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
