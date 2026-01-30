import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:safar_store/utils/helpers/device_helpers.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Obx(
      () => controller.currentIndex.value == 2
          ? SizedBox()
          : Positioned(
              top: UDeviceHelper.getAppBarHeight(),
              right: 0,
              child: TextButton(
                onPressed: controller.skipPage,
                child: Text('Skip'),
              ),
            ),
    );
  }
}
