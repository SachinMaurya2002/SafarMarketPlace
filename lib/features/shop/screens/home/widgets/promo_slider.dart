import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:safar_store/features/shop/controllers/banners/banner_controller.dart';
import 'package:safar_store/features/shop/screens/home/widgets/banners_dot_navigation.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Obx(() {
      if (bannerController.isLoading.value) {
        return UShimmerEffect(width: double.infinity, height: 190);
      }

      if (bannerController.banners.isEmpty) {
        return Text('Banners Not Found');
      }
      return Column(
        children: [
          ///Slider
          CarouselSlider(
            items: bannerController.banners
                .map(
                  (banner) => URoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    onTap: () => Get.toNamed(banner.targetScreen),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged: (index, reason) =>
                  bannerController.onPageChanged(index),

              // ✅ ADDED AUTO PLAY SETTINGS HERE
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            carouselController: bannerController.carouselController,
          ),

          SizedBox(height: USizes.spaceBtwItems),

          // Dot Navigation
          BannersDotNavigaion(),
        ],
      );
    });
  }
}
