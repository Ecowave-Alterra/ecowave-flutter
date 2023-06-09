// To parse this JSON data, do
//
//     final productImageModel = productImageModelFromJson(jsonString);

import 'dart:convert';

ProductImageModel productImageModelFromJson(String str) =>
    ProductImageModel.fromJson(json.decode(str));

String productImageModelToJson(ProductImageModel data) =>
    json.encode(data.toJson());

class ProductImageModel {
  final int id;
  final int productId;
  final String productImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  ProductImageModel({
    required this.id,
    required this.productId,
    required this.productImageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
        id: json["id"],
        productId: json["product_id"],
        productImageUrl: json["product_image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_image_url": productImageUrl,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "deleted_at": deletedAt,
      };
}
