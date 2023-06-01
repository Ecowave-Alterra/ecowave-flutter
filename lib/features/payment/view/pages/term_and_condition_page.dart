import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:flutter/material.dart';

class TermAndConditionPage extends StatelessWidget {
  final VoucherModel voucherModel;

  const TermAndConditionPage({
    super.key,
    required this.voucherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syarat dan Ketentuan"),
        shape: const Border(bottom: BorderSide.none),
      ),
      body: ListView(
        children: [
          Image.network(
            voucherModel.photoContentUrl,
            width: context.fullWidth,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          8.0.height,
          Padding(
            padding: const EdgeInsets.all(AppSizes.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucherModel.name,
                  style: const TextStyle(
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
                8.0.height,
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 14.0,
                      color: AppColors.grey500,
                    ),
                    6.0.width,
                    const Text("Berlaku hingga"),
                    const Spacer(),
                    Text(
                      voucherModel.expiredDateFormatString,
                      style: const TextStyle(
                        color: AppColors.primary500,
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                  ],
                ),
                8.0.height,
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 14.0,
                      color: AppColors.grey500,
                    ),
                    6.0.width,
                    const Text("Minimum transaksi"),
                    const Spacer(),
                    Text(
                      voucherModel.minimumPurchase.currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                  ],
                ),
                16.0.height,
                const Text(
                  "Syarat dan Ketentuan",
                  style: TextStyle(
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
                8.0.height,
                Text(voucherModel.termCondition),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
