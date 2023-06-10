// To parse this JSON data, do
//
//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) =>
    InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) =>
    json.encode(data.toJson());

class InformationModel {
  final int id;
  final String title;
  final String status;
  final String photoContentUrl;
  final String writingContent;
  final String createdAt;
  final String updatedAt;
  final String? deleteAt;

  InformationModel({
    required this.id,
    required this.title,
    required this.status,
    required this.photoContentUrl,
    required this.writingContent,
    required this.createdAt,
    required this.updatedAt,
    this.deleteAt,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        photoContentUrl: json["photo_content_url"],
        writingContent: json["writing_content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deleteAt: json["delete_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "photo_content_url": photoContentUrl,
        "writing_content": writingContent,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "delete_at": deleteAt,
      };
}
