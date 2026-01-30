import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safar_store/data/repositories/authentication_repository.dart';
import 'package:safar_store/features/personalization/models/address_model.dart';
import 'package:safar_store/utils/constants/keys.dart';
import 'package:safar_store/utils/exceptions/firebase_exceptions.dart';
import 'package:safar_store/utils/exceptions/format_exceptions.dart';
import 'package:safar_store/utils/exceptions/platform_exceptions.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;

  ///----[upload]----Function to store user address
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      final curentAddress = await _db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .add(address.toJson());
      return curentAddress.id;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while saving your Address Information. Please try again later!';
    }
  }

  /// ----[Fetch]------Function to Show/Fetch User Address
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if (userId.isEmpty) throw 'User Not Found, Please Login again';
      final query = await _db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .get();
      if (query.docs.isNotEmpty) {
        List<AddressModel> addresses = query.docs
            .map((doc) => AddressModel.fromDocumentSnapshot(doc))
            .toList();
        return addresses;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Unable to find addresses. Please try again later!';
    }
  }

  /// ----Function to update selected address fields of address
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      await _db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .doc(addressId)
          .update({'selectedAddress': selected});
    } catch (e) {
      throw 'Unable to update selected address. Please try again!';
    }
  }
}
