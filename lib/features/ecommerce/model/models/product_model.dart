// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int productId;
  final String name;
  final String category;
  final int stock;
  final int price;
  final String status;
  final String description;
  final List<String> productImageUrl;
  final double averageRating;
  final List<Rating> rating;

  ProductModel({
    required this.productId,
    required this.name,
    required this.category,
    required this.stock,
    required this.price,
    required this.status,
    required this.description,
    required this.productImageUrl,
    required this.averageRating,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["ProductId"],
        name: json["Name"],
        category: json["Category"],
        stock: json["Stock"],
        price: json["Price"],
        status: json["Status"],
        description: json["Description"],
        productImageUrl:
            List<String>.from(json["ProductImageUrl"].map((x) => x)),
        averageRating: json["AverageRating"]?.toDouble(),
        rating:
            List<Rating>.from(json["Rating"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "Name": name,
        "Category": category,
        "Stock": stock,
        "Price": price,
        "Status": status,
        "Description": description,
        "ProductImageUrl": List<dynamic>.from(productImageUrl.map((x) => x)),
        "AverageRating": averageRating,
        "Rating": List<dynamic>.from(rating.map((x) => x.toJson())),
      };
}

class Rating {
  final String name;
  final String photoProfileUrl;
  final double rating;
  final String comment;
  final String commentAdmin;
  String? photoUrl;
  String? videoUrl;

  Rating({
    required this.name,
    required this.photoProfileUrl,
    required this.rating,
    required this.comment,
    required this.commentAdmin,
    this.photoUrl,
    this.videoUrl,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        name: json["Name"],
        photoProfileUrl: json["PhotoProfileUrl"],
        rating: json["Rating"]?.toDouble(),
        comment: json["Comment"],
        commentAdmin: json["CommentAdmin"],
        photoUrl: json["PhotoUrl"],
        videoUrl: json["VideoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "PhotoProfileUrl": photoProfileUrl,
        "Rating": rating,
        "Comment": comment,
        "CommentAdmin": commentAdmin,
        "PhotoUrl": photoUrl,
        "VideoUrl": videoUrl,
      };
}
