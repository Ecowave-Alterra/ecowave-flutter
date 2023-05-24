import 'package:ecowave/features/payment/model/entity/voucher.dart';

class PaymentInfo {
  final int productPrice;
  final int shippingPrice;
  final int pointUsed;
  final Voucher? voucher;

  PaymentInfo({
    required this.productPrice,
    required this.shippingPrice,
    required this.pointUsed,
    this.voucher,
  });

  int get totalPayment {
    final int discount = voucher?.discount ?? 0;
    return productPrice + shippingPrice + pointUsed + discount;
  }
}
