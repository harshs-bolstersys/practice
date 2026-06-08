// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:practical/service/storage_services.dart';

abstract class BaseService {
  static const String baseUrl = 'https://api.faceApi.space/api/v1';
  static const String getImageBaseUrl = '';

  final prefs = SharedPrefHelper();

  static Future<Map<String, String>> tokenCommonHeaders() async {
    final token = await SharedPrefHelper.getString('token');
    Map<String, String> header = {'Authorization': "Bearer $token"};
    log("Bearer Token ------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $token");
    return header;
  }

  /// ImageUpload
  static String uploadImage = "${baseUrl}/upload";

  /// Get API
  static const String getApiUrl = 'https://jsonplaceholder.typicode.com/posts';

  /// Post API
  static const String postApiUrl = 'https://fakestoreapi.com/auth/login';
}
