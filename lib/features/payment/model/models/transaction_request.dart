class TransactionRequest {
  final int voucherId;
  final int addressId;
  final int totalShippingPrice;
  final int point;
  final String expeditionName;
  final String estimationDay;
  final int discount;
  final List<TransactionDetail> transactionDetails;

  TransactionRequest({
    required this.voucherId,
    required this.addressId,
    required this.totalShippingPrice,
    required this.point,
    required this.expeditionName,
    required this.estimationDay,
    required this.discount,
    required this.transactionDetails,
  });

  Map<String, dynamic> toJson() => {
        "VoucherId": voucherId,
        "AddressId": addressId,
        "TotalShippingPrice": totalShippingPrice,
        "Point": point,
        "ExpeditionName": expeditionName,
        "EstimationDay": estimationDay,
        "Discount": discount,
        "TransactionDetails":
            List<dynamic>.from(transactionDetails.map((x) => x.toJson())),
      };
}

class TransactionDetail {
  final String productId;
  final String productName;
  final int qty;
  final int subTotalPrice;

  TransactionDetail({
    required this.productId,
    required this.productName,
    required this.qty,
    required this.subTotalPrice,
  });

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "Qty": qty,
        "SubTotalPrice": subTotalPrice,
      };
}
