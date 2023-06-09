// To parse this JSON data, do
//
//     final productImageModel = productImageModelFromJson(jsonString);

import 'dart:convert';

ProductModel productImageModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productImageModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int id;
  final int productCategoryId;
  final String name;
  final int stock;
  final double price;
  final double rating;
  final String productDescription;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  ProductModel({
    required this.id,
    required this.productCategoryId,
    required this.name,
    required this.stock,
    required this.price,
    required this.rating,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productCategoryId: json["product_category_id"],
        name: json["name"],
        stock: json["stock"],
        price: json["price"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        productDescription: json["product_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_category_id": productCategoryId,
        "name": name,
        "stock": stock,
        "price": price,
        "rating": rating,
        "product_description": productDescription,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "deleted_at": deletedAt,
      };
}
