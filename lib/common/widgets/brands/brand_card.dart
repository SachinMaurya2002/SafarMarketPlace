import 'package:flutter/material.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart'; // Import Controller
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/utils/constants/enums.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: const EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Brands Image
            Flexible(
              child: URoundedImage(
                backgroundColor: Colors.transparent,
                imageUrl: brand.image,
                isNetworkImage: true,
              ),
            ),
            const SizedBox(width: USizes.spaceBtwItems / 2),

            // Right Portion
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Brand Name & Verify Icons
                  UBrandTitleWithVerifyIcon(
                    title: brand.name,
                    brandTextSizes: TextSizes.large,
                  ),

                  // [UPDATED] Dynamic Count Logic
                  FutureBuilder<int>(
                    future: BrandController.instance.getBrandProductCount(
                      brand.id,
                    ),
                    builder: (context, snapshot) {
                      // 1. Loading State
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading...',
                          style: Theme.of(context).textTheme.labelMedium,
                        );
                      }

                      // 2. Data State (Fallback to model count or 0 if fetch fails)
                      final dynamicCount =
                          snapshot.data ?? brand.productsCount ?? 0;

                      return Text(
                        '$dynamicCount products',
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
