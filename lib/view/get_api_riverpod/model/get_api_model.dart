// To parse this JSON data, do
//
//     final getApiModel = getApiModelFromJson(jsonString);

import 'dart:convert';

List<GetApiModel> getApiModelFromJson(String str) => List<GetApiModel>.from(json.decode(str).map((x) => GetApiModel.fromJson(x)));

String getApiModelToJson(List<GetApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetApiModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetApiModel({this.userId, this.id, this.title, this.body});

  GetApiModel copyWith({int? userId, int? id, String? title, String? body}) =>
      GetApiModel(userId: userId ?? this.userId, id: id ?? this.id, title: title ?? this.title, body: body ?? this.body);

  factory GetApiModel.fromJson(Map<String, dynamic> json) =>
      GetApiModel(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title, "body": body};
}
