import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/common/widgets/products/sortable_products.dart';
import 'package:safar_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:safar_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    this.query,
    this.futureMethod,
    required this.title,
  });

  final String title;
  final Future<List<ProductModel>>? futureMethod;
  final Query? query;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      ///-------[AppBar]--------
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),

      ///-------[Body]--------
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchproductsByQuery(query),
            builder: (context, snapshot) {
              const loader = UVerticalProductShimmer();
              final widget = UCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
              );
              if (widget != null) return widget;

              final products = snapshot.data!;
              return USortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
