import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/features/personalization/controllers/change_name_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      /// -----AppBar-----
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Upadate Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      ///----[BODY]-------
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///----Text----missing
            Text(
              'Upadate your name to keep your profile accurate and personalized',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: USizes.spaceBtwSections),

            ///-----Form-----
            Form(
              key: controller.updateUserFormKey,
              child: Column(
                children: [
                  /// ----First Name----
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        UValidator.validateEmptyText('First Name', value),
                    decoration: InputDecoration(
                      labelText: UTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),

                  /// ----Last Name----
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        UValidator.validateEmptyText('Last Name', value),
                    decoration: InputDecoration(
                      labelText: UTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections),

            ///----Save Button
            UElevatedButton(
              onPressed: controller.updateUserName,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
