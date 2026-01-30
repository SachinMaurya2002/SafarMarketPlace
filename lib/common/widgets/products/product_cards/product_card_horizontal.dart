import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/button/add_to_cart_button.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/products/favourite/favourite_icon.dart';
import 'package:safar_store/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:safar_store/common/widgets/texts/product_price_text.dart';
import 'package:safar_store/common/widgets/texts/product_title_text.dart';
import 'package:safar_store/features/shop/controllers/product/product_controller.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/features/shop/screens/product_details/product_details.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkerGrey : UColors.light,
        ),
        child: Row(
          children: [
            //Left Portion
            URoundedContainer(
              height: 120,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  //ThumbNail
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: URoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                    ),
                  ),

                  // Discount Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12.0,
                      child: URoundedContainer(
                        radius: USizes.sm,
                        backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.sm,
                          vertical: USizes.xs,
                        ),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: UColors.black),
                        ),
                      ),
                    ),

                  //Favourite Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: UFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),

            //Right Portion
            SizedBox(
              width: 170.0,
              child: Padding(
                padding: EdgeInsets.only(left: USizes.sm, top: USizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Upper Part
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Product Title
                        UProductTitleText(
                          title: product.title,
                          smallSize: true,
                        ),
                        SizedBox(height: USizes.spaceBtwItems / 2),

                        ///Product Brand
                        UBrandTitleWithVerifyIcon(title: product.brand!.name),
                      ],
                    ),
                    Spacer(),

                    //Lower Part
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Product Price
                        Flexible(
                          child: UProductPriceText(
                            price: controller.getProductprice(product),
                          ),
                        ),

                        //Add Button
                        ProductAddToCartButton(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
