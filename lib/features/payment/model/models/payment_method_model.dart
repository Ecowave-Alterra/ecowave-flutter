import 'dart:convert';

PaymentMethodModel paymentMethodModelFromJson(String str) =>
    PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodModelToJson(PaymentMethodModel data) =>
    json.encode(data.toJson());

class PaymentMethodModel {
  final int id;
  final String name;
  final String type;
  final String iconUrl;
  final List<String> instructions;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.type,
    required this.iconUrl,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        iconUrl: json["iconUrl"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "iconUrl": iconUrl,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
