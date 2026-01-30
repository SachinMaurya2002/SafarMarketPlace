import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:safar_store/features/authentication/screens/forget_password/forget_password.dart';
import 'package:safar_store/features/authentication/screens/login/login.dart';
import 'package:safar_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:safar_store/features/authentication/screens/signup/signup.dart';
import 'package:safar_store/features/authentication/screens/signup/verify_email.dart';
import 'package:safar_store/features/personalization/screens/address/address.dart';
import 'package:safar_store/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:safar_store/features/personalization/screens/profile/profile.dart';
import 'package:safar_store/features/shop/screens/cart/cart.dart';
import 'package:safar_store/features/shop/screens/checkout/checkout.dart';
import 'package:get/get.dart';
import 'package:safar_store/features/shop/screens/order/order.dart';
import 'package:safar_store/features/shop/screens/store/store.dart';
import 'package:safar_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:safar_store/navigation_menu.dart';
import 'package:safar_store/routes/routes.dart';

class UAppRoutes {
  static final screens = [
    GetPage(name: URoutes.home, page: () => const NavigationMenu()),
    GetPage(name: URoutes.store, page: () => StoreScreen()),
    GetPage(name: URoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: URoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: URoutes.order, page: () => const OrderScreen()),
    GetPage(name: URoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: URoutes.cart, page: () => const CartScreen()),
    GetPage(name: URoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: URoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: URoutes.signup, page: () => const SignupScreen()),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: URoutes.signIn, page: () => const LoginScreen()),
    GetPage(
      name: URoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(name: URoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
