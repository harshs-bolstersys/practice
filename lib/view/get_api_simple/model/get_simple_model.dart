// To parse this JSON data, do
//
//     final getApiModel = getApiModelFromJson(jsonString);

import 'dart:convert';

List<GetApiModel2> getApiModelFromJson(String str) =>
    List<GetApiModel2>.from(json.decode(str).map((x) => GetApiModel2.fromJson(x)));

String getApiModelToJson(List<GetApiModel2> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetApiModel2 {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetApiModel2({this.userId, this.id, this.title, this.body});

  GetApiModel2 copyWith({int? userId, int? id, String? title, String? body}) =>
      GetApiModel2(userId: userId ?? this.userId, id: id ?? this.id, title: title ?? this.title, body: body ?? this.body);

  factory GetApiModel2.fromJson(Map<String, dynamic> json) =>
      GetApiModel2(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title, "body": body};
}
