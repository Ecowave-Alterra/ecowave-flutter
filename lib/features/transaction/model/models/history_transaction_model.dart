// To parse this JSON data, do
//
//     final historyTransactionModel = historyTransactionModelFromJson(jsonString);

import 'dart:convert';

List<HistoryTransactionModel> historyTransactionModelFromJson(String str) =>
    List<HistoryTransactionModel>.from(
        json.decode(str).map((x) => HistoryTransactionModel.fromJson(x)));

String historyTransactionModelToJson(List<HistoryTransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryTransactionModel {
  final String transactionId;
  final String createdAt;
  final String updatedAt;
  final int addressId;
  final String statusTransaction;
  final String? receiptNumber;
  final int totalProductPrice;
  final int totalShippingPrice;
  final int point;
  final String paymentMethod;
  final String paymentStatus;
  final String expeditionName;
  final int voucherId;
  final int discount;
  final int totalPrice;
  final String estimationDay;
  final String paymentUrl;
  final double expeditionRating;
  final String canceledReason;
  final List<OrderDetail> orderDetail;
  final Address address;

  HistoryTransactionModel({
    required this.transactionId,
    required this.createdAt,
    required this.updatedAt,
    required this.addressId,
    required this.statusTransaction,
    required this.receiptNumber,
    required this.totalProductPrice,
    required this.totalShippingPrice,
    required this.point,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.expeditionName,
    required this.voucherId,
    required this.discount,
    required this.totalPrice,
    required this.estimationDay,
    required this.paymentUrl,
    required this.expeditionRating,
    required this.canceledReason,
    required this.orderDetail,
    required this.address,
  });

  factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionModel(
        transactionId: json["TransactionId"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        addressId: json["AddressId"],
        statusTransaction: json["StatusTransaction"],
        receiptNumber: json["ReceiptNumber"],
        totalProductPrice: json["TotalProductPrice"],
        totalShippingPrice: json["TotalShippingPrice"],
        point: json["Point"],
        paymentMethod: json["PaymentMethod"],
        paymentStatus: json["PaymentStatus"],
        expeditionName: json["ExpeditionName"],
        voucherId: json["VoucherId"],
        discount: json["Discount"],
        totalPrice: json["TotalPrice"],
        estimationDay: json["EstimationDay"],
        paymentUrl: json["PaymentUrl"],
        expeditionRating: double.parse(json["ExpeditionRating"].toString()),
        canceledReason: json["CanceledReason"],
        orderDetail: List<OrderDetail>.from(
            json["OrderDetail"].map((x) => OrderDetail.fromJson(x))),
        address: Address.fromJson(json["Address"]),
      );

  Map<String, dynamic> toJson() => {
        "TransactionId": transactionId,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "AddressId": addressId,
        "StatusTransaction": statusTransaction,
        "ReceiptNumber": receiptNumber,
        "TotalProductPrice": totalProductPrice,
        "TotalShippingPrice": totalShippingPrice,
        "Point": point,
        "PaymentMethod": paymentMethod,
        "PaymentStatus": paymentStatus,
        "ExpeditionName": expeditionName,
        "VoucherId": voucherId,
        "Discount": discount,
        "TotalPrice": totalPrice,
        "EstimationDay": estimationDay,
        "PaymentUrl": paymentUrl,
        "ExpeditionRating": expeditionRating,
        "CanceledReason": canceledReason,
        "OrderDetail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "Address": address.toJson(),
      };
}

class Address {
  final int userId;
  final String recipient;
  final String phone;
  final String provinceId;
  final String provinceName;
  final String cityId;
  final String cityName;
  final String address;
  final String note;
  final String mark;
  final bool isPrimary;
  final dynamic transactions;

  Address({
    required this.userId,
    required this.recipient,
    required this.phone,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.address,
    required this.note,
    required this.mark,
    required this.isPrimary,
    this.transactions,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        userId: json["UserId"],
        recipient: json["Recipient"],
        phone: json["Phone"],
        provinceId: json["ProvinceId"],
        provinceName: json["ProvinceName"],
        cityId: json["CityId"],
        cityName: json["CityName"],
        address: json["Address"],
        note: json["Note"],
        mark: json["Mark"],
        isPrimary: json["IsPrimary"],
        transactions: json["Transactions"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "Recipient": recipient,
        "Phone": phone,
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "CityId": cityId,
        "CityName": cityName,
        "Address": address,
        "Note": note,
        "Mark": mark,
        "IsPrimary": isPrimary,
        "Transactions": transactions,
      };
}

class OrderDetail {
  final String productId;
  final int qty;
  final int subTotalPrice;
  final String productName;
  final String productImageUrl;
  final int ratingProductId;

  OrderDetail({
    required this.productId,
    required this.qty,
    required this.subTotalPrice,
    required this.productName,
    required this.productImageUrl,
    required this.ratingProductId,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productId: json["ProductId"],
        qty: json["Qty"],
        subTotalPrice: json["SubTotalPrice"],
        productName: json["ProductName"],
        productImageUrl: json["ProductImageUrl"],
        ratingProductId: json["RatingProductId"],
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "Qty": qty,
        "SubTotalPrice": subTotalPrice,
        "ProductName": productName,
        "ProductImageUrl": productImageUrl,
        "RatingProductId": ratingProductId,
      };
}
