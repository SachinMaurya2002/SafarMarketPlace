import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/button/social_buttons.dart';
import 'package:safar_store/common/widgets/login_signup/form_divider.dart';
import 'package:safar_store/features/authentication/controllers/login/login_controller.dart';
import 'package:safar_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:safar_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ------[header]------
              /// title & subtitle
              ULoginHeader(),
              SizedBox(height: USizes.spaceBtwSections),

              /// ------[form]------
              ULoginForm(),
              SizedBox(height: USizes.spaceBtwSections),

              /// ------[divider]------
              UFormDivider(title: UTexts.orSignInWith),
              SizedBox(height: USizes.spaceBtwSections),

              /// ------[Footer]------
              ///Social Buttons
              USocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
