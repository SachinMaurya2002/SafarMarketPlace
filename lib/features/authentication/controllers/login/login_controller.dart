import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    password.text = localStorage.read(UKeys.rememberMePassword) ?? '';
    super.onInit();
  }

  /// Function to login the user with email and password
  Future<void> loginWithEmailAndPassword() async {
    try {
      //Start Loading
      UFullScreenLoader.openLoadingDialog('Logging You In...');

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      /// Saved data if rememberMe is Checked
      if (rememberMe.value) {
        localStorage.write(UKeys.rememberMeEmail, email.text.trim());
        localStorage.write(UKeys.rememberMePassword, password.text.trim());
      }

      /// Login the user with email and password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      /// stop Loading
      UFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Logging you in...');
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // Google Authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .signInWithGoogle();

      // Save User Record
      await _userController.saveUserReord(userCredential);

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Stop Loading
      UFullScreenLoader.stopLoading();
      // Error SnackBar
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}
