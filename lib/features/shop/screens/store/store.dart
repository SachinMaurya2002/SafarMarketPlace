import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/appbar/tabbar.dart';
import 'package:safar_store/common/widgets/brands/brand_card.dart';
import 'package:safar_store/common/widgets/shimmer/brand_shimmer.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/screens/brands/all_brands.dart';
import 'package:safar_store/features/shop/screens/brands/brand_product.dart';
import 'package:safar_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:safar_store/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,

                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Primary Header
                      UStorePrimaryHeader(),
                      SizedBox(height: USizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            //Brands Heading
                            USectionHeading(
                              title: 'Brands',
                              onPressed: () => Get.to(() => BrandScreen()),
                            ),

                            //Brands Card
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: Obx(() {
                                // Loading State
                                if (brandController.isLoading.value) {
                                  return UBrandsShimmer();
                                }

                                // Empty State
                                if (brandController.featuredBrands.isEmpty) {
                                  return Text('Brands Not Found!');
                                }

                                // Data Found State
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: USizes.spaceBtwItems),

                                  shrinkWrap: true,
                                  itemCount:
                                      brandController.featuredBrands.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    BrandModel brand =
                                        brandController.featuredBrands[index];

                                    return SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(
                                        brand: brand,
                                        onTap: () => Get.to(
                                          () => BrandProductScreen(
                                            title: brand.name,
                                            brand: brand,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: controller.featuredCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: controller.featuredCategories
                .map((category) => UCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
