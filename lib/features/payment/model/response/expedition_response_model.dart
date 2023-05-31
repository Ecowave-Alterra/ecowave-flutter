// To parse this JSON data, do
//
//     final expeditionResponseModel = expeditionResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/features/payment/model/entity/expedition_entity.dart';

ExpeditionResponseModel expeditionResponseModelFromJson(String str) =>
    ExpeditionResponseModel.fromJson(json.decode(str));

String expeditionResponseModelToJson(ExpeditionResponseModel data) =>
    json.encode(data.toJson());

class ExpeditionResponseModel {
  String? name;
  int? price;
  int? estimate;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ExpeditionResponseModel({
    this.name,
    this.price,
    this.estimate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  ExpeditionEntity toEntity() {
    return ExpeditionEntity(
      name: name ?? '',
      estimateFrom: DateTime.now(),
      estimateComing: DateTime.now().add(Duration(days: estimate ?? 0)),
      price: price ?? 0,
    );
  }

  factory ExpeditionResponseModel.fromJson(Map<String, dynamic> json) =>
      ExpeditionResponseModel(
        name: json["name"],
        price: json["price"],
        estimate: json["estimate"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "estimate": estimate,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
