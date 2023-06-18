// To parse this JSON data, do
//
//     final expeditionModel = expeditionModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/core.dart';

List<ExpeditionModel> expeditionModelFromJson(String str) =>
    List<ExpeditionModel>.from(
        json.decode(str).map((x) => ExpeditionModel.fromJson(x)));

String expeditionModelToJson(List<ExpeditionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpeditionModel {
  final String code;
  final String name;
  final String service;
  final String description;
  final int value;
  final String etd;

  ExpeditionModel({
    required this.code,
    required this.name,
    required this.service,
    required this.description,
    required this.value,
    required this.etd,
  });

  DateTime get _estimateFrom => DateTime.now();
  DateTime get _estimateComing =>
      _estimateFrom.add(Duration(days: int.parse(etd[0])));

  String get estimateFormat =>
      "(Diterima ${_estimateFrom.toFormattedMonth()} - ${_estimateComing.toFormattedMonth()})";

  factory ExpeditionModel.fromJson(Map<String, dynamic> json) =>
      ExpeditionModel(
        code: json["Code"],
        name: json["Name"],
        service: json["Service"],
        description: json["Description"],
        value: json["Value"],
        etd: json["Etd"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "Service": service,
        "Description": description,
        "Value": value,
        "Etd": etd,
      };
}
