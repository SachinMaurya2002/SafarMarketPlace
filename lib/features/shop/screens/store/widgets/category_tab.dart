import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/layouts/grid_layout.dart';
import 'package:safar_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:safar_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/models/category_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/features/shop/screens/all_products/all_products.dart';
import 'package:safar_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              SizedBox(height: USizes.spaceBtwItems),

              // You Might Like Section heading
              USectionHeading(
                title: 'You might like',
                onPressed: () => Get.to(
                  () => AllProductsScreen(
                    title: category.name,
                    futureMethod: controller.getCategoryProducts(
                      categoryId: category.id,
                      limit: -1,
                    ),
                  ),
                ),
                buttonTitle: 'View all',
              ),

              //Grid Layout
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  // Handle Error, Loader and Empty
                  const loader = UVerticalProductShimmer(itemCount: 4);
                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  // Data Found
                  final products = snapshot.data!;

                  return UGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ProductModel product = products[index];
                      return UProductCardVertical(product: product);
                    },
                  );
                },
              ),

              SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
