// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String productId;
  final String name;
  final String category;
  final int stock;
  final int price;
  final String status;
  final String description;
  final List<String>? productImageUrl;
  final double averageRating;
  final List<Review>? review;

  ProductModel({
    required this.productId,
    required this.name,
    required this.category,
    required this.stock,
    required this.price,
    required this.status,
    required this.description,
    this.productImageUrl,
    required this.averageRating,
    this.review,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["ProductId"],
        name: json["Name"],
        category: json["Category"],
        stock: json["Stock"],
        price: json["Price"],
        status: json["Status"],
        description: json["Description"],
        productImageUrl: json["ProductImageUrl"] == null
            ? []
            : List<String>.from(json["ProductImageUrl"]!.map((x) => x)),
        averageRating: json["AverageRating"]?.toDouble(),
        review: json["Review"] == null
            ? []
            : List<Review>.from(json["Review"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "Name": name,
        "Category": category,
        "Stock": stock,
        "Price": price,
        "Status": status,
        "Description": description,
        "ProductImageUrl": productImageUrl == null
            ? []
            : List<dynamic>.from(productImageUrl!.map((x) => x)),
        "AverageRating": averageRating,
        "Review": review == null
            ? []
            : List<dynamic>.from(review!.map((x) => x.toJson())),
      };
}

class Review {
  final String name;
  final String profilePhoto;
  final double rating;
  final String comment;
  final String commentAdmin;
  final String photoUrl;
  final String videoUrl;

  Review({
    required this.name,
    required this.profilePhoto,
    required this.rating,
    required this.comment,
    required this.commentAdmin,
    required this.photoUrl,
    required this.videoUrl,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["Name"],
        profilePhoto: json["ProfilePhoto"],
        rating: json["Rating"]?.toDouble(),
        comment: json["Comment"],
        commentAdmin: json["Comment_admin"],
        photoUrl: json["Photo_url"],
        videoUrl: json["Video_url"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "ProfilePhoto": profilePhoto,
        "Rating": rating,
        "Comment": comment,
        "Comment_admin": commentAdmin,
        "Photo_url": photoUrl,
        "Video_url": videoUrl,
      };
}
