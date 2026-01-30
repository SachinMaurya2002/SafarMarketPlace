import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/layouts/grid_layout.dart';
import 'package:safar_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:safar_store/features/shop/controllers/product/product_controller.dart';
import 'package:safar_store/features/shop/screens/search_store/widgets/search_store_brands.dart';
import 'package:safar_store/features/shop/screens/search_store/widgets/search_store_categories.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class SearchStoreScreen extends StatelessWidget {
  const SearchStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString searchText = ''.obs;

    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // Search Field
              Hero(
                tag: 'search_animation',
                child: Material(
                  color: Colors.transparent,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search in store',
                    ),
                    onChanged: (value) => searchText.value = value,
                  ),
                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),

              Obx(() {
                if (searchText.value.isEmpty) {
                  return Column(
                    children: [
                      // Brands
                      SearchStoreBrands(),
                      SizedBox(height: USizes.spaceBtwSections),

                      // Categories
                      SearchStoreCategories(),
                    ],
                  );
                }

                return FutureBuilder(
                  future: ProductController.instance.getAllProducts(),
                  builder: (context, snapshot) {
                    /// Handle Loading, Empty, Data Found State
                    // Loading State
                    final widget = UCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                    );

                    // Empty State
                    if (widget != null) {
                      return widget;
                    }
                    // Data Found State
                    final products = snapshot.data!;

                    // Filter the products based on search bar
                    final filteredProducts = products
                        .where(
                          (product) => product.title.toLowerCase().contains(
                            searchText.value.toLowerCase(),
                          ),
                        )
                        .toList();
                    // Filtered product empty
                    if (filteredProducts.isEmpty) {
                      return Text('No products found');
                    }

                    return UGridLayout(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return UProductCardVertical(product: product);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
