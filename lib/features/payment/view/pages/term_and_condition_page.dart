import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:flutter/material.dart';

class TermAndConditionPage extends StatelessWidget {
  final VoucherEntity voucherEntity;

  const TermAndConditionPage({
    super.key,
    required this.voucherEntity,
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
            voucherEntity.imageUrl,
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
                  voucherEntity.name,
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
                      voucherEntity.expiredDateFormatString,
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
                      0.currencyFormatRp,
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
                const Text(
                    "1. Dapatkan diskon gratis ongkir.\n2. Voucher hanya berlaku apabila pembelian pengguna sudah memenuhi syarat dan ketentuan yang tertera pada voucher.\n3. nominal yang didapatkan sebesar biaya ongkir.\n4. Jika transaksi dibatalkan atau masuk ke pusat resolusi, dana yang kembali ke pembeli akan sesuai dengan nominal pembayaran yang dilakukan.\n5. Ecowave berhak melakukan tindakan yang diperlukan apabila diduga terjadi tindakan kecurangan yang dilakukan oleh pengguna yang melanggra syarat dan ketentuan dan merugikan Ecowave.\n6. Dengan menggunakan voucher ini, pengguna dianggap telah memahami dan meyetujui semua Syarat dan Ketentuan yang berlaku.\n7. Voucher ini tidak dapat digunakan bersamaan dengan voucher lain kecuali diatur lain sebagaimana kebijakan Ecowave."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
