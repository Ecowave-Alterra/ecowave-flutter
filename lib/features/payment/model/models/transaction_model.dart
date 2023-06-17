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
  final String transactionId;

  TransactionModel({
    required this.message,
    required this.paymentUrl,
    required this.status,
    required this.transactionId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        message: json["Message"],
        paymentUrl: json["Payment_url"],
        status: json["Status"],
        transactionId: json["Transaction_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Payment_url": paymentUrl,
        "Status": status,
        "Transaction_Id": transactionId,
      };
}
