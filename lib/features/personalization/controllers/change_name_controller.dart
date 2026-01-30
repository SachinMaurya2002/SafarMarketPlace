import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/user/user_repository.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';
import 'package:safar_store/navigation_menu.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  // Variables
  final _userController = UserController.instance;
  final _userRepository = UserRepository.instance;

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
      );

      /// Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      /// Update User Name From FireStore
      Map<String, dynamic> map = {
        'firstName': firstName.text,
        'lastName': lastName.text,
      };
      await _userRepository.updateSingleField(map);

      /// Upadate user from RX Variables
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastName.text;

      /// Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(() => NavigationMenu());

      /// success message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated successfully!',
      );
    } catch (e) {
      /// Stop Loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Update Name Failed!',
        message: e.toString(),
      );
    }
  }
}
