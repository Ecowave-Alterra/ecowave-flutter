// To parse this JSON data, do
//
//     final provinceModel = provinceModelFromJson(jsonString);

import 'dart:convert';

List<ProvinceModel> provinceModelFromJson(String str) =>
    List<ProvinceModel>.from(
        json.decode(str).map((x) => ProvinceModel.fromJson(x)));

String provinceModelToJson(List<ProvinceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinceModel {
  final String provinceId;
  final String province;

  ProvinceModel({
    required this.provinceId,
    required this.province,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "province": province,
      };
}
