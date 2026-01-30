import 'package:get/get.dart';
import 'package:safar_store/features/personalization/controllers/address_controller.dart';
import 'package:safar_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:safar_store/features/shop/controllers/product/variation_controller.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';

class UBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }
}
