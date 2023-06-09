// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  final int id;
  final String recipient;
  final String phoneNumber;
  final int provinceId;
  final String provinceName;
  final int cityId;
  final String cityName;
  final String address;
  final String? note;
  final String? mark;
  final bool isPrimary;

  AddressModel({
    required this.id,
    required this.recipient,
    required this.phoneNumber,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.address,
    this.note,
    this.mark,
    required this.isPrimary,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["Id"],
        recipient: json["Recipient"],
        phoneNumber: json["Phone"],
        provinceId: int.parse(json["ProvinceId"]),
        provinceName: json["ProvinceName"],
        cityId: int.parse(json["CityId"]),
        cityName: json["CityName"],
        address: json["Address"],
        note: json["Note"],
        mark: json["Mark"],
        isPrimary: json["IsPrimary"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Recipient": recipient,
        "Phone": phoneNumber,
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "CityId": cityId,
        "CityName": cityName,
        "Address": address,
        "Note": note,
        "Mark": mark,
        "IsPrimary": isPrimary,
      };
}
