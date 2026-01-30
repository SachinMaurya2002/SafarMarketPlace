import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UDeliveryBanner extends StatelessWidget {
  const UDeliveryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Your App's Primary Color
    const Color primary = Color(0xFF1E90FF);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      padding: const EdgeInsets.symmetric(
        horizontal: USizes.md,
        vertical: USizes.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.cardRadiusLg),
        // Tiranga Gradient Background (Saffron -> White -> Green)
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF9933), // Deep Saffron
            Colors.white, // White
            Color(0xFF138808), // India Green
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          // 1. Icon (Using your Primary Color)
          const Icon(Iconsax.truck_fast, color: primary, size: 20),
          const SizedBox(width: USizes.spaceBtwItems),

          // 2. Text (Using your Primary Color for branding)
          Expanded(
            child: Text(
              'We currently deliver only to Surat, Gujarat',
              style: Theme.of(context).textTheme.labelLarge!.apply(
                color: UColors.primary,
                fontWeightDelta:
                    2, // Bold makes the light blue readable on white
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // 3. Interactive Button
          GestureDetector(
            onTap: () => Get.snackbar(
              'Delivery Update',
              'We are expanding to other cities soon! Stay tuned.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: primary,
              colorText: Colors.white,
            ),
            child: const Icon(Iconsax.info_circle, color: primary, size: 20),
          ),
        ],
      ),
    );
  }
}
