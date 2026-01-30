import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:safar_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:safar_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:safar_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:safar_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            ///Scrollable Page
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(
                  animation: UImages.onboarding1Animation,
                  title: UTexts.onBoardingTitle1,
                  subtitle: UTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  animation: UImages.onboarding2Animation,
                  title: UTexts.onBoardingTitle2,
                  subtitle: UTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  animation: UImages.onboarding3Animation,
                  title: UTexts.onBoardingTitle3,
                  subtitle: UTexts.onBoardingSubTitle3,
                ),
              ],
            ),

            /// Indicator
            OnBoardingDotNavigaion(),

            /// Bottom Button
            OnBoardingNextButton(),

            /// Skip Button
            OnBoardingSkipButton(),
          ],
        ),
      ),
    );
  }
}
