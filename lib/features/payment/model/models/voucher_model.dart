import 'dart:convert';

import 'package:ecowave/core.dart';

List<VoucherModel> voucherModelFromJson(String str) => List<VoucherModel>.from(
    json.decode(str).map((x) => VoucherModel.fromJson(x)));

String voucherModelToJson(List<VoucherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
  final int id;
  final String type;
  final int? minimumPurchase;
  final int? maximumDiscount;
  final int? discountPercent;
  final int maxClaimLimit;
  final int claimableCount;
  final String startDate;
  final String endDate;

  VoucherModel({
    required this.id,
    required this.type,
    this.minimumPurchase,
    this.maximumDiscount,
    this.discountPercent,
    required this.maxClaimLimit,
    required this.claimableCount,
    required this.startDate,
    required this.endDate,
  });

  String get name {
    if (type == "Diskon Belanja") {
      return "$type ${discountPercent!.toInt()}%";
    } else {
      return type;
    }
  }

  String get minimumPurchaseFormat =>
      "Min. Blj ${(minimumPurchase ?? 0).currencyFormatSimpleRp}";
  String get expiredDateFormatString =>
      DateTime.parse(endDate).toFormattedDate();

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["Id"],
        type: json["Type"],
        minimumPurchase: json["MinimumPurchase"],
        maximumDiscount: json["MaximumDiscount"],
        discountPercent: json["DiscountPercent"],
        maxClaimLimit: json["MaxClaimLimit"],
        claimableCount: json["ClaimableCount"],
        startDate: json["StartDate"],
        endDate: json["EndDate"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Type": type,
        "MinimumPurchase": minimumPurchase,
        "MaximumDiscount": maximumDiscount,
        "DiscountPercent": discountPercent,
        "MaxClaimLimit": maxClaimLimit,
        "ClaimableCount": claimableCount,
        "StartDate": startDate,
        "EndDate": endDate,
      };
}
