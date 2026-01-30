import 'package:flutter/material.dart';
import 'package:safar_store/common/widgets/custom_shapes/circular_container.dart';
import 'package:safar_store/common/widgets/custom_shapes/rounded_edges_container.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            //Circular Container
            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            //Circular Container
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            // Child
            child,
          ],
        ),
      ),
    );
  }
}
