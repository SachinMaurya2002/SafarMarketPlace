import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/features/personalization/controllers/address_controller.dart';
import 'package:safar_store/features/personalization/models/address_model.dart';
import 'package:safar_store/features/personalization/screens/address/add_new_address.dart';
import 'package:safar_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      //-----[AppBar]-------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      //------[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllAddresses(),
              builder: (context, snapshot) {
                // Handle Error, Loading, Empty
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                );
                if (widget != null) return widget;

                // Data Found ----Addresses Found----
                List<AddressModel> addresses = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: USizes.spaceBtwItems),
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    return USingleAddress(
                      onTap: () => controller.selectAddress(addresses[index]),
                      address: addresses[index],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),

      //----------[Floating Action Button]----
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: UColors.primary,
        child: Icon(Iconsax.add),
      ),
    );
  }
}
