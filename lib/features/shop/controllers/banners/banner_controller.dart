import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/banner/banner_repository.dart';
import 'package:safar_store/features/shop/models/banners_model.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // Variables
  final _repository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoading = false.obs;
  final carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //On CarouselPage Changed
  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  //Fetch All Banners
  Future<void> fetchBanners() async {
    try {
      // start Loading
      isLoading.value = true;

      List<BannerModel> activeBanners = await _repository.fetchActiveBanners();
      banners.assignAll(activeBanners);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
