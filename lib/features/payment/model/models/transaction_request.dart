import 'dart:convert';

class TransactionRequest {
  final int? voucherId;
  final int addressId;
  final int totalShippingPrice;
  final int? point;
  final String expeditionName;
  final int discount;
  final List<TransactionDetail> transactionDetails;

  TransactionRequest({
    this.voucherId,
    required this.addressId,
    required this.totalShippingPrice,
    this.point,
    required this.expeditionName,
    required this.discount,
    required this.transactionDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'voucherId': voucherId,
      'addressId': addressId,
      'totalShippingPrice': totalShippingPrice,
      'point': point,
      'expeditionName': expeditionName,
      'discount': discount,
      'transactionDetails': transactionDetails.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class TransactionDetail {
  final int productId;
  final String productName;
  final int qty;
  final int subTotalPrice;

  TransactionDetail({
    required this.productId,
    required this.productName,
    required this.qty,
    required this.subTotalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'qty': qty,
      'subTotalPrice': subTotalPrice,
    };
  }

  String toJson() => json.encode(toMap());
}
