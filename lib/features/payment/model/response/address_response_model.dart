// To parse this JSON data, do
//
//     final addressResponseModel = addressResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecowave/features/payment/model/entity/address_entity.dart';

AddressResponseModel addressResponseModelFromJson(String str) =>
    AddressResponseModel.fromJson(json.decode(str));

String addressResponseModelToJson(AddressResponseModel data) =>
    json.encode(data.toJson());

class AddressResponseModel {
  int? id;
  int? userId;
  String? recipient;
  String? phone;
  String? address;
  String? note;
  String? mark;
  bool? isPrimary;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AddressResponseModel({
    this.id,
    this.userId,
    this.recipient,
    this.phone,
    this.address,
    this.note,
    this.mark,
    this.isPrimary,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  AddressEntity toEntity() {
    return AddressEntity(
      name: recipient ?? '',
      phoneNumber: phone ?? '',
      address: address ?? '',
      markedAs: mark ?? '',
      note: note,
      isPrimary: isPrimary ?? false,
    );
  }

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      AddressResponseModel(
        id: json["id"],
        userId: json["user_id"],
        recipient: json["recipient"],
        phone: json["phone"],
        address: json["address"],
        note: json["note"],
        mark: json["mark"],
        isPrimary: json["is_primary"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "recipient": recipient,
        "phone": phone,
        "address": address,
        "note": note,
        "mark": mark,
        "is_primary": isPrimary,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
