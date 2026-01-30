import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(CheckoutController());

    return Column(
      children: [
        //------[Payment Methods]------
        USectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Obx(
          () => Row(
            children: [
              //------[Payment Logo]------
              URoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? UColors.light : UColors.white,
                padding: EdgeInsets.all(USizes.sm),
                child: Image(
                  image: AssetImage(
                    controller.selectedPaymentMethod.value.image,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems / 2),

              //------[Payment Logo Text]------
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
