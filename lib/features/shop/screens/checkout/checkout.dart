import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/textfields/promo_code.dart';
import 'package:safar_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:safar_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:safar_store/features/shop/controllers/order/order_controller.dart';
import 'package:safar_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:safar_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:safar_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:safar_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:safar_store/features/shop/screens/checkout/widgets/free_delivery_label.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/helpers/pricing_calculator.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final cartController = CartController.instance;
    double subTotal = cartController.totalCartPrice.value;
    double totalPrice = UPricingCalculator.calculateTotalPrice(
      subTotal,
      'surat',
    );
    final orderController = Get.put(OrderController());

    return Scaffold(
      //-----[App Bar]-------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      //-----[Body]-------
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // List of Items
              const UCartItems(showAddRemoveButton: false),
              const SizedBox(height: USizes.spaceBtwSections),

              // Promo Code
              const UPromoCodeField(),
              const SizedBox(height: USizes.spaceBtwSections),

              // Free Delivery Label-----
              Obx(
                () => FreeDeliveryLabel(
                  location: controller.shippingLocation.value,
                ),
              ),
              const SizedBox(height: USizes.spaceBtwSections),
              // Billing Section
              URoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: const [
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    UBillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      ///-----[Bottom Navigation Button]------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalPrice)
              : () => USnackBarHelpers.errorSnackBar(
                  title: 'Empty Cart',
                  message: 'Add Items in the Cart',
                ),
          child: Text('Checkout ${UTexts.currency}$totalPrice'),
        ),
      ),
    );
  }
}
