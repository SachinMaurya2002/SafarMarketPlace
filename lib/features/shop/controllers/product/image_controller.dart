import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // Function to load all images of product
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    //Load Thumbnail Image
    images.add(product.thumbnail);

    //Assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    // Load all Images of product
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    // Load all images from the product variation
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      List<String> variationImages = product.productVariations!
          .map((variation) => variation.image)
          .toList();
      images.addAll(variationImages);
    }
    return images.toList();
  }

  /// Function to Show ENLARGE IMAGE when click
  void showEnlargeImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: USizes.defaultSpace * 2,
                horizontal: USizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            SizedBox(height: USizes.spaceBtwSections),

            // Close Button
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
