import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/button/social_buttons.dart';
import 'package:safar_store/common/widgets/login_signup/form_divider.dart';
import 'package:safar_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:safar_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: UPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Header ---
                Text(
                  UTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: USizes.spaceBtwSections),

                /// --- Form ---
                USignupForm(),
                SizedBox(height: USizes.spaceBtwSections),

                /// --- Divider ---
                UFormDivider(title: UTexts.orSignupWith),
                SizedBox(height: USizes.spaceBtwSections),

                /// --- Footer ----
                USocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
