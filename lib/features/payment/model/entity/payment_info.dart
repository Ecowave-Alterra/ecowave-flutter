import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';

class PaymentInfo {
  final int productPrice;
  final int shippingPrice;
  final int pointUsed;
  final VoucherEntity? voucher;

  PaymentInfo({
    required this.productPrice,
    required this.shippingPrice,
    required this.pointUsed,
    this.voucher,
  });

  int get totalPayment {
    final int discount = voucher?.discount.toInt() ?? 0;
    return productPrice + shippingPrice + pointUsed + discount;
  }
}
