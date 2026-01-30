import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/widgets/images/rounded_image.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/screens/all_products/all_products.dart';
import 'package:safar_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class SearchStoreCategories extends StatelessWidget {
  const SearchStoreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Obx(() {
      // 1. Loading State
      if (controller.isCategoriesLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // 2. Empty State
      if (controller.allCategories.isEmpty) {
        return const Center(child: Text('No Categories Found!'));
      }

      // 3. Filter Root Categories (No Parent)
      final rootCategories = controller.allCategories
          .where((category) => category.parentId.isEmpty)
          .toList();

      return Column(
        children: [
          const USectionHeading(title: 'Categories', showActionButton: false),
          const SizedBox(height: USizes.spaceBtwItems),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rootCategories.length,
            itemBuilder: (context, index) {
              final rootCategory = rootCategories[index];

              // 4. Get Sub-Categories for this Root
              final subCategories = controller.allCategories
                  .where((c) => c.parentId == rootCategory.id)
                  .toList();

              return ExpansionTile(
                // --- Level 1: Root Category (e.g. Clothing) ---
                leading: URoundedImage(
                  imageUrl: rootCategory.image,
                  isNetworkImage: true,
                  onTap: () =>
                      Get.to(() => SubCategoryScreen(category: rootCategory)),
                  borderRadius: 0,
                  width: USizes.iconLg,
                  height: USizes.iconLg,
                  backgroundColor: Colors.transparent,
                  applyImageRadius: false,
                ),
                title: Text(
                  rootCategory.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                textColor: UColors.primary,
                iconColor: UColors.primary,

                // Hide arrow if no sub-categories
                trailing: subCategories.isEmpty ? const SizedBox() : null,

                children: subCategories.map((subCategory) {
                  // 5. Get Child-Sub-Categories for this Sub
                  final childSubCategories = controller.allCategories
                      .where((c) => c.parentId == subCategory.id)
                      .toList();

                  return ExpansionTile(
                    // --- Level 2: Sub Category (e.g. Men's Fashion) ---
                    title: Text(
                      subCategory.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: const Icon(Iconsax.arrow_right_3, size: 18),
                    childrenPadding: const EdgeInsets.only(left: USizes.xl),

                    // Hide arrow if no children
                    trailing: childSubCategories.isEmpty
                        ? const SizedBox()
                        : null,

                    // If leaf node (no children), navigate on expand
                    onExpansionChanged: (expanded) {
                      if (childSubCategories.isEmpty && expanded) {
                        Get.to(
                          () => AllProductsScreen(
                            title: subCategory.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: subCategory.id,
                              limit: -1,
                            ),
                          ),
                        );
                      }
                    },

                    children: childSubCategories.map((childCategory) {
                      return ListTile(
                        // --- Level 3: Child Category (e.g. Shirts) ---
                        title: Text(
                          childCategory.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        leading: const Icon(Iconsax.minus, size: 14),
                        contentPadding: const EdgeInsets.only(
                          left: USizes.spaceBtwItems,
                        ),
                        onTap: () => Get.to(
                          () => AllProductsScreen(
                            title: childCategory.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: childCategory.id,
                              limit: -1,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              );
            },
          ),
        ],
      );
    });
  }
}
