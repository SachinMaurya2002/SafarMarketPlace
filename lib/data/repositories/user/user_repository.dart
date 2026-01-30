import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/data/services/cloudinary_services.dart';
import 'package:safar_store/features/authentication/models/user_model.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:safar_store/utils/exceptions/firebase_exceptions.dart';
import 'package:safar_store/utils/exceptions/format_exceptions.dart';
import 'package:safar_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  //Function to store user data
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  /// ---[Read]---Function to fetch user details based on the current user
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }

      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  //---[Update]--Function to update user data(single field)
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  // ---[Delete]--Function to delete user data(single field)-------
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(UKeys.userCollection).doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  /// ---- Upload user profile picture ----
  Future<Map<String, String>> uploadProfileImage(File image) async {
    try {
      final response = await _cloudinaryServices.uploadImage(
        image,
        UKeys.profileFolder,
      );

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['secure_url'] != null &&
          response.data['public_id'] != null) {
        return {
          'url': response.data['secure_url'],
          'publicId': response.data['public_id'],
        };
      }

      throw 'Invalid Cloudinary response';
    } catch (e) {
      throw 'Failed to upload profile picture';
    }
  }

  // } catch (e) {
  //     throw 'Failed to upload profile picture. Please try again';
  //   }
}

  // /// ------[DeleteImage] ---- Function to delete profile picture
  // Future<dio.Response> deleteProfilePicture(String publicId) async {
  //   try {
  //     dio.Response response = await _cloudinaryServices.deleteImage(publicId);
  //     return response;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

