import 'package:get/get.dart';
import 'package:safar_store/data/repositories/product/product_repository.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/enums.dart';
import 'package:safar_store/utils/constants/texts.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Variables
  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedProduct();
    super.onInit();
  }

  //
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<ProductModel> products = await _repository.fetchAllProducts();
      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  // Fuction to get Only featured products--20 numbers
  Future<void> getFeaturedProduct() async {
    try {
      // Start Loading
      isLoading.value = true;

      //fetch featured products
      List<ProductModel> featuredProducts = await _repository
          .fetchFeaturedProducts();

      // assign products
      this.featuredProducts.assignAll(featuredProducts);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fuction to get all featured products-------
  Future<List<ProductModel>> getAllFeaturedProduct() async {
    try {
      //fetch featured products
      List<ProductModel> featuredProducts = await _repository
          .fetchAllFeaturedProducts();

      return featuredProducts;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }

  /// Calculate Sale Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originalPrice <= 0.0) {
      return null;
    }
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    return percentage.toStringAsFixed(1);
  }

  /// Get Product Price or price range for variable product
  String getProductprice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largetPrice = 0.0;

    // if no variation exist, return the single price or sale price
    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    } else {
      // FIX: Check if variations exist before looping
      if (product.productVariations == null ||
          product.productVariations!.isEmpty) {
        return product.price.toString();
      }
      // calculate the smallest and largest price among variation
      for (final variation in product.productVariations!) {
        double variationPrice = variation.salePrice > 0
            ? variation.salePrice
            : variation.price;

        if (variationPrice > largetPrice) {
          largetPrice = variationPrice;
        }

        if (variationPrice < smallestPrice) {
          smallestPrice = variationPrice;
        }
      }

      if (smallestPrice.isEqual(largetPrice)) {
        return largetPrice.toStringAsFixed(0);
      } else {
        return '${largetPrice.toStringAsFixed(0)} - ${UTexts.currency}${smallestPrice.toStringAsFixed(0)}';
      }
    }
  }

  ///Get product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
