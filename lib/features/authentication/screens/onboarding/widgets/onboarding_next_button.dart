import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () =>
              Text(controller.currentIndex.value == 2 ? 'Get Started' : 'Next'),
        ),
      ),
    );
  }
}
