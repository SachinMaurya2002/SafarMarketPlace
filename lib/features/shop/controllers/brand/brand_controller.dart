import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/brand/brand_repository.dart';
import 'package:safar_store/data/repositories/product/product_repository.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  // Variables
  final _repository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getBrands();
    super.onInit();
  }

  //Get all brands and featured brands
  Future<void> getBrands() async {
    try {
      // start Loading
      isLoading.value = true;

      List<BrandModel> allBrands = await _repository.fetchBrands();

      this.allBrands.assignAll(allBrands);

      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).toList(),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get brand specific products
  Future<List<ProductModel>> getBrandProducts(
    String brandId, {
    int limit = -1,
  }) async {
    try {
      List<ProductModel> products = await ProductRepository.instance
          .getProductForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }

  ///---- [--NEW---] Get the actual product count for a specific brand dynamically
  Future<int> getBrandProductCount(String brandId) async {
    try {
      // Queries the 'Products' collection to count items with this brand ID
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('brand.id', isEqualTo: brandId)
          .count() // High-performance aggregation query
          .get();

      return querySnapshot.count ?? 0;
    } catch (e) {
      print("Error fetching dynamic count: $e");
      return 0;
    }
  }

  /// ------Get Brands for Specific Category------
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await _repository.fetchBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }
}
