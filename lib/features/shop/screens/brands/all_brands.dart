import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/brands/brand_card.dart';
import 'package:safar_store/common/widgets/layouts/grid_layout.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/screens/brands/brand_product.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      ///------[APPBAR]-------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brands', style: Theme.of(context).textTheme.headlineSmall),
      ),

      ///------[Body]-------
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///Text---Brands
              USectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              ///----List Of Brands
              Obx(() {
                // Loading
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                }

                // Empty State
                if (controller.allBrands.isEmpty) {
                  return Center(child: Text('Brands Not Found!'));
                }

                // Data Found State
                return UGridLayout(
                  itemCount: controller.allBrands.length,
                  itemBuilder: (context, index) {
                    BrandModel brand = controller.allBrands[index];

                    return UBrandCard(
                      onTap: () => Get.to(
                        () =>
                            BrandProductScreen(title: brand.name, brand: brand),
                      ),
                      brand: brand,
                    );
                  },
                  mainAxisExtent: 80,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
