import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/features/authentication/screens/forget_password/reset_password.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Email to forgot password
  Future<void> sendPasswordResetEmail() async {
    try {
      // start loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //  Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent Successfully',
        message: 'Email Link Sent to Reset your Password',
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
    }
  }

  // Send Email to forgot password
  Future<void> resendPasswordResetEmail() async {
    try {
      // start loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent Successfully',
        message: 'Email Link Sent to Reset your Password',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
    }
  }
}
