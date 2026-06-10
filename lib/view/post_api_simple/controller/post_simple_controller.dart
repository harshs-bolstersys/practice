import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:practical/view/post_api_riverpod/model/post_api_model.dart';

class PostSimpleController {
  final dio = Dio();

  Future<PostApiModel> postApi(String username, String password) async {
    try {
      final res = await dio.post('https://fakestoreapi.com/auth/login', data: {'username': username, 'password': password});
      return postApiModelFromJson(jsonEncode(res.data));
    } catch (e) {
      log('Error: $e');
      return PostApiModel(token: null);
    }
  }
}
