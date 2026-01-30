import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/features/personalization/screens/address/address.dart';
import 'package:safar_store/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:safar_store/features/personalization/screens/profile/widgets/setting_menu_tile.dart';
import 'package:safar_store/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:safar_store/features/shop/screens/cart/cart.dart';
import 'package:safar_store/features/shop/screens/order/order.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Profile Header
            UProfilePrimaryHeader(),

            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  //User Profile Details
                  UserProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),

                  //Account Setting Heading
                  USectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                    buttonTitle: '',
                  ),

                  // Setting Row
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery addresses',
                    onTap: () => Get.to(() => AddressScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => CartScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My  Orders',
                    subtitle: 'In Progress and Completed Orders',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  //LogOut Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: AuthenticationRepository.instance.logout,
                      child: Text('LogOut'),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
