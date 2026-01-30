import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/common/widgets/icons/circular_icon.dart';
import 'package:safar_store/common/widgets/loaders/animation_loader.dart';
import 'package:safar_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:safar_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:safar_store/features/shop/screens/checkout/checkout.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      /// ----[AppBar]------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          UCircularIcon(
            icon: Iconsax.box_remove,
            onPressed: () => controller.clearCart(),
          ),
        ],
      ),

      /// ----[Body]------
      body: Obx(() {
        final emptyWidget = UAnimationLoader(
          text: 'Cart is Empty',
          animation: UImages.cartEmptyAnimation,
          showActionButton: true,
          actionText: "Let's fill it",
          onActionPressed: Get.back,
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        }

        return SingleChildScrollView(
          child: Padding(padding: UPadding.screenPadding, child: UCartItems()),
        );
      }),

      ///-----[Bottom Navigation Button]------
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return SizedBox();

        return Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: UElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text(
              'Checkout ${UTexts.currency} ${controller.totalCartPrice.value.toStringAsFixed(2)}',
            ),
          ),
        );
      }),
    );
  }
}
