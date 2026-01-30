import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/screens/all_products/all_products.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UChildSubCategoryList extends StatelessWidget {
  const UChildSubCategoryList({
    super.key,
    required this.parentId,
    required this.controller,
  });

  final String parentId;
  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getSubCategories(parentId),
      builder: (context, snapshot) {
        // 1. Loading & Error Checks
        const loader = UHorizontalProductShimmer();
        if (snapshot.connectionState == ConnectionState.waiting) return loader;
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const SizedBox.shrink(); // Hide if no child categories
        }
        if (snapshot.hasError) return const SizedBox.shrink();

        // 2. Data Found
        final subCategories = snapshot.data!;

        return SizedBox(
          height: 120, // Height for image + text
          child: ListView.separated(
            itemCount: subCategories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                const SizedBox(width: USizes.spaceBtwItems),
            itemBuilder: (context, index) {
              final category = subCategories[index];

              return GestureDetector(
                onTap: () => Get.to(
                  () => AllProductsScreen(
                    title: category.name,
                    futureMethod: controller.getCategoryProducts(
                      categoryId: category.id,
                      limit: -1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    // Circular Icon
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(USizes.sm),
                      decoration: BoxDecoration(
                        color: UHelperFunctions.isDarkMode(context)
                            ? UColors.black
                            : UColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: URoundedImage(
                          imageUrl: category.image,
                          isNetworkImage: true,
                          backgroundColor: Colors.transparent,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: USizes.spaceBtwItems / 2),

                    // Category Name Text
                    SizedBox(
                      width: 60,
                      child: Text(
                        category.name,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
