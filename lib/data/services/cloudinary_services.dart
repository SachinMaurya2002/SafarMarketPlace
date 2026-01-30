import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:safar_store/utils/constants/apis.dart';
import 'package:safar_store/utils/constants/keys.dart';

class CloudinaryServices extends GetxController {
  static CloudinaryServices get instance => Get.find();

  final _dio = dio.Dio();

  /// ---- Upload Image (UNSIGNED) ----
  Future<dio.Response> uploadImage(File image, String folderName) async {
    try {
      final api = UApiUrls.uploadApi(UKeys.cloudName);

      final formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
        'upload_preset': UKeys.uploadPreset,
        'folder': folderName,
      });

      final response = await _dio.post(
        api,
        data: formData,
        options: dio.Options(contentType: 'multipart/form-data'),
      );

      return response;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
