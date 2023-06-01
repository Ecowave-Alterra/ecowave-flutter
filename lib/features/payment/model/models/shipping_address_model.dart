import 'dart:convert';

ShippingAddressModel addressModelFromJson(String str) =>
    ShippingAddressModel.fromJson(json.decode(str));

String addressModelToJson(ShippingAddressModel data) =>
    json.encode(data.toJson());

class ShippingAddressModel {
  final int id;
  final int userId;
  final String recipient;
  final String phone;
  final String address;
  final String? note;
  final String mark;
  final bool isPrimary;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ShippingAddressModel({
    required this.id,
    required this.userId,
    required this.recipient,
    required this.phone,
    required this.address,
    this.note,
    required this.mark,
    required this.isPrimary,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      ShippingAddressModel(
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
