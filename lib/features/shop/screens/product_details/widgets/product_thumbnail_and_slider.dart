import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/products/favourite/favourite_icon.dart';
import 'package:safar_store/features/shop/controllers/product/image_controller.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    List<String> images = controller.getAllProductImages(product);

    return Container(
      color: dark ? UColors.darkGrey : UColors.light,
      child: Stack(
        children: [
          //[Image]---Main Image or Thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargeImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            color: UColors.primary,
                            value: progress.progress,
                          ),
                    ),
                  );
                }),
              ),
            ),
          ),

          //Image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => Obx(() {
                  bool isImageSelected =
                      controller.selectedProductImage.value == images[index];
                  return URoundedImage(
                    width: 80,
                    isNetworkImage: true,
                    onTap: () =>
                        controller.selectedProductImage.value = images[index],
                    backgroundColor: dark ? UColors.dark : UColors.white,
                    padding: EdgeInsets.all(USizes.sm),
                    border: Border.all(
                      color: isImageSelected
                          ? UColors.primary
                          : Colors.transparent,
                    ),
                    imageUrl: images[index],
                  );
                }),
              ),
            ),
          ),

          //[AppBar]---BackArrow---Favourite Icons
          UAppBar(
            showBackArrow: true,
            actions: [UFavouriteIcon(productId: product.id)],
          ),
        ],
      ),
    );
  }
}
