import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/child_subcategory/child_subcategory_list.dart';
import 'package:safar_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:safar_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/models/category_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/features/shop/screens/all_products/all_products.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      //------[AppBar]-------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      //------[Body]-------
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // Fetch Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  // Handle Loader, Error, Empty
                  const loader = UHorizontalProductShimmer();
                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) {
                    return widget;
                  }

                  // Data Found---SubCategories Found
                  List<CategoryModel> subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: NeverScrollableScrollPhysics(),

                    // Inside the ListView.builder for subCategories (Level 2)
                    itemBuilder: (context, index) {
                      CategoryModel subCategory = subCategories[index];

                      /// Fetch product for sub categories
                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                          categoryId: subCategory.id,
                        ),
                        builder: (context, snapshot) {
                          // Handle Loaders/Errors for the PRODUCT section
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return const CircularProgressIndicator();
                          if (snapshot.hasError) return const SizedBox.shrink();

                          // Even if products are empty, we might still want to show the Sub-Categories (Shirts, Pants)
                          // So we define products list safely
                          List<ProductModel> products = snapshot.data ?? [];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// 1. Section Heading (e.g., "Men's Fashion")
                              USectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                  () => AllProductsScreen(
                                    title: subCategory.name,
                                    futureMethod: controller
                                        .getCategoryProducts(
                                          categoryId: subCategory.id,
                                          limit: -1,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: USizes.spaceBtwItems / 2),

                              /// 2. [NEW] Level 3 Child Categories (Shirts, Pants, etc.)
                              /// We pass the 'Men's Fashion' ID (subCategory.id) to find its children.
                              UChildSubCategoryList(
                                parentId: subCategory.id,
                                controller: controller,
                              ),

                              const SizedBox(height: USizes.spaceBtwItems / 2),

                              /// 3. Horizontal Product List (Existing)
                              if (products.isNotEmpty)
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: USizes.spaceBtwItems,
                                        ),
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return UProductCardHorizontal(
                                        product: products[index],
                                      );
                                    },
                                  ),
                                ),

                              const SizedBox(height: USizes.spaceBtwSections),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
