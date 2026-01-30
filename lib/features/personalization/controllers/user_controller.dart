import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/data/repositories/user/user_repository.dart';
import 'package:safar_store/features/authentication/models/user_model.dart';
import 'package:safar_store/features/authentication/screens/login/login.dart';
import 'package:safar_store/features/personalization/screens/edit_profile/widgets/re_authenticate_user_form.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool isProfileUpLoading = false.obs;

  /// Re- Authenticate Form Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save the user Records
  Future<void> saveUserReord(UserCredential userCredential) async {
    try {
      // First Upadate Rx Variable and then check if user data is already stored. if not then store
      await fetchUserDetails();

      if (user.value.id.isEmpty) {
        // convert fullname to firstname & lastName
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username = '${userCredential.user!.displayName}2312637';

        // create user model
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // save user model
        await _userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      USnackBarHelpers.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information.',
      );
    }
  }

  /// Function to fetch the user Records
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Function for the popup to delete Account Confirmation
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  /// Function for the Delete User Records....
  Future<void> deleteUserAccount() async {
    try {
      // start loading
      UFullScreenLoader.openLoadingDialog('Processing...');

      // Re- Authentication User
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;
      // If Google Provider
      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(() => LoginScreen());

        // If Email/ Password Provider
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(() => ReAuthenticateUserForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // ------- ReAuthenticate User with email and password
  Future<void> reAuthenticateUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Processing...');

      // Check User Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Re Authenticate User with email and password
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // Delete Account
      await AuthenticationRepository.instance.deleteAccount();

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(() => LoginScreen());
    } catch (e) {
      // Stop Loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  /// Update user profile picture
  /// Update user profile picture
  Future<void> updateUserProfilePicture() async {
    try {
      // Start Loading
      isProfileUpLoading.value = true;

      // Pick an image from Gallery
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image == null) return;

      // Convert XFile to File
      File file = File(image.path);

      // 🔥 Upload image (Repository returns clean data)
      final result = await _userRepository.uploadProfileImage(file);

      final String imageUrl = result['url']!;
      final String publicId = result['publicId']!;

      // Update Firestore
      await _userRepository.updateSingleField({
        'profilePicture': imageUrl,
        'publicId': publicId,
      });

      // Update local Rx user
      user.value.profilePicture = imageUrl;
      user.value.publicId = publicId;
      user.refresh();

      // Success message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulations',
        message: 'Your profile picture was updated successfully',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isProfileUpLoading.value = false;
    }
  }
}
