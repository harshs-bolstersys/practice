// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;

enum APIType { aGet, aPost, aImageForm }

class ApiService {
  var response;

  Future<dynamic> getResponse({
    required APIType apiType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    final dioClient = dio.Dio();

    // Configure timeout
    dioClient.options.connectTimeout = const Duration(seconds: 20);
    dioClient.options.receiveTimeout = const Duration(seconds: 30);
    dioClient.options.sendTimeout = const Duration(seconds: 20);

    // Configure HTTPS
    dioClient.options.followRedirects = true;
    dioClient.options.validateStatus = (status) {
      return status != null && status <= 500;
    };

    try {
      dioClient.options.headers = header;
      if (apiType == APIType.aGet) {
        // GET request
        final result = await dioClient.get(url);
        log("Response URL: $url");
        log("Status Code: ${result.statusCode}");
        log("Response Data: ${result.data}");

        // Check if response is HTML instead of JSON
        if (result.data is String && result.data.toString().trim().startsWith('<!DOCTYPE html>')) {
          log("❌ Server returned HTML instead of JSON");
          throw Exception('Server returned HTML instead of JSON. Please check the API endpoint.');
        }

        if (result.statusCode == 500) {
          throw Exception('Server error. Please try again later.');
        }

        if (result.data is String) {
          response = returnResponse(result.statusCode!, result.data);
        } else {
          response = returnResponse(result.statusCode!, jsonEncode(result.data));
        }
      } else if (apiType == APIType.aPost) {
        // POST request
        log("🚀 POST Request URL: $url");
        // log("📤 POST Request Body: $body");
        log("📤 POST Request Headers: $header");

        final result = await dioClient.post(url, data: body);

        log("Response URL:: $url");
        log("Status Code:: ${result.statusCode}");
        log("Response Data:: ${result.data}");

        // Check if response is HTML instead of JSON
        if (result.data is String && result.data.toString().trim().startsWith('<!DOCTYPE html>')) {
          log("❌ Server returned HTML instead of JSON");
          throw Exception('Server returned HTML instead of JSON. Please check the API endpoint.');
        }

        if (result.statusCode == 500) {
          throw Exception('Server error. Please try again later.');
        }

        if (result.data is String) {
          response = returnResponse(result.statusCode!, result.data);
        } else {
          response = returnResponse(result.statusCode!, jsonEncode(result.data));
        }
      } else if (apiType == APIType.aImageForm) {
        // Image/Form request
        final formData = dio.FormData.fromMap(body!);
        final result = await dioClient.post(
          url,
          data: formData,
          options: dio.Options(headers: header),
        );
        log("Response URL::: $url");
        log("Status Code::: ${result.statusCode}");
        log("Response Data::: ${result.data}");

        // Check if response is HTML instead of JSON
        if (result.data is String && result.data.toString().trim().startsWith('<!DOCTYPE html>')) {
          log("❌ Server returned HTML instead of JSON");
          throw Exception('Server returned HTML instead of JSON. Please check the API endpoint.');
        }

        if (result.statusCode == 500) {
          throw Exception('Server error. Please try again later.');
        }

        if (result.data is String) {
          response = returnResponse(result.statusCode!, result.data);
        } else {
          response = returnResponse(result.statusCode!, jsonEncode(result.data));
        }
      }
    } catch (error) {
      if (error is dio.DioException) {
        log("DioError Response: ${error.response?.data ?? error.message}");
        log("DioError Type: ${error.type}");
        log("DioError Error: ${error.error}");

        // ✅ Timeout
        if (error.type == dio.DioExceptionType.connectionTimeout ||
            error.type == dio.DioExceptionType.receiveTimeout ||
            error.type == dio.DioExceptionType.sendTimeout) {
          throw Exception('Request timed out. Please check your internet connection and try again.');
        }

        // ✅ Internet issue
        if (error.type == dio.DioExceptionType.connectionError) {
          throw Exception('Unable to connect to server. Please check your internet connection and try again.');
        }

        // ✅ 500 Error
        if (error.response?.statusCode == 500) {
          throw Exception('Server error. Please try again later.');
        }
      }
      log("ERROR====>[$error]");
      rethrow;
    }
    return response;
  }

  returnResponse(int status, String result) {
    try {
      switch (status) {
        case 200:
          return jsonDecode(result);
        case 201:
          return jsonDecode(result);
        case 400:
          return jsonDecode(result);
        case 401:
          return jsonDecode(result);
        case 403:
          return jsonDecode(result);
        case 404:
          return jsonDecode(result);
        case 500:
          return jsonDecode(result);
        default:
          return jsonDecode(result);
      }
    } catch (e) {
      log("❌ JSON parsing error: $e");
      log("❌ Raw response: $result");
      throw Exception('Invalid JSON response from server: ${e.toString()}');
    }
  }
}
