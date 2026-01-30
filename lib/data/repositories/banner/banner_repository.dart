import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/services/cloudinary_services.dart';
import 'package:safar_store/features/shop/models/banners_model.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/exceptions/firebase_exceptions.dart';
import 'package:safar_store/utils/exceptions/format_exceptions.dart';
import 'package:safar_store/utils/exceptions/platform_exceptions.dart';
import 'package:safar_store/utils/helpers/helper_functions.dart';
import 'package:dio/dio.dart' as dio;

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  /// Upload banners
  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        // ✅ Convert asset to file safely
        File image = await UHelperFunctions.assetToFile(banner.imageUrl);

        // ✅ Upload to Cloudinary
        final dio.Response response = await _cloudinaryServices.uploadImage(
          image,
          UKeys.bannersFolder,
        );

        if (response.statusCode == 200 &&
            response.data != null &&
            response.data['secure_url'] != null) {
          // ✅ Always use secure_url
          banner.imageUrl = response.data['secure_url'];
        } else {
          throw 'Invalid Cloudinary response';
        }

        // ✅ Save banner to Firestore
        await _db.collection(UKeys.bannerCollection).doc().set(banner.toJson());

        print('✅ Banner Uploaded: ${banner.targetScreen}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while uploading banners.';
    }
  }

  /// Fetch the banners --{Function to fetch all active banners}
  Future<List<BannerModel>> fetchActiveBanners() async {
    try {
      final query = await _db
          .collection(UKeys.bannerCollection)
          .where('active', isEqualTo: true)
          .get();
      if (query.docs.isNotEmpty) {
        List<BannerModel> banners = query.docs
            .map((document) => BannerModel.fromDocument(document))
            .toList();
        return banners;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while uploading banners.';
    }
  }
}
