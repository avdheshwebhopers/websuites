import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Routes/routes_name.dart';
import '../../Utils/utils.dart';
import '../../resources/imageStrings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/buttons/common_button.dart';
import '../../viewModels/loginScreen/login_view_model.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<LoginScreen> {

  final LoginViewModel loginController= Get.put(LoginViewModel());
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
        backgroundColor: AllColors.whiteColor,
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

                    Image.asset(ImageStrings.splashWHLogo, scale: 7),
                    SizedBox(height: Get.height/28),


                    TextStyles.w500_universal(fontSize: 25, context, Strings.login, color: AllColors.welcomeColor),

                    SizedBox(height: Get.height/100),
                    TextStyles.w400_13( color: AllColors.lightGrey, context, Strings.pleaseSignIn),
                    TextStyles.w400_13( color: AllColors.lightGrey, context, Strings.theAdventure),



                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        TextStyles.w400_15(context, Strings.email),

                        Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 5),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: AllColors.textField2,
                                    ),

                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Obx(() => TextFormField(
                                            cursorColor: Colors.black45,
                                            controller: loginController.emailController.value,
                                            focusNode: loginController.emailFocusNode.value,
                                            validator: (value){
                                              if(value!.isEmpty){
                                                Utils.flushBarErrorMessage(Strings.flushEmail, context);
                                              }
                                              return null;

                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: Strings.hintEmail,

                                              hintStyle:
                                              TextStyle(
                                                  
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,)
                                            ),
                                            onFieldSubmitted: (value){
                                              Utils.fieldFocusChange(context,
                                                  loginController.emailFocusNode.value,
                                                  loginController.passwordFocusNode.value);
                                              },
                                            ),
                                        ),
                                      ],
                                    ),
                                ),
                              const SizedBox(height: 20,),

                              TextStyles.w400_15(context, Strings.password),

                              Container(
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AllColors.textField2,
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx((){
                                      return TextFormField(
                                        cursorColor: Colors.black45,
                                        controller: loginController.passwordController.value,
                                        focusNode: loginController.passwordFocusNode.value,
                                        decoration: InputDecoration(
                                          hintText: Strings.hintPassword,
                                          suffixIcon: InkWell(
                                              onTap:(){
                                                obscurePassword.value = ! obscurePassword.value;
                                              },
                                              child:Icon(obscurePassword.value ?
                                              Icons.visibility_off_outlined:
                                              Icons.visibility)
                                          ),
                                          hintStyle: const TextStyle(
                                              
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if(value!.isEmpty) {

                                            Utils.flushBarErrorMessage(
                                                Strings.flushPass, context);
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
                              child: Obx(()=> Checkbox(
                                  checkColor: Colors.black45,
                                  activeColor: Colors.blue,
                                  value: rememberMe.value,
                                  onChanged: (value){
                                    rememberMe.value = value!;
                                  },
                                ),
                              ),
                            ),

                        TextStyles.w400_12(context, Strings.rememberMe, color: AllColors.grey),
                            const Spacer(),

                            InkWell(
                              onTap: (){
                                Get.offNamed(RoutesName.forgot_password_screen);
                              },
                              child:

                              TextStyles.w400_12(context, Strings.forgotPassword, color: AllColors.buttonColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23,),
                        Obx(() =>
                          CommonButton(
                            width: Get.width*1,
                            title: Strings.button,
                            loading: loginController.loading.value,

                            onPress: (){
                              if(formkey.currentState != null && formkey.currentState!.validate()){
                                 loginController.login(context);
                              }
                              },
                          ),
                        ),

                        const SizedBox(height: 14,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           TextStyles.w400_12(context, Strings.newOn),
                            InkWell(
                                onTap: (){
                                  Get.toNamed(RoutesName.purchase_now_screen);
                                },
                                child:
                                TextStyles.w400_12(context, Strings.purchaseNow, color: AllColors.buttonColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                          ImageStrings.splashBottomLogo,
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
