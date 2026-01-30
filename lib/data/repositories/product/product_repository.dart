import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/services/cloudinary_services.dart';
import 'package:safar_store/features/shop/models/product_model.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/exceptions/firebase_exceptions.dart';
import 'package:safar_store/utils/exceptions/format_exceptions.dart';
import 'package:safar_store/utils/exceptions/platform_exceptions.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';
import 'package:dio/dio.dart' as dio;

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  // ------[Upload]-----function to upload list of products in firebase
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
        // --- A. Upload Thumbnail (Self-Healing) ---
        try {
          if (product.thumbnail.isNotEmpty) {
            File thumbnailFile = await UHelperFunctions.assetToFile(
              product.thumbnail,
            );
            dio.Response thumbRes = await _cloudinaryServices.uploadImage(
              thumbnailFile,
              UKeys.productsFolder,
            );
            if (thumbRes.statusCode == 200) {
              product.thumbnail = thumbRes.data['url'];
            }
          }
        } catch (e) {
          print(
            '⚠️ SKIP THUMBNAIL P${product.id}: Asset not found (${product.thumbnail})',
          );
        }

        // --- B. Upload Gallery Images ---
        List<String> uploadedUrls = [];
        // Local reference for null safety
        final imagesToUpload = product.images;

        if (imagesToUpload != null && imagesToUpload.isNotEmpty) {
          for (String path in imagesToUpload) {
            try {
              File file = await UHelperFunctions.assetToFile(path);
              dio.Response res = await _cloudinaryServices.uploadImage(
                file,
                UKeys.productsFolder,
              );
              if (res.statusCode == 200) {
                uploadedUrls.add(res.data['url']);
              }
            } catch (e) {
              print('⚠️ SKIP GALLERY IMAGE P${product.id}: $path not found');
            }
          }
        }

        // --- C. Upload Variations (Safe Logic) ---
        final variations = product.productVariations;
        if (variations != null && variations.isNotEmpty) {
          for (final variation in variations) {
            try {
              // Safely find if the variation image exists in the original local list
              int index = (imagesToUpload != null)
                  ? imagesToUpload.indexOf(variation.image)
                  : -1;

              if (index != -1 && index < uploadedUrls.length) {
                variation.image = uploadedUrls[index]; // Reuse Cloudinary URL
              } else if (variation.image.isNotEmpty) {
                // Upload if it's a unique image not in the gallery
                File varFile = await UHelperFunctions.assetToFile(
                  variation.image,
                );
                dio.Response varRes = await _cloudinaryServices.uploadImage(
                  varFile,
                  UKeys.productsFolder,
                );
                if (varRes.statusCode == 200) {
                  variation.image = varRes.data['url'];
                }
              }
            } catch (e) {
              print(
                '⚠️ SKIP VARIATION P${product.id}: ${variation.image} error',
              );
            }
          }
        }

        // --- D. Final Safe Mapping and Firestore Save ---
        // Crucial Fix: Only attempt to modify if product.images is not null
        if (product.images != null) {
          product.images!.clear();
          if (uploadedUrls.isNotEmpty) {
            product.images!.addAll(uploadedUrls);
          }
        }

        // Save the updated product model to Firestore
        await _db
            .collection(UKeys.productsCollection)
            .doc(product.id)
            .set(product.toJson());

        print('✅ Product ${product.id} successfully synced');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      print('CRITICAL ERROR DURING UPLOAD: $e');
      throw 'Something went wrong. Please check your internet and try again.';
    }
  }

  //----Fetch---Function to fetch list of products from firebase
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final query = await _db.collection(UKeys.productsCollection).get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }

  // --- FETCH FUNCTION --- list of 20 featured products in the homescreen
  Future<List<ProductModel>> fetchFeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('isFeatured', isEqualTo: true)
          .limit(20)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }

  // --- FETCH FUNCTION --- List of all featured products
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('isFeatured', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }

  // --- FETCH FUNCTION --- List of all featured products
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      if (querySnapshot.docs.isNotEmpty) {
        List<ProductModel> products = querySnapshot.docs
            .map((document) => ProductModel.fromQuerySnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }

  /// ----[Fetch] ---- Get the products list by the brands specific
  Future<List<ProductModel>> getProductForBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final query = limit == -1
          ? await _db
                .collection(UKeys.productsCollection)
                .where('brand.id', isEqualTo: brandId)
                .get()
          : await _db
                .collection(UKeys.productsCollection)
                .where('brand.id', isEqualTo: brandId)
                .limit(limit)
                .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      print("REPOSITORY ERROR: $e");
      throw 'Failed to fetch products. Please try again.';
    }
  }

  /// ----[Fetch] ---- Get the products list by the category specific
  Future<List<ProductModel>> getProductForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      // 1. Query the Bridge (ProductCategory collection)
      QuerySnapshot productCategoryQuery;

      if (limit == -1) {
        // Get ALL (for "View All" screen)
        productCategoryQuery = await _db
            .collection(UKeys.productCategoryCollection)
            .where('categoryId', isEqualTo: categoryId)
            .get();
      } else {
        // Get Limited (for "You Might Like" grid)
        productCategoryQuery = await _db
            .collection(UKeys.productCategoryCollection)
            .where('categoryId', isEqualTo: categoryId)
            .limit(limit)
            .get();
      }

      // 2. Extract Product IDs
      List<String> productIds = productCategoryQuery.docs
          .map((document) => document['productId'] as String)
          .toList();

      if (productIds.isEmpty) return [];

      // 3. [CRITICAL FIX] Handle Firestore 10-Item Limit
      // We loop through the IDs in chunks of 10 to avoid the crash.
      List<ProductModel> allProducts = [];

      for (var i = 0; i < productIds.length; i += 10) {
        // Create a safe chunk of 10 (or less)
        final end = (i + 10 < productIds.length) ? i + 10 : productIds.length;
        final batchIds = productIds.sublist(i, end);

        // Fetch this chunk
        final batchQuery = await _db
            .collection(UKeys.productsCollection)
            .where(FieldPath.documentId, whereIn: batchIds)
            .get();

        // Add to final list
        allProducts.addAll(
          batchQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList(),
        );
      }

      return allProducts;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }

  // --- FETCH FUNCTION --- list of favourite products when click wishlist icons
  Future<List<ProductModel>> getFavouriteProducts(
    List<String> productIds,
  ) async {
    try {
      if (productIds.isEmpty) return [];

      // [CRITICAL FIX] Handle Firestore 10-Item Limit using Batching
      // We must split the list into chunks of 10 to avoid query crashes.
      List<ProductModel> allProducts = [];

      for (var i = 0; i < productIds.length; i += 10) {
        // Create a safe chunk of 10 (or less)
        final end = (i + 10 < productIds.length) ? i + 10 : productIds.length;
        final batchIds = productIds.sublist(i, end);

        // Fetch this chunk
        final batchQuery = await _db
            .collection(UKeys.productsCollection)
            .where(FieldPath.documentId, whereIn: batchIds)
            .get();

        // Add to final list
        allProducts.addAll(
          batchQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList(),
        );
      }

      return allProducts;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch products. Please try again.';
    }
  }
}
