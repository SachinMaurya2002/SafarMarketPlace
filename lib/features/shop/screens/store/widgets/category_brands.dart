import 'package:flutter/material.dart';
import 'package:safar_store/common/widgets/brands/brand_showcase.dart';
import 'package:safar_store/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:safar_store/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:safar_store/features/shop/models/category_model.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            UListTileShimmer(),
            SizedBox(height: USizes.spaceBtwItems),
            UBoxesShimmer(),
            SizedBox(height: USizes.spaceBtwItems),
          ],
        );

        // Handle Loader, No Records, Error
        final widget = UCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) {
          return widget;
        }

        // Brands Found
        final brands = snapshot.data!;

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brand.id, limit: 3),
              builder: (context, snapshot) {
                // Handle loader, No Records, Error
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                );
                if (widget != null) return widget;

                // Products Found
                final products = snapshot.data!;
                return UBrandShowcase(
                  brand: brand,
                  images: products.map((product) => product.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
