import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  final int userAddress;
  final String recipient;
  final String phoneNumber;
  final String address;
  final String note;
  final String mark;
  final bool isPrimary;
  final int userId;

  AddressModel({
    required this.userAddress,
    required this.recipient,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.mark,
    required this.isPrimary,
    required this.userId,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        userAddress: json["UserAddress"],
        recipient: json["Recipient"],
        phoneNumber: json["PhoneNumber"],
        address: json["Address"],
        note: json["Note"],
        mark: json["Mark"],
        isPrimary: json["IsPrimary"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "UserAddress": userAddress,
        "Recipient": recipient,
        "PhoneNumber": phoneNumber,
        "Address": address,
        "Note": note,
        "Mark": mark,
        "IsPrimary": isPrimary,
        "UserId": userId,
      };
}
