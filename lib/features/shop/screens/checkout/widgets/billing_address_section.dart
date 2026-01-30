import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/personalization/controllers/address_controller.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    controller.getAllAddresses();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----[Text]----Billing Address
        USectionHeading(
          title: 'Billing Address',
          buttonTitle: 'Change',
          onPressed: () => controller.selectNewAddressBottomSheet(context),
        ),

        Obx(() {
          final address = controller.selectedAddress.value;
          if (address.id.isEmpty) {
            return Text('Please select your Address!');
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.name, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: USizes.spaceBtwItems / 2),

              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: USizes.iconSm,
                    color: UColors.darkGrey,
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
                  Text(address.phoneNumber),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),

              Row(
                children: [
                  Icon(
                    Icons.location_history,
                    size: USizes.iconSm,
                    color: UColors.darkGrey,
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
                  Expanded(child: Text(address.toString(), softWrap: true)),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
