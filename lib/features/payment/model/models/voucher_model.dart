// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/core.dart';

VoucherModel voucherModelFromJson(String str) =>
    VoucherModel.fromJson(json.decode(str));

String voucherModelToJson(VoucherModel data) => json.encode(data.toJson());

class VoucherModel {
  final String name;
  final int minimumPurchase;
  final double discount;
  final String expiredDate;
  final String photoContentUrl;
  final String termCondition;
  final String type;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  VoucherModel({
    required this.name,
    required this.minimumPurchase,
    required this.discount,
    required this.expiredDate,
    required this.photoContentUrl,
    required this.termCondition,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  String get minimumPurchaseFormat =>
      "Min. Blj ${minimumPurchase.currencyFormatSimpleRp}";
  String get expiredDateFormatString =>
      DateTime.parse(expiredDate).toFormattedDate();

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        name: json["name"],
        minimumPurchase: json["minimum_purchase"],
        discount: json["discount"]?.toDouble(),
        expiredDate: json["expired_date"],
        photoContentUrl: json["photo_content_url"],
        termCondition: json["term_condition"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "minimum_purchase": minimumPurchase,
        "discount": discount,
        "expired_date": expiredDate,
        "photo_content_url": photoContentUrl,
        "term_condition": termCondition,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
