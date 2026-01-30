import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/screens/success_screen.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/data/repositories/order/order_repository.dart';
import 'package:safar_store/features/personalization/controllers/address_controller.dart';
import 'package:safar_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:safar_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:safar_store/features/shop/models/order_model.dart';
import 'package:safar_store/navigation_menu.dart';
import 'package:safar_store/utils/constants/enums.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressController.instance;
  final _repository = Get.put(OrderRepository());

  // fUNCTION FOR THE PROCESS THE ORDER
  Future<void> processOrder(double totalAmount) async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Processing your order...');

      // Check user existence
      String userId = AuthenticationRepository.instance.currentUser!.uid;
      if (userId.isEmpty) return;

      // Create Order Model
      OrderModel order = OrderModel(
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        userId: userId,
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
      );

      await _repository.saveOrder(order);

      cartController.clearCart();

      // Success Screens
      Get.to(
        () => SuccessScreen(
          title: 'Payment Success!',
          subTitle: 'Your item will be shipped soon!',
          image: UImages.successfulPaymentIcon,
          onTap: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Order Failed!',
        message: e.toString(),
      );
    }
  }

  // fUNCTION FOR THE FETCH THE ORDER DETAILS
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = _repository.fetchUserOrders();
      return orders;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }
}
