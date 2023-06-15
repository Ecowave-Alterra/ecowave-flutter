// To parse this JSON data, do
//
//     final expeditionResponseModel = expeditionResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/features/payment/model/models/expedition_model.dart';

List<ExpeditionResponseModel> expeditionResponseModelFromJson(String str) =>
    List<ExpeditionResponseModel>.from(
        json.decode(str).map((x) => ExpeditionResponseModel.fromJson(x)));

String expeditionResponseModelToJson(List<ExpeditionResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpeditionResponseModel {
  final Rajaongkir rajaongkir;

  ExpeditionResponseModel({
    required this.rajaongkir,
  });

  ExpeditionModel toModelEntity() {
    return ExpeditionModel(
      code: rajaongkir.results[0].code,
      name: rajaongkir.results[0].name,
      description: rajaongkir.results[0].costs
          .where((element) => element.service.toLowerCase().contains("reg"))
          .first
          .description,
      price: rajaongkir.results[0].costs
          .where((element) => element.service.toLowerCase().contains("reg"))
          .first
          .cost[0]
          .value,
      estimate: int.parse(rajaongkir.results[0].costs
          .where((element) => element.service.toLowerCase().contains("reg"))
          .first
          .cost[0]
          .etd[0]),
    );
  }

  factory ExpeditionResponseModel.fromJson(Map<String, dynamic> json) =>
      ExpeditionResponseModel(
        rajaongkir: Rajaongkir.fromJson(json["rajaongkir"]),
      );

  Map<String, dynamic> toJson() => {
        "rajaongkir": rajaongkir.toJson(),
      };
}

class Rajaongkir {
  final List<Result> results;

  Rajaongkir({
    required this.results,
  });

  factory Rajaongkir.fromJson(Map<String, dynamic> json) => Rajaongkir(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final String code;
  final String name;
  final List<ResultCost> costs;

  Result({
    required this.code,
    required this.name,
    required this.costs,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["Code"],
        name: json["name"],
        costs: List<ResultCost>.from(
            json["costs"].map((x) => ResultCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "name": name,
        "costs": List<dynamic>.from(costs.map((x) => x.toJson())),
      };
}

class ResultCost {
  final String service;
  final String description;
  final List<CostCost> cost;

  ResultCost({
    required this.service,
    required this.description,
    required this.cost,
  });

  factory ResultCost.fromJson(Map<String, dynamic> json) => ResultCost(
        service: json["service"],
        description: json["description"],
        cost:
            List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": List<dynamic>.from(cost.map((x) => x.toJson())),
      };
}

class CostCost {
  final int value;
  final String etd;

  CostCost({
    required this.value,
    required this.etd,
  });

  factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
      };
}
