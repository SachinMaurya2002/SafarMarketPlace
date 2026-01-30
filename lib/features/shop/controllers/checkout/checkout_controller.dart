import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/features/shop/models/payment_method_model.dart';
import 'package:safar_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:safar_store/utils/constants/images.dart';
import 'package:safar_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final RxString shippingLocation = 'Surat, Gujarat'.obs;

  // Variables
  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(
      name: 'Cash on delivery',
      image: UImages.codIcon,
    );
    super.onInit();
  }

  // Example method if you need to update it later
  void updateLocation(String newLocation) {
    shippingLocation.value = newLocation;
  }

  //
  Future<void> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Cash on delivery',
                  image: UImages.codIcon,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Paypal',
                  image: UImages.paypal,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Paytm',
                  image: UImages.paytm,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Google Pay',
                  image: UImages.googlePay,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Apple Pay',
                  image: UImages.applePay,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Credit Card',
                  image: UImages.creditCard,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Master Card',
                  image: UImages.masterCard,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Visa',
                  image: UImages.visa,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Pay Stack',
                  image: UImages.paystack,
                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
