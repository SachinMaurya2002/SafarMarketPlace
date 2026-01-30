import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/features/personalization/controllers/user_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/validators/validation.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                // Email
                TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.email,
                  ),
                ),
                // Password
                Obx(
                  () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.isPasswordVisible.value,
                    validator: (value) =>
                        UValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: UTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.isPasswordVisible.toggle(),
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections),

                // Verify Button
                UElevatedButton(
                  onPressed: controller.reAuthenticateUser,
                  child: Text('Verify Button'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
