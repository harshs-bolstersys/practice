// To parse this JSON data, do
//
//     final postApiModel = postApiModelFromJson(jsonString);

import 'dart:convert';

PostApiModel postApiModelFromJson(String str) => PostApiModel.fromJson(json.decode(str));

String postApiModelToJson(PostApiModel data) => json.encode(data.toJson());

class PostApiModel {
  String? token;

  PostApiModel({this.token});

  PostApiModel copyWith({String? token}) => PostApiModel(token: token ?? this.token);

  factory PostApiModel.fromJson(Map<String, dynamic> json) => PostApiModel(token: json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}
