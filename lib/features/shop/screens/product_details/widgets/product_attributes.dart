import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/chips/choice_chip.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/texts/product_price_text.dart';
import 'package:safar_store/common/widgets/texts/product_title_text.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/product/variation_controller.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(
      () => Column(
        children: [
          //Selected Attributes Pricing & Description
          if (controller.selectedVariation.value.id.isNotEmpty)
            URoundedContainer(
              padding: EdgeInsets.all(USizes.md),
              backgroundColor: dark ? UColors.darkGrey : UColors.light,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title, Price & Stocks
                  Row(
                    children: [
                      // ------[Text]----Variation Heading----
                      USectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                        buttonTitle: '',
                      ),
                      SizedBox(width: USizes.spaceBtwItems),

                      Column(
                        children: [
                          //------[Price]---Sale Price, Actual Price---
                          Row(
                            children: [
                              //----[Text]---Price
                              UProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              ///----[Actual Price]
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '${UTexts.currency}${controller.selectedVariation.value.price.toStringAsFixed(0)}',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              SizedBox(width: USizes.spaceBtwItems),

                              ///----------[Sell Price]
                              UProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),

                          //------Stock Status-----
                          Row(
                            children: [
                              //----[Text]-----Stock---
                              UProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),

                              //------[Stock Status]------{In Stock/Out Of Stock}----
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  //Attribute Descriptions
                  UProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),

          SizedBox(height: USizes.spaceBtwItems),

          //Attributes------[colors]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  USectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                    buttonTitle: '',
                  ),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: USizes.sm,
                    children: attribute.values!.map((attributeValue) {
                      bool isSelected =
                          controller.selectedAttributes[attribute.name] ==
                          attributeValue;

                      bool available = controller
                          .getAttributeAvailabilityInVariation(
                            product.productVariations!,
                            attribute.name!,
                          )
                          .contains(attributeValue);
                      return UChoiceChip(
                        text: attributeValue,
                        selected: isSelected,
                        onSelected: available
                            ? (selected) {
                                if (available && selected) {
                                  controller.onAttributeSelected(
                                    product,
                                    attribute.name,
                                    attributeValue,
                                  );
                                }
                              }
                            : null,
                      );
                    }).toList(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
