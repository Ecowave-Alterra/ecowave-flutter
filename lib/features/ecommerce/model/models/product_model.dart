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
  final List<String> productImageUrl;
  final double averageRating;
  final List<Review> review;

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
    required this.review,
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
        review:
            List<Review>.from(json["Review"].map((x) => Review.fromJson(x))),
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
        "Review": List<dynamic>.from(review.map((x) => x.toJson())),
      };
}

class Review {
  final String fullName;
  final String profilePhotoUrl;
  final double rating;
  final String comment;
  final String commentAdmin;
  final String photoUrl;
  final String videoUrl;

  Review({
    required this.fullName,
    required this.profilePhotoUrl,
    required this.rating,
    required this.comment,
    required this.commentAdmin,
    required this.photoUrl,
    required this.videoUrl,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        fullName: json["FullName"],
        profilePhotoUrl: json["ProfilePhotoUrl"],
        rating: json["Rating"]?.toDouble(),
        comment: json["Comment"],
        commentAdmin: json["CommentAdmin"],
        photoUrl: json["PhotoUrl"],
        videoUrl: json["VideoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "ProfilePhotoUrl": profilePhotoUrl,
        "Rating": rating,
        "Comment": comment,
        "CommentAdmin": commentAdmin,
        "PhotoUrl": photoUrl,
        "VideoUrl": videoUrl,
      };
}
