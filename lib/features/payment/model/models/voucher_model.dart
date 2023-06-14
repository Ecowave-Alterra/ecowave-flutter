// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/core.dart';

List<VoucherModel> voucherModelFromJson(String str) => List<VoucherModel>.from(
    json.decode(str).map((x) => VoucherModel.fromJson(x)));

String voucherModelToJson(List<VoucherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
  final int id;
  final String startDate;
  final String endDate;
  final int? minimumPurchase;
  final int? maximumDiscount;
  final int? discountPercent;
  final int claimableCount;
  final int maxClaimLimit;
  final int voucherTypeId;
  final VoucherType voucherType;

  VoucherModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    this.minimumPurchase,
    this.maximumDiscount,
    this.discountPercent,
    required this.claimableCount,
    required this.maxClaimLimit,
    required this.voucherTypeId,
    required this.voucherType,
  });

  String get name {
    if (voucherType.type == "Diskon Belanja") {
      return "${voucherType.type} ${discountPercent!.toInt()}%";
    } else {
      return voucherType.type;
    }
  }

  String get minimumPurchaseFormat =>
      "Min. Blj ${(minimumPurchase ?? 0).currencyFormatSimpleRp}";
  String get expiredDateFormatString =>
      DateTime.parse(endDate).toFormattedDate();

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["Id"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        minimumPurchase: json["minimumPurchase"],
        maximumDiscount: json["maximumDiscount"],
        discountPercent: json["discountPercent"],
        claimableCount: json["claimableCount"],
        maxClaimLimit: json["maxClaimLimit"],
        voucherTypeId: json["voucherTypeID"],
        voucherType: VoucherType.fromJson(json["VoucherType"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "startDate": startDate,
        "endDate": endDate,
        "minimumPurchase": minimumPurchase,
        "maximumDiscount": maximumDiscount,
        "discountPercent": discountPercent,
        "claimableCount": claimableCount,
        "maxClaimLimit": maxClaimLimit,
        "voucherTypeID": voucherTypeId,
        "VoucherType": voucherType.toJson(),
      };
}

class VoucherType {
  final String type;
  final String photoUrl;

  VoucherType({
    required this.type,
    required this.photoUrl,
  });

  factory VoucherType.fromJson(Map<String, dynamic> json) => VoucherType(
        type: json["type"],
        photoUrl: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "photoURL": photoUrl,
      };
}
