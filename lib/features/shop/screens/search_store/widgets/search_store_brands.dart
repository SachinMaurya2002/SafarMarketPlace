import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/image_text/vertical_image_text.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/screens/brands/all_brands.dart';
import 'package:safar_store/features/shop/screens/brands/brand_product.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class SearchStoreBrands extends StatelessWidget {
  const SearchStoreBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    bool dark = UHelperFunctions.isDarkMode(context);

    return Obx(() {
      // Loading State
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      // Empty State
      if (controller.allBrands.isEmpty) {
        return Text('No Brands Found!');
      }

      // Data Found
      List<BrandModel> brands = controller.allBrands.take(10).toList();
      return Column(
        children: [
          USectionHeading(
            title: 'Brands',
            onPressed: () => Get.to(() => BrandScreen()),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Wrap(
            spacing: USizes.spaceBtwItems,
            runSpacing: USizes.spaceBtwItems,
            children: brands
                .map(
                  (brand) => UVerticalImageText(
                    onTap: () => Get.to(
                      () => BrandProductScreen(title: brand.name, brand: brand),
                    ),
                    title: brand.name,
                    image: brand.image,
                    textColor: dark ? UColors.white : UColors.black,
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}
