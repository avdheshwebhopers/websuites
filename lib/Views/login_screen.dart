import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../Resources/Assets/app_images.dart';
import '../Resources/components/app_colors.dart';
import '../Utils/Routes/routes_name.dart';
import '../Utils/Utils.dart';
import '../View_model/controllers/Login_view_model/login_view_model.dart';
import '../resources/Assets/app_fonts.dart';
import '../resources/app_strings/app_strings.dart';
import '../resources/app_textstyles/App_TextStyle.dart';
import '../resources/components/generic_button.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<LoginScreen> {

  final LoginViewModel loginController= Get.put(LoginViewModel());
  //final DashboardViewModel dashboardController = Get.put(DashboardViewModel());


  final RxBool rememberMe = false.obs;
  final RxBool obscurePassword = true.obs;

  final formkey = GlobalKey<FormState>();

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: AppColors.whiteColor,
          body:
          SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                // color: Colors.blue,
                margin: const EdgeInsets.only(left: 35, right: 35,),
                height: Get.height/1,
                width: Get.width/1.2,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(height: Get.height/5),

                    // Image.asset('lib/assets/images/WHLogo.png', scale: 7),
                    Image.asset(AppImages.Splash_WHLogo, scale: 7,),
                    SizedBox(height: Get.height/28),


                    AppTextStyle.login(context, AppStrings.Login_Login),

                    SizedBox(height: Get.height/100),

                    AppTextStyle.loginScreen(context, AppStrings.Login_PleaseSignIn),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        AppTextStyle.loginEmail(context, AppStrings.Login_Email),

                        Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                // width: Get.width/1,
                                // height: Get.height/19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.textfield2,
                                ),

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => TextFormField(
                                      // textAlign: TextAlign.start,
                                      cursorColor: Colors.black45,
                                      controller: loginController.emailController.value,
                                      focusNode: loginController.emailFocusNode.value,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          // return 'Please enter email';
                                          Utils.flushBarErrorMessage(AppStrings.Login_Flush_Email, context);
                                        }
                                        return null;

                                      },
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: AppStrings.Login_Hint_Email,
                                          // contentPadding: EdgeInsets.symmetric(vertical: 14),
                                          hintStyle:
                                          TextStyle(
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,)
                                      ),
                                      onFieldSubmitted: (value){
                                        Utils.FieldFocusChange(context,
                                            loginController.emailFocusNode.value,
                                            loginController.passwordFocusNode.value);
                                      },
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),

                              AppTextStyle.loginPassword(context, AppStrings.Login_Password),

                              Container(
                                padding: EdgeInsets.only(left: 5),
                                // width: Get.width/1,
                                // height: Get.height/19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.textfield2,
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx((){
                                      return TextFormField(
                                        // textAlign: TextAlign.start,
                                        cursorColor: Colors.black45,
                                        controller: loginController.passwordController.value,
                                        focusNode: loginController.passwordFocusNode.value,
                                        decoration: InputDecoration(
                                          hintText: AppStrings.Login_Hint_Password,
                                          suffixIcon: InkWell(
                                              onTap:(){
                                                obscurePassword.value = ! obscurePassword.value;
                                              },
                                              child:Icon(obscurePassword.value ?
                                              Icons.visibility_off_outlined:
                                              Icons.visibility)
                                          ),
                                          //contentPadding: EdgeInsets.symmetric(vertical: 14),
                                          hintStyle: const TextStyle(
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if(value!.isEmpty) {
                                            // return 'Please enter password';
                                            Utils.flushBarErrorMessage(
                                                AppStrings.Login_Flush_Pass, context);
                                          }
                                          return null;
                                        },
                                        obscureText: obscurePassword.value,
                                      );
                                    }, // child: null,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height/90),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Obx(
                                    ()=> Checkbox(
                                  checkColor: Colors.black45,
                                  activeColor: Colors.blue,
                                  value: rememberMe.value,
                                  onChanged: (value) {
                                    rememberMe.value = value!;
                                  },
                                ),
                              ),
                            ),

                            AppTextStyle.loginRememberMe(context, AppStrings.Login_RememberMe),
                            Spacer(),

                            InkWell(
                              onTap: (){
                                Get.offNamed(RoutesName.forgot_password_screen);
                              },
                              child: AppTextStyle.loginForgotPassword(context, AppStrings.Login_ForgotPassword),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23,),
                        Obx(() =>
                            GenericButton(
                              width: Get.width*1,
                              // height: Get.height/20,
                              title: AppStrings.Login_Button,
                              // loading: loginController.loading.value,

                              onPress: (){

                                if(formkey.currentState != null && formkey.currentState!.validate()){
                                  loginController.login(context);
                                  // dashboardController.DashboardApi(context);
                                }
                              },
                            ),
                        ),

                        const SizedBox(height: 14,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTextStyle.loginNewOn(context, AppStrings.Login_New_On),
                            InkWell(
                              onTap: (){
                                Get.toNamed(RoutesName.purchase_now_screen);
                              },
                              child:
                              AppTextStyle.loginPurchaseNow(context, AppStrings.Login_PurchaseNow),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                          AppImages.Spalsh_BottomLogo,
                          scale: 4),
                    ),
                  ],
                ),
              ),
            ),
          )
      );
  }
}
