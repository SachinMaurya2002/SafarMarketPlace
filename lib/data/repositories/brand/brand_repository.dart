import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/services/cloudinary_services.dart';
import 'package:safar_store/features/shop/models/brand_category_model.dart';
import 'package:safar_store/features/shop/models/brand_model.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/exceptions/firebase_exceptions.dart';
import 'package:safar_store/utils/exceptions/format_exceptions.dart';
import 'package:safar_store/utils/exceptions/platform_exceptions.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';
import 'package:dio/dio.dart' as dio;

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  //Upload- function to upload all brands
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      for (BrandModel brand in brands) {
        //Convert Asset path to file
        File brandImage = await UHelperFunctions.assetToFile(brand.image);

        //Upload brand image to cloudinary
        dio.Response response = await _cloudinaryServices.uploadImage(
          brandImage,
          UKeys.brandsFolder,
        );
        if (response.statusCode == 200) {
          brand.image = response.data['url'];
        }

        // store data to firebase firestore
        await _db
            .collection(UKeys.brandsCollection)
            .doc(brand.id)
            .set(brand.toJson());
        print('Brand ${brand.name} uploaded successfully');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      print('CRITICAL ERROR DURING UPLOAD: $e');
      throw 'Something went wrong. Please try again.';
    }
  }

  //Fetch --- Function to fetch all brands
  Future<List<BrandModel>> fetchBrands() async {
    try {
      final query = await _db.collection(UKeys.brandsCollection).get();

      if (query.docs.isNotEmpty) {
        List<BrandModel> brands = query.docs
            .map((document) => BrandModel.fromSnapshot(document))
            .toList();
        return brands;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //Fetch --- Function to category specific brands
  Future<List<BrandModel>> fetchBrandsForCategory(String categoryId) async {
    try {
      /// Query to get all documents where categoryId matches the provided categoryId
      final brandCategoryQuery = await _db
          .collection(UKeys.brandCategoryCollection)
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // // convert document to model
      List<BrandCategoryModel> brandCategories = brandCategoryQuery.docs
          .map((doc) => BrandCategoryModel.fromSnapshot(doc))
          .toList();

      // Extract brandIds from BrandCategoryModel
      List<String> brandIds = brandCategories
          .map((brandCategory) => brandCategory.brandId)
          .toList();

      // 3. Handle Empty State
      if (brandIds.isEmpty) return [];

      // 4. [CRITICAL FIX] Firestore Limit Check
      // Firestore throws an error if 'whereIn' has more than 10 items.
      // We slice the list to take only the first 10 brands.
      if (brandIds.length > 10) {
        brandIds = brandIds.sublist(0, 10);
      }

      // Query to get brands based on brandIds
      final brandQuery = await _db
          .collection(UKeys.brandsCollection)
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(4)
          .get();

      // Conert Documents to model
      List<BrandModel> brands = brandQuery.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();

      return brands;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
