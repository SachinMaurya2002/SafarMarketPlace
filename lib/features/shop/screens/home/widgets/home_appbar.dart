import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:safar_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final dark = UHelperFunctions.isDarkMode(context);
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HomeAppBar Title
          Text(
            UHelperFunctions.getGreetingMessage(),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),
          SizedBox(height: USizes.spaceBtwItems / 3),

          // HomeAppBar SubTitle
          Obx(() {
            if (controller.profileLoading.value) {
              return UShimmerEffect(width: 80, height: 15);
            }

            return Text(
              controller.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: UColors.white),
            );
          }),
        ],
      ),
      //AppBar Cart BagIcon
      actions: [UCartCounterIcon(dark: dark)],
    );
  }
}
