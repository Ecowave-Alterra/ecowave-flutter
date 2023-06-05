// To parse this JSON data, do
//
//     final historyTransactionModel = historyTransactionModelFromJson(jsonString);

import 'dart:convert';

HistoryTransactionModel historyTransactionModelFromJson(String str) =>
    HistoryTransactionModel.fromJson(json.decode(str));

String historyTransactionModelToJson(HistoryTransactionModel data) =>
    json.encode(data.toJson());

class HistoryTransactionModel {
  String transactionId;
  String recipient;
  String address;
  String phone;
  String note;
  String statusTransaction;
  int totalPrice;
  String createdAt;
  int shipping;
  int voucher;
  String paymentMethod;
  String expedition;
  String resiCode;
  String typeDelivery;
  String descriptionTransaction;
  List<ProductTransaction> productTransaction;
  List<TrackingExpedition> trackingExpedition;
  String estimateReceived;

  HistoryTransactionModel({
    required this.transactionId,
    required this.recipient,
    required this.address,
    required this.phone,
    required this.note,
    required this.statusTransaction,
    required this.totalPrice,
    required this.createdAt,
    required this.shipping,
    required this.voucher,
    required this.paymentMethod,
    required this.expedition,
    required this.resiCode,
    required this.typeDelivery,
    required this.descriptionTransaction,
    required this.productTransaction,
    required this.trackingExpedition,
    required this.estimateReceived,
  });

  factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionModel(
        transactionId: json["transaction_id"],
        recipient: json["recipient"],
        address: json["address"],
        phone: json["phone"],
        note: json["note"],
        statusTransaction: json["status_transaction"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"],
        shipping: json["shipping"],
        voucher: json["voucher"],
        paymentMethod: json["payment_method"],
        expedition: json["expedition"],
        resiCode: json["resi_code"],
        typeDelivery: json["type_delivery"],
        descriptionTransaction: json["description_transaction"],
        productTransaction: List<ProductTransaction>.from(
            json["productTransaction"]
                .map((x) => ProductTransaction.fromJson(x))),
        trackingExpedition: List<TrackingExpedition>.from(
            json["tracking_expedition"]
                .map((x) => TrackingExpedition.fromJson(x))),
        estimateReceived: json["estimate_received"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "recipient": recipient,
        "address": address,
        "phone": phone,
        "note": note,
        "status_transaction": statusTransaction,
        "total_price": totalPrice,
        "created_at": createdAt,
        "shipping": shipping,
        "voucher": voucher,
        "payment_method": paymentMethod,
        "expedition": expedition,
        "resi_code": resiCode,
        "type_delivery": typeDelivery,
        "description_transaction": descriptionTransaction,
        "productTransaction":
            List<dynamic>.from(productTransaction.map((x) => x.toJson())),
        "tracking_expedition":
            List<dynamic>.from(trackingExpedition.map((x) => x.toJson())),
        "estimate_received": estimateReceived,
      };
}

class ProductTransaction {
  int productId;
  String productName;
  int qty;
  int price;
  String productImageUrl;

  ProductTransaction({
    required this.productId,
    required this.productName,
    required this.qty,
    required this.price,
    required this.productImageUrl,
  });

  factory ProductTransaction.fromJson(Map<String, dynamic> json) =>
      ProductTransaction(
        productId: json["product_id"],
        productName: json["product_name"],
        qty: json["qty"],
        price: json["price"],
        productImageUrl: json["product_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "qty": qty,
        "price": price,
        "product_image_url": productImageUrl,
      };
}

class TrackingExpedition {
  int trackingExpeditionId;
  String deliveryDate;
  String description;

  TrackingExpedition({
    required this.trackingExpeditionId,
    required this.deliveryDate,
    required this.description,
  });

  factory TrackingExpedition.fromJson(Map<String, dynamic> json) =>
      TrackingExpedition(
        trackingExpeditionId: json["tracking_expedition_id"],
        deliveryDate: json["delivery_date"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "tracking_expedition_id": trackingExpeditionId,
        "delivery_date": deliveryDate,
        "description": description,
      };
}
