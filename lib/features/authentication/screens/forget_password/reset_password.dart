import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:safar_store/features/authentication/screens/login/login.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/helpers/device_helpers.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // Image
              Image.asset(
                UImages.mailSentImage,
                height: UDeviceHelper.getScreenWidth(context) * 0.6,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              // Title
              Text(
                UTexts.resetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              // Email
              Text(email, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems),
              // Subtitle
              Text(
                UTexts.resetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              // Done
              UElevatedButton(
                onPressed: () => Get.offAll(() => LoginScreen()),
                child: Text(UTexts.done),
              ),
              // Resend Email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: controller.resendPasswordResetEmail,
                  child: Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
