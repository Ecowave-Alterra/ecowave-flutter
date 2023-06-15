// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  final String message;
  final String paymentUrl;
  final int status;

  TransactionModel({
    required this.message,
    required this.paymentUrl,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        message: json["Message"],
        paymentUrl: json["Payment_url"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Payment_url": paymentUrl,
        "Status": status,
      };
}
