import 'package:get/get.dart';
import 'package:safar_store/data/repositories/category/category_repository.dart';
import 'package:safar_store/data/repositories/product/product_repository.dart';
import 'package:safar_store/features/shop/models/category_model.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Repository
  final CategoryRepository _repository = Get.put(CategoryRepository());

  /// Variables
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  RxBool isCategoriesLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Function to get all categories & featured categories from firebase
  Future<void> fetchCategories() async {
    try {
      //start loading
      isCategoriesLoading.value = true;

      // fetch categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      allCategories.assignAll(categories);

      // get featured categories
      featuredCategories.assignAll(
        categories.where(
          (category) => category.isFeatured && category.parentId.isEmpty,
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }

  // Get Category products
  Future<List<ProductModel>> getCategoryProducts({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      final products = await ProductRepository.instance.getProductForCategory(
        categoryId: categoryId,
        limit: limit,
      );

      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }

  // Get SubCategory of the Selected SubCategory
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _repository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }
}
