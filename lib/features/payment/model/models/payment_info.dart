import 'package:ecowave/features/payment/model/models/voucher_model.dart';

class PaymentInfo {
  final int productPrice;
  final int shippingPrice;
  final int pointUsed;
  final VoucherModel? voucher;

  PaymentInfo({
    required this.productPrice,
    required this.shippingPrice,
    required this.pointUsed,
    this.voucher,
  });

  int get discount {
    int discountUsed = (voucher?.discountPercent ?? 0).toInt();

    if (voucher?.type == "Diskon Belanja") {
      discountUsed =
          ((voucher?.discountPercent ?? 0) / 100 * productPrice).toInt();
      if (discountUsed > (voucher?.maximumDiscount ?? 0)) {
        discountUsed = voucher?.maximumDiscount ?? 0;
      }
    } else {
      discountUsed = shippingPrice;
    }

    return -discountUsed;
  }

  int get totalPayment => productPrice + shippingPrice + pointUsed + discount;
}
