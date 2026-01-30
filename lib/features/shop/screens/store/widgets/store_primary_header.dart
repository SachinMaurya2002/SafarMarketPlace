import 'package:flutter/material.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:safar_store/common/widgets/textfields/search_bar.dart';
import 'package:safar_store/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Total Height + 20
        SizedBox(height: USizes.storePrimaryHeaderHeight + 10),

        //Primary Header Container
        UPrimaryHeaderContainer(
          height: USizes.storePrimaryHeaderHeight,
          child: UAppBar(
            title: Text(
              'Store',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.apply(color: UColors.white),
            ),
            actions: [UCartCounterIcon(dark: false)],
          ),
        ),

        // Search Bar In AppStore Page
        USearchBar(),
      ],
    );
  }
}
