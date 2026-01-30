import 'package:flutter/material.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/brands/brand_card.dart';
import 'package:safar_store/common/widgets/products/sortable_products.dart';
import 'package:safar_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({
    super.key,
    required this.title,
    required this.brand,
  });

  final String title;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      ///-----[AppBar]-----
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ),

      ///----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              //---Brands-----
              UBrandCard(brand: brand),
              SizedBox(height: USizes.spaceBtwSections),

              //---Brand Products-----
              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  /// Handle Loading, Error and Empty State
                  const loader = UVerticalProductShimmer();

                  Widget? widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  // Data Found
                  List<ProductModel> products = snapshot.data!;

                  // FIX: Handle case where brand has no products strictly
                  if (products.isEmpty) {
                    return const Center(
                      child: Text("No products found for this brand."),
                    );
                  }

                  return USortableProducts(products: products);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
