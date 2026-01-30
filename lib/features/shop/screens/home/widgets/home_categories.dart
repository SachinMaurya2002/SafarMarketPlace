import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/image_text/vertical_image_text.dart';
import 'package:safar_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:safar_store/features/shop/controllers/category/category_controller.dart';
import 'package:safar_store/features/shop/models/category_model.dart';
import 'package:safar_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:safar_store/utils/constants/colors.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/constants/texts.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),

          // Categories ListView
          Obx(() {
            final categories = controller.featuredCategories;

            //---Loading State
            if (controller.isCategoriesLoading.value) {
              return UCategoryShimmer(itemCount: 3);
            }
            //---Empty State
            if (categories.isEmpty) {
              return Text('Categories Not Found');
            }

            //---Data Found
            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];

                  return UVerticalImageText(
                    title: category.name,
                    image: category.image,
                    textColor: UColors.white,
                    onTap: () =>
                        Get.to(() => SubCategoryScreen(category: category)),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
