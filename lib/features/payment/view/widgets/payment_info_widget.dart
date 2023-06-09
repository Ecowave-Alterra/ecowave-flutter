import 'package:ecowave/features/payment/model/models/payment_info.dart';
import 'package:flutter/material.dart';

import 'package:ecowave/core.dart';

class PaymentInfoWidget extends StatelessWidget {
  final PaymentInfo paymentInfo;

  const PaymentInfoWidget({
    super.key,
    required this.paymentInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rincian Pembayaran",
            style: TextStyle(
              fontWeight: AppFontWeight.semibold,
            ),
          ),
          6.0.height,
          _PriceInfo(
            label: "Biaya Produk",
            price: paymentInfo.productPrice,
          ),
          _PriceInfo(
            label: "Biaya Pengiriman",
            price: paymentInfo.shippingPrice,
          ),
          _PriceInfo(
            label: "Point",
            price: paymentInfo.pointUsed,
          ),
          _PriceInfo(
            label: "Diskon",
            price: paymentInfo.discount,
          ),
          const Divider(),
          _PriceInfo(
            label: "Total Pembayaran",
            price: paymentInfo.totalPayment,
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class _PriceInfo extends StatelessWidget {
  final String label;
  final int price;
  final bool isBold;

  const _PriceInfo({
    required this.label,
    required this.price,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight:
                  isBold ? AppFontWeight.semibold : AppFontWeight.regular,
            ),
          ),
          Text(
            price.currencyFormatRp,
            style: TextStyle(
              fontWeight:
                  isBold ? AppFontWeight.semibold : AppFontWeight.regular,
            ),
          ),
        ],
      ),
    );
  }
}
