import 'package:flutter/material.dart';
import 'package:safar_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/helpers/pricing_calculator.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    final subTotal = cartcontroller.totalCartPrice.value;

    return Column(
      children: [
        //SubTotal
        Row(
          children: [
            Expanded(
              child: Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '${UTexts.currency}$subTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        //Shipping Fees
        Row(
          children: [
            Expanded(
              child: Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '${UTexts.currency}${UPricingCalculator.calculateShippingCost(subTotal, 'surat')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        //Tax Fee
        Row(
          children: [
            Expanded(
              child: Text(
                'Tax Fee(GST-5%/12%)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '${UTexts.currency}${UPricingCalculator.calculateTax(subTotal, 'surat')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        //Order Total
        Row(
          children: [
            Expanded(
              child: Text(
                'Order Total',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '${UTexts.currency}${UPricingCalculator.calculateTotalPrice(subTotal, 'surat')}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
