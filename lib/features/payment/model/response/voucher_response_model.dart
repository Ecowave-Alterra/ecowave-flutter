// To parse this JSON data, do
//
//     final voucherResponseModel = voucherResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';

VoucherResponseModel voucherResponseModelFromJson(String str) =>
    VoucherResponseModel.fromJson(json.decode(str));

String voucherResponseModelToJson(VoucherResponseModel data) =>
    json.encode(data.toJson());

class VoucherResponseModel {
  String? name;
  double? discount;
  String? expiredDate;
  String? photoContentUrl;
  String? termCondition;
  String? type;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  VoucherResponseModel({
    this.name,
    this.discount,
    this.expiredDate,
    this.photoContentUrl,
    this.termCondition,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  VoucherEntity toEntity() {
    return VoucherEntity(
      name: name ?? '',
      discount: discount ?? 0,
      expiredDate: DateTime.parse(expiredDate ?? DateTime.now().toString()),
      imageUrl: photoContentUrl ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
      termCondition: termCondition ?? '',
      type: type ?? '',
    );
  }

  factory VoucherResponseModel.fromJson(Map<String, dynamic> json) =>
      VoucherResponseModel(
        name: json["name"],
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
