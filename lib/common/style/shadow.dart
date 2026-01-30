import 'package:flutter/material.dart';
import 'package:safar_store/utils/constants/colors.dart';

class UShadow {
  UShadow._();

  //Search Bar Shadow
  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      color: UColors.black.withValues(alpha: 0.1),
      spreadRadius: 2.0,
      blurRadius: 4.0,
    ),
  ];
  //Product Shadow
  static List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      color: UColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2),
    ),
  ];
}
