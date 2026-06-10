import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:practical/view/get_api_simple/model/get_simple_model.dart';

class GetApiSimpleController {
  final dio = Dio();
  Future<List<GetApiModel2>> getApi() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    log('response: ${response.data}');
    return getApiModelFromJson(jsonEncode(response.data));
  }
}
