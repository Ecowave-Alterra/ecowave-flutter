import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  final int id;
  final String recipient;
  final String phoneNumber;
  final String address;
  final String? note;
  final String? mark;
  final bool isPrimary;
  final int userId;

  AddressModel({
    required this.id,
    required this.recipient,
    required this.phoneNumber,
    required this.address,
    this.note,
    this.mark,
    required this.isPrimary,
    required this.userId,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["Id"],
        recipient: json["Recipient"],
        phoneNumber: json["PhoneNumber"],
        address: json["Address"],
        note: json["Note"],
        mark: json["Mark"],
        isPrimary: json["IsPrimary"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Recipient": recipient,
        "PhoneNumber": phoneNumber,
        "Address": address,
        "Note": note,
        "Mark": mark,
        "IsPrimary": isPrimary,
        "UserId": userId,
      };
}
