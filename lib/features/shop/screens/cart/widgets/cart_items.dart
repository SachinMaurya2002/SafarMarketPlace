import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:safar_store/common/widgets/products/cart/cart_item.dart';
import 'package:safar_store/common/widgets/products/cart/product_quantity_with_add_remove.dart';
import 'package:safar_store/common/widgets/texts/product_price_text.dart';
import 'package:safar_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>
            SizedBox(height: USizes.spaceBtwSections),
        itemCount: controller.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = controller.cartItems[index];
          return Column(
            children: [
              //Cart Items
              UCartItem(cartItem: cartItem),
              if (showAddRemoveButton) SizedBox(height: USizes.spaceBtwItems),

              //Prize, Counter Button
              if (showAddRemoveButton)
                Row(
                  children: [
                    //Extra Space
                    SizedBox(width: 70.0),

                    //Quantity Buttons
                    UProductQuantityWithAddRemove(
                      quantity: cartItem.quantity,
                      add: () => controller.addOneToCart(cartItem),
                      remove: () => controller.removeOneFromCart(cartItem),
                    ),
                    Spacer(),

                    //Product Price
                    UProductPriceText(
                      price: (cartItem.price * cartItem.quantity)
                          .toStringAsFixed(0),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
