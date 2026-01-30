import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:safar_store/common/widgets/loaders/animation_loader.dart';
import 'package:safar_store/features/shop/controllers/order/order_controller.dart';
import 'package:safar_store/features/shop/models/order_model.dart';
import 'package:safar_store/navigation_menu.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UOrdersListItems extends StatelessWidget {
  const UOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());

    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        // Handle Error, Loading and Empty State
        final nothingFound = UAnimationLoader(
          text: 'No Order Yet!',
          showActionButton: true,
          actionText: "Let's fill it",
          animation: UImages.pencilAnimation,
          onActionPressed: () => Get.offAll(() => NavigationMenu()),
        );
        final widget = UCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          nothingFound: nothingFound,
        );
        if (widget != null) return widget;

        List<OrderModel> orders = snapshot.data!;

        // Data Found
        return ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(height: USizes.spaceBtwItems),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            OrderModel order = orders[index];
            return URoundedContainer(
              showBorder: true,
              backgroundColor: dark ? UColors.dark : UColors.light,
              padding: EdgeInsets.all(USizes.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //1st Row
                  Row(
                    children: [
                      //Ship Icon
                      Icon(Iconsax.ship),
                      SizedBox(width: USizes.spaceBtwItems / 2),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Title
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(
                                    color: UColors.primary,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                            //Date
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_34, size: USizes.iconSm),
                      ),
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  //2nd Row
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            //Tag Icon
                            Icon(Iconsax.tag),
                            SizedBox(width: USizes.spaceBtwItems / 2),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Order
                                  Text(
                                    'Order',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),

                                  //Order Value
                                  Text(
                                    order.id,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                            //Calendar Icon
                            Icon(Iconsax.calendar),
                            SizedBox(width: USizes.spaceBtwItems / 2),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Shipping Text
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  //Shipping Date
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
