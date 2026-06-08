import 'dart:convert';

import 'package:practical/api/api_end_points.dart';
import 'package:practical/api/api_handler.dart';
import 'package:practical/view/get_api/model/get_api_model.dart';
import 'package:practical/view/post_api/model/post_api_model.dart';

class AuthRepo extends BaseService {
  /// Get API Repo
  static Future<List<GetApiModel>> getApiRepo() async {
    var response = await ApiService().getResponse(apiType: APIType.aGet, url: BaseService.getApiUrl);
    return getApiModelFromJson(jsonEncode(response));
  }

  /// Post API Repo
  static Future<PostApiModel> postApiRepo(Map<String, dynamic> postBody) async {
    var response = await ApiService().getResponse(apiType: APIType.aPost, url: BaseService.postApiUrl, body: postBody);
    return postApiModelFromJson(jsonEncode(response));
  }
}
