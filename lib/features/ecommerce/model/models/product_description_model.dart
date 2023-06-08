// To parse this JSON data, do
//
//     final productDescriptionModel = productDescriptionModelFromJson(jsonString);

import 'dart:convert';

ProductDescriptionModel productDescriptionModelFromJson(String str) =>
    ProductDescriptionModel.fromJson(json.decode(str));

String productDescriptionModelToJson(ProductDescriptionModel data) =>
    json.encode(data.toJson());

class ProductDescriptionModel {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  ProductDescriptionModel({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProductDescriptionModel.fromJson(Map<String, dynamic> json) =>
      ProductDescriptionModel(
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "deleted_at": deletedAt,
      };
}
