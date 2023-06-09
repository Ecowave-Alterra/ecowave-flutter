import 'dart:convert';

import 'package:ecowave/core.dart';

ExpeditionModel expeditionModelFromJson(String str) =>
    ExpeditionModel.fromJson(json.decode(str));

String expeditionModelToJson(ExpeditionModel data) =>
    json.encode(data.toJson());

class ExpeditionModel {
  final int id;
  final String name;
  final int price;
  final int estimate;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ExpeditionModel({
    required this.id,
    required this.name,
    required this.price,
    required this.estimate,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  DateTime get _estimateFrom => DateTime.now();
  DateTime get _estimateComing => _estimateFrom.add(Duration(days: estimate));

  String get estimateFormat =>
      "(Diterima ${_estimateFrom.toFormattedMonth()} - ${_estimateComing.toFormattedMonth()})";

  factory ExpeditionModel.fromJson(Map<String, dynamic> json) =>
      ExpeditionModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        estimate: json["estimate"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "estimate": estimate,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
