import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/data/repositories/product/product_repository.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class FavouriteController extends GetxController {
  static FavouriteController instance = Get.find();

  // Variables
  RxMap<String, bool> favourites = <String, bool>{}.obs;

  final _storage = GetStorage(
    AuthenticationRepository.instance.currentUser!.uid,
  );

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  //Function to Load Favourites from local Storage
  // Function to Load Favourites from local Storage
  Future<void> initFavourites() async {
    // 1. Read from storage (can be null)
    final json = _storage.read('favourites');

    // 2. CHECK: If null, stop here (Fixes the crash)
    if (json == null) {
      favourites.clear();
      return;
    }

    // 3. Decode only if we have data
    final storedFavourites = jsonDecode(json) as Map<String, dynamic>;

    favourites.assignAll(
      storedFavourites.map((key, value) => MapEntry(key, value as bool)),
    );
  }

  /// Function to add or remove product from the wishlist
  void toggleFavouriteProduct(String productId) {
    if (favourites.containsKey(productId)) {
      favourites.remove(productId);
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(
        message: 'Product has been removed from the WishList',
      );
    } else {
      favourites[productId] = true;
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(
        message: 'Product has been added to the WishList',
      );
    }
  }

  /// Function to save store favourite in the local storage
  void saveFavouriteToStorage() {
    String encodedFavourites = jsonEncode(favourites);
    _storage.write('favourites', encodedFavourites);
  }

  /// Check is product available in favourites
  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  /// Function to get all favourite products only
  Future<List<ProductModel>> getFavouriteProducts() async {
    final productIds = favourites.keys.toList();

    return await ProductRepository.instance.getFavouriteProducts(productIds);
  }
}
