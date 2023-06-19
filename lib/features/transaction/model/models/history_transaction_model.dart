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
  final String receiptNumber;
  final int totalProductPrice;
  final int totalShippingPrice;
  final int point;
  final String paymentMethod;
  final String paymentStatus;
  final String expeditionName;
  final String expeditionStatus;
  final int voucherId;
  final int discount;
  final int totalPrice;
  final String estimationDay;
  final String paymentUrl;
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
    required this.expeditionStatus,
    required this.voucherId,
    required this.discount,
    required this.totalPrice,
    required this.estimationDay,
    required this.paymentUrl,
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
        expeditionStatus: json["ExpeditionStatus"],
        voucherId: json["VoucherId"],
        discount: json["Discount"],
        totalPrice: json["TotalPrice"],
        estimationDay: json["EstimationDay"],
        paymentUrl: json["PaymentUrl"],
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
        "ExpeditionStatus": expeditionStatus,
        "VoucherId": voucherId,
        "Discount": discount,
        "TotalPrice": totalPrice,
        "EstimationDay": estimationDay,
        "PaymentUrl": paymentUrl,
        "CanceledReason": canceledReason,
        "OrderDetail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "Address": address.toJson(),
      };
}

class Address {
  final String recipient;
  final String phoneNumber;
  final String address;
  final String provinceId;
  final String provinceName;
  final String cityId;
  final String cityName;
  final String note;
  final String mark;
  final bool isPrimary;
  final int userId;

  Address({
    required this.recipient,
    required this.phoneNumber,
    required this.address,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.note,
    required this.mark,
    required this.isPrimary,
    required this.userId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        recipient: json["Recipient"],
        phoneNumber: json["PhoneNumber"],
        address: json["Address"],
        provinceId: json["ProvinceId"],
        provinceName: json["ProvinceName"],
        cityId: json["CityId"],
        cityName: json["CityName"],
        note: json["Note"],
        mark: json["Mark"],
        isPrimary: json["IsPrimary"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "Recipient": recipient,
        "PhoneNumber": phoneNumber,
        "Address": address,
        "ProvinceId": provinceId,
        "ProvinceName": provinceName,
        "CityId": cityId,
        "CityName": cityName,
        "Note": note,
        "Mark": mark,
        "IsPrimary": isPrimary,
        "UserId": userId,
      };
}

class OrderDetail {
  final int productId;
  final int qty;
  final int subTotalPrice;
  final String productName;
  final String productImageUrl;

  OrderDetail({
    required this.productId,
    required this.qty,
    required this.subTotalPrice,
    required this.productName,
    required this.productImageUrl,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productId: json["ProductId"],
        qty: json["Qty"],
        subTotalPrice: json["SubTotalPrice"],
        productName: json["ProductName"],
        productImageUrl: json["ProductImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "Qty": qty,
        "SubTotalPrice": subTotalPrice,
        "ProductName": productName,
        "ProductImageUrl": productImageUrl,
      };
}
