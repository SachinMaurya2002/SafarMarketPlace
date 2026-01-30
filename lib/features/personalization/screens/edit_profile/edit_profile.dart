import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';
import 'package:safar_store/features/personalization/screens/change_name/change_name.dart';
import 'package:safar_store/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icons.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              //------User Profile Edit Icon
              UserProfileWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),

              //Divider 1
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              //-----Section Heading
              USectionHeading(
                title: 'Account Settings',
                showActionButton: false,
                buttonTitle: '',
              ),
              SizedBox(height: USizes.spaceBtwItems),

              //Account Setting Row
              UserDetailRow(
                title: 'Name',
                value: controller.user.value.fullName,
                onTap: () => Get.to(() => ChangeNameScreen()),
              ),
              UserDetailRow(
                title: 'UserName',
                value: controller.user.value.username,
                onTap: () {},
              ),
              SizedBox(height: USizes.spaceBtwItems),

              //Divider 2
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              //Profile Section Heading
              USectionHeading(
                title: 'Profile Settings',
                showActionButton: false,
                buttonTitle: '',
              ),
              SizedBox(height: USizes.spaceBtwItems),

              //Profile Setting Row
              UserDetailRow(
                title: 'User ID',
                value: controller.user.value.id,
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Email',
                value: controller.user.value.email,
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Phone Numbers',
                value: '+91 ${controller.user.value.phoneNumber}',
                onTap: () {},
              ),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: () {}),
              SizedBox(height: USizes.spaceBtwItems),

              //Divider 3
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              // Close Account Button
              TextButton(
                onPressed: controller.deleteAccountWarningPopup,
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
    required this.onTap,
  });

  final String title, value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: USizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: USizes.iconSm)),
          ],
        ),
      ),
    );
  }
}
