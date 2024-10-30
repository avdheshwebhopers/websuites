import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/Routes/routes_name.dart';
import '../../Utils/utils.dart';
import '../../controler/viewModels/loginScreen/login_view_model.dart';
import '../../resources/imageStrings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/buttons/common_button.dart';
import '../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../utils/responsive/bodies/Responsive.dart';

import '../../utils/responsive/bodies/responsive scaffold.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel loginController = Get.put(LoginViewModel());
  final RxBool rememberMe = false.obs;
  final RxBool obscurePassword = true.obs;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // State variable to track if user is logged in
  RxBool isLoggedIn = false.obs;

  @override
  Widget build(BuildContext context) {
    // Determine whether to show the drawer based on the login status and device type
    // Widget drawer = isLoggedIn.value ? CustomDrawer(userName: '', phoneNumber: '', version: '') : SizedBox.shrink();

    return Scaffold(
      // scaffoldKey: scaffoldKey,
      // drawer: drawer,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool isLandscape = orientation == Orientation.landscape;
            bool useDesktopLayout = ResponsiveUtils.isDesktop(context) ||
                (isLandscape && !ResponsiveUtils.isTablet(context));

            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Container(
                                width: useDesktopLayout
                                    ? 0.3 * MediaQuery.of(context).size.width
                                    : ResponsiveUtils.isTablet(context)
                                    ? 0.6 * MediaQuery.of(context).size.width
                                    : 0.9 * MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: useDesktopLayout ? 6 / 1 : 5 / 1,
                                      child: Image.asset(ImageStrings.splashWHLogo),
                                    ),
                                    SizedBox(height: Get.height / 30),
                                    Column(
                                      children: [
                                        TextStyles.w500_universal(
                                          fontSize: useDesktopLayout ? 24 : 20,
                                          context,
                                          Strings.login,
                                          color: AllColors.welcomeColor,
                                        ),
                                        SizedBox(height: Get.height / 80),
                                        TextStyles.w400_13(
                                          color: AllColors.lightGrey,
                                          context,
                                          Strings.pleaseSignIn,
                                        ),
                                        // TextStyles.w400_13(
                                        //   color: AllColors.lightGrey,
                                        //   context,
                                        //   Strings.theAdventure,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height / 40),
                                    Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextStyles.w400_15(context, Strings.email),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: AllColors.textField2,
                                            ),
                                            child: Obx(() => TextFormField(
                                              cursorColor: Colors.black45,
                                              controller: loginController.emailController.value,
                                              focusNode: loginController.emailFocusNode.value,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return Strings.flushEmail;
                                                }
                                                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                                if (!emailRegex.hasMatch(value)) {
                                                  return Strings.validemailpassword;
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: Strings.hintEmail,
                                                hintStyle: TextStyles.textFormHintStyle(context),
                                              ),
                                              onFieldSubmitted: (_) => Utils.fieldFocusChange(
                                                  context,
                                                  loginController.emailFocusNode.value,
                                                  loginController.passwordFocusNode.value),
                                            )),
                                          ),
                                          const SizedBox(height: 16),
                                          TextStyles.w400_15(context, Strings.password),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: AllColors.textField2,
                                            ),
                                            child: Obx(() => TextFormField(
                                              obscureText: obscurePassword.value,
                                              cursorColor: Colors.black45,
                                              controller: loginController.passwordController.value,
                                              focusNode: loginController.passwordFocusNode.value,
                                              validator: (value) => value!.isEmpty ? Strings.flushPass : null,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: Strings.hintPassword,
                                                hintStyle: TextStyles.textFormHintStyle(context),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => obscurePassword.value = !obscurePassword.value,
                                                ),
                                              ),
                                              onFieldSubmitted: (_) => Utils.fieldFocusChange(
                                                  context,
                                                  loginController.passwordFocusNode.value,
                                                  loginController.emailFocusNode.value),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height / 40),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20.0,
                                              width: 20.0,
                                              child: Obx(() => Checkbox(
                                                checkColor: Colors.black45,
                                                activeColor: Colors.blue,
                                                value: rememberMe.value,
                                                onChanged: (value) => rememberMe.value = value!,
                                              )),
                                            ),
                                            const SizedBox(width: 8),
                                            TextStyles.w400_12(
                                              context,
                                              Strings.rememberMe,
                                              color: AllColors.grey,
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () => Get.offNamed(RoutesName.forgot_password_screen),
                                          child: TextStyles.w400_12(
                                            context,
                                            Strings.forgotPassword,
                                            color: AllColors.buttonColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(() => CommonButton(
                                      width: double.infinity,
                                      title: Strings.button,
                                      loading: loginController.loading.value,
                                      onPress: () {
                                        String email = loginController.emailController.value.text;
                                        String password = loginController.passwordController.value.text;
                                        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                                        if (email.isEmpty && password.isEmpty) {
                                          Utils.flushBarErrorMessage(Strings.flushEmailPassword, context);
                                        } else if (email.isEmpty) {
                                          Utils.flushBarErrorMessage(Strings.flushEmail, context);
                                        } else if (!emailRegex.hasMatch(email)) {
                                          Utils.flushBarErrorMessage(Strings.validemailpassword, context);
                                        } else if (password.isEmpty) {
                                          Utils.flushBarErrorMessage(Strings.flushPass, context);
                                        } else if (formKey.currentState!.validate()) {
                                          // Log in the user and set isLoggedIn to true
                                          loginController.login(context, context.toString()).then((_) {
                                            isLoggedIn.value = true; // Update login status
                                          });
                                        }
                                      },
                                    )),
                                    const SizedBox(height: 14),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextStyles.w400_13(
                                          color: AllColors.lightGrey,
                                          context,
                                          Strings.newOn,
                                        ),
                                        const SizedBox(width: 4),
                                        InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse('https://www.whsuites.com');
                                            try {
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url, mode: LaunchMode.externalApplication);
                                              } else {
                                                Utils.flushBarErrorMessage(Strings.sales, context);
                                              }
                                            } catch (e) {
                                              Utils.flushBarErrorMessage(Strings.sales, context);
                                            }
                                          },
                                          child: TextStyles.w400_13(
                                            color: AllColors.buttonColor,
                                            context,
                                            Strings.purchaseNow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextStyles.w400_13(
                                        context,
                                        Strings.versions,
                                        color: AllColors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      TextStyles.w400_13(
                                        context,
                                        'v1.0.0',
                                        color: AllColors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      backgroundColor:AllColors.whiteColor,
    );
  }
}
