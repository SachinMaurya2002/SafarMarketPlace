import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/button/elevated_button.dart';
import 'package:safar_store/features/personalization/controllers/address_controller.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      //-----[AppBar]------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      //-----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,

          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                //Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      UValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                //Phone Number
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) =>
                      UValidator.validateEmptyText('Phone Number', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                //Street & Postal Code--->
                Row(
                  children: [
                    //------[Street]------
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            UValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),

                    //------[Postal Code]------
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            UValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                //---------City & State------>
                Row(
                  children: [
                    //------[City]------
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            UValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),
                    //------[State]------
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            UValidator.validateEmptyText('State', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                //Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      UValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections),
                //Save Button
                UElevatedButton(
                  onPressed: controller.addNewAddress,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
