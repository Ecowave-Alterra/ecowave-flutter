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
  final String voucherId;
  final String startDate;
  final String endDate;
  final int minimumPurchase;
  final int maximumDiscount;
  final int discountPercent;
  final int claimableUserCount;
  final int maxClaimLimit;
  final int voucherTypeId;
  final VoucherType voucherType;
  final dynamic transactions;

  VoucherModel({
    required this.id,
    required this.voucherId,
    required this.startDate,
    required this.endDate,
    required this.minimumPurchase,
    required this.maximumDiscount,
    required this.discountPercent,
    required this.claimableUserCount,
    required this.maxClaimLimit,
    required this.voucherTypeId,
    required this.voucherType,
    this.transactions,
  });

  String get name {
    if (voucherType.type == "Diskon Belanja") {
      return "${voucherType.type} ${discountPercent.toInt()}%";
    } else {
      return voucherType.type;
    }
  }

  String get minimumPurchaseFormat =>
      "Min. Blj ${(minimumPurchase).currencyFormatSimpleRp}";
  String get expiredDateFormatString =>
      DateTime.parse(endDate).toFormattedDate();

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["Id"],
        voucherId: json["VoucherId"],
        startDate: json["StartDate"],
        endDate: json["EndDate"],
        minimumPurchase: json["MinimumPurchase"],
        maximumDiscount: json["MaximumDiscount"],
        discountPercent: json["DiscountPercent"],
        claimableUserCount: json["ClaimableUserCount"],
        maxClaimLimit: json["MaxClaimLimit"],
        voucherTypeId: json["VoucherTypeID"],
        voucherType: VoucherType.fromJson(json["VoucherType"]),
        transactions: json["Transactions"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VoucherId": voucherId,
        "StartDate": startDate,
        "EndDate": endDate,
        "MinimumPurchase": minimumPurchase,
        "MaximumDiscount": maximumDiscount,
        "DiscountPercent": discountPercent,
        "ClaimableUserCount": claimableUserCount,
        "MaxClaimLimit": maxClaimLimit,
        "VoucherTypeID": voucherTypeId,
        "VoucherType": voucherType.toJson(),
        "Transactions": transactions,
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
