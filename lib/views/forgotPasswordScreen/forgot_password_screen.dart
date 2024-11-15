import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Routes/routes_name.dart';
import '../../Utils/utils.dart';
import '../../viewModels/forgotPasswordScreen/forgot_password.dart';
import '../../resources/imageStrings/image_strings.dart';
import '../../resources/strings/strings.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/appColors/app_colors.dart';
import '../../utils/components/buttons/common_button.dart';
import '../../utils/responsive/bodies/Responsive.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordViewModel forgotPasswordController = Get.put(ForgotPasswordViewModel());

  // Email validation function to check for valid Gmail address
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    final emailPattern = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    if (!emailPattern.hasMatch(value)) {
      return 'Please enter a valid Gmail address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // Adjust the width dynamically based on screen size
            width: ResponsiveUtils.isDesktop(context)
                ? 0.3 * MediaQuery.of(context).size.width // For desktop
                : ResponsiveUtils.isTablet(context)
                ? 0.6 * MediaQuery.of(context).size.width // For tablet
                : 0.9 * MediaQuery.of(context).size.width, // For mobile
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0), // Add vertical padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30), // Space above the image
                Image.asset(ImageStrings.welcomeCompanyLogo, scale: 7),
                const SizedBox(height: 30), // Space between image and text
                TextStyles.w600_universal(
                  fontSize: 20,
                  color: AllColors.welcomeColor,
                  context,
                  Strings.forgotPassword,
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: [
                      TextStyles.w400_13(
                        color: AllColors.lightGrey,
                        context,
                        Strings.enterYour,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                      () => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AllColors.textField2,
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black45,
                      controller: forgotPasswordController.emailController.value,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.hintEmail,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        prefixIcon: Icon(Icons.email_outlined, color: AllColors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                      () => CommonButton(
                    title: Strings.buttonSubmit,
                    width: Get.width * 1,
                    loading: forgotPasswordController.loading.value,
                    onPress: () {
                      if (validateEmail(forgotPasswordController.emailController.value.text) == null) {
                        forgotPasswordController.forgot(context);
                      } else {
                        Utils.flushBarErrorMessage(Strings.validemailpassword, context);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.toNamed(RoutesName.login_screen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 14, color: AllColors.grey),
                      const SizedBox(width: 5),
                      TextStyles.w300_10(color: AllColors.grey, context, Strings.backToLogin),
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
