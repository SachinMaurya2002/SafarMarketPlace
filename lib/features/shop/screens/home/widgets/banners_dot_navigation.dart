import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/features/shop/controllers/banners/banner_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannersDotNavigaion extends StatelessWidget {
  const BannersDotNavigaion({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Obx(
      () => SmoothPageIndicator(
        count: bannerController.banners.length,
        effect: ExpandingDotsEffect(dotHeight: 6.0),
        controller: PageController(
          initialPage: bannerController.currentIndex.value,
        ),
      ),
    );
  }
}
