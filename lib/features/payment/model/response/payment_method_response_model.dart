// To parse this JSON data, do
//
//     final paymentMethodResponseModel = paymentMethodResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/features/payment/model/entity/payment_method_entity.dart';

PaymentMethodResponseModel paymentMethodResponseModelFromJson(String str) =>
    PaymentMethodResponseModel.fromJson(json.decode(str));

String paymentMethodResponseModelToJson(PaymentMethodResponseModel data) =>
    json.encode(data.toJson());

class PaymentMethodResponseModel {
  String? name;
  String? type;
  List<String>? instructions;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  PaymentMethodResponseModel({
    this.name,
    this.type,
    this.instructions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      name: name ?? '',
      iconUrl: "https://i.ibb.co/S32HNjD/no-image.jpg",
      type: type ?? "",
      instructions: instructions ?? [],
    );
  }

  factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodResponseModel(
        name: json["name"],
        type: json["type"],
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
