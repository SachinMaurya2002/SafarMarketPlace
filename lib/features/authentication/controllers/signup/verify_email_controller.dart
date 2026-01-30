import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/screens/success_screen.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Variables

  /// Send Email Verification Link with the Current Users
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Please Check Your Inbox and Verify Your Email',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Timer to automatically redirect to Email Verification
  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subTitle: UTexts.accountCreatedSubTitle,
            image: UImages.successfulPaymentIcon,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually check if email is verified
  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        () => SuccessScreen(
          title: UTexts.accountCreatedTitle,
          subTitle: UTexts.accountCreatedSubTitle,
          image: UImages.successfulPaymentIcon,
          onTap: () => AuthenticationRepository.instance.screenRedirect(),
        );
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Checking Failed',
        message:
            'An error occurred while checking verification status: ${e.toString()}',
      );
    }
  }
}
