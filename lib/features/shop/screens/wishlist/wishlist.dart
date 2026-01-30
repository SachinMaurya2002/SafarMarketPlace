import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/icons/circular_icon.dart';
import 'package:safar_store/common/widgets/layouts/grid_layout.dart';
import 'package:safar_store/common/widgets/loaders/animation_loader.dart';
import 'package:safar_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:safar_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:safar_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/navigation_menu.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------AppBar---------
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          UCircularIcon(
            icon: Iconsax.add,
            onPressed: () =>
                NavigationController.instance.selectedIndex.value = 0,
          ),
        ],
      ),
      //-------Body---------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: FavouriteController.instance.getFavouriteProducts(),
              builder: (context, snapshot) {
                final nothingFound = UAnimationLoader(
                  text: 'WishList is Empty...',
                  animation: UImages.pencilAnimation,
                  actionText: "Let's Add Some Favourite Product",
                  onActionPressed: () =>
                      NavigationController.instance.selectedIndex.value = 0,
                );
                const loader = UVerticalProductShimmer(itemCount: 6);

                /// Handle Empty Data, Loading And Error
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: nothingFound,
                );

                if (widget != null) return widget;

                /// Products Found
                List<ProductModel> products = snapshot.data!;

                return UGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      UProductCardVertical(product: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
