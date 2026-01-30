import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/layouts/grid_layout.dart';
import 'package:safar_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:safar_store/common/widgets/textfields/search_bar.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/home/home_controller.dart';
import 'package:safar_store/features/shop/controllers/product/product_controller.dart';
import 'package:safar_store/features/shop/screens/all_products/all_products.dart';
import 'package:safar_store/features/shop/screens/home/widgets/delivery_banner.dart';
import 'package:safar_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:safar_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:safar_store/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:safar_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final productController = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///-------Upper Part--->
            Stack(
              children: [
                //Total Height + 10
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),

                //Primary Header Container
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Bar
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections / 3),

                      // 2. [NEW] Delivery Banner - Visible immediately
                      const UDeliveryBanner(),
                      const SizedBox(height: USizes.spaceBtwSections / 2),

                      // Home Categories
                      UHomeCategories(),
                    ],
                  ),
                ),

                // Search Bar In AppHome Page
                USearchBar(),
              ],
            ),

            /// ----Lower Part-----
            // Banners
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  // Banners
                  UPromoSlider(),

                  const SizedBox(height: USizes.spaceBtwSections),

                  // Section Heading
                  USectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: 'Popular Products',
                        futureMethod: productController.getAllFeaturedProduct(),
                      ),
                    ),
                  ),
                  const SizedBox(height: USizes.spaceBtwSections),

                  // Grid View of Product Card
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (productController.featuredProducts.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Data Found!',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }

                    return UGridLayout(
                      itemCount: productController.featuredProducts.length,
                      itemBuilder: (context, index) {
                        final product =
                            productController.featuredProducts[index];
                        return UProductCardVertical(product: product);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
