import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:safar_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:safar_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:safar_store/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:safar_store/utils/constants/enums.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //----[Body]-----
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-----Product Image With Slider----
            UProductThumbnailAndSlider(product: product),

            //---------[Product Details]------
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  //-Price, Title, Stock, and Brand
                  UProductMetaData(product: product),

                  //Attribute
                  if (product.productType ==
                      ProductType.variable.toString()) ...[
                    UProductAttributes(product: product),
                    SizedBox(height: USizes.spaceBtwSections),
                  ],

                  //Checkout Button
                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwSections),

                  //Description
                  USectionHeading(
                    title: 'Description',
                    showActionButton: false,
                    buttonTitle: '',
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  //Description Content
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),

      //--------[Bottom Navigation]------
      bottomNavigationBar: UBottomAddToCart(product: product),
    );
  }
}
