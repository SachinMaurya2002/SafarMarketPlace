import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safar_store/features/authentication/screens/login/login.dart';
// ignore: implementation_imports
import 'package:smooth_page_indicator/src/smooth_page_indicator.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final storage = GetStorage();

  /// Variables
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  OnDotClicked? get dotNavigationClick => null;

  /// Update current index when page scroll
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  /// Jump to specific dot Selected Page
  void dotNavigateClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      storage.write('isFirstTime', false);
      Get.offAll(() => LoginScreen());
      return;
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);
  }

  /// Update current index and jump to the last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
