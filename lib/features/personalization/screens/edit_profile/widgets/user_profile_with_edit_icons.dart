import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/widgets/icons/circular_icon.dart';
import 'package:safar_store/common/widgets/images/user_profile_logo.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';

class UserProfileWithEditIcon extends StatelessWidget {
  const UserProfileWithEditIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Stack(
      children: [
        // user profile logo
        Center(child: UserProfileLogo()),

        // Edit icons
        Obx(() {
          if (controller.isProfileUpLoading.value) {
            return SizedBox();
          }
          return Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: UCircularIcon(
                icon: Iconsax.edit,
                onPressed: controller.updateUserProfilePicture,
              ),
            ),
          );
        }),
      ],
    );
  }
}
