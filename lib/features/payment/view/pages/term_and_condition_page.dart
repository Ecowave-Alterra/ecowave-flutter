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
    final List<String> termAndConditionFreeShipping = [
      "Voucher hanya berlaku apabila pembelian pengguna sudah memenuhi syarat dan ketentuan yang tertera pada voucher.",
      "Nominal yang didapatkan sebesar biaya ongkir.",
      "Jika transaksi dibatalkan atau masuk ke pusat resolusi, dana yang kembali ke pembeli akan sesuai dengan nominal pembayaran yang dilakukan.",
      "Ecowave berhak melakukan tindakan yang diperlukan apabila diduga terjadi tindakan kecurangan yang dilakukan oleh pengguna yang melanggra syarat dan ketentuan dan merugikan Ecowave.",
      "Dengan menggunakan voucher ini, pengguna dianggap telah memahami dan meyetujui semua Syarat dan Ketentuan yang berlaku.",
      "Voucher ini tidak dapat digunakan bersamaan dengan voucher lain kecuali diatur lain sebagaimana kebijakan Ecowave.",
    ];
    final List<String> termAndConditionDiscount = [
      "Voucher hanya berlaku apabila pembelian pengguna sudah memenuhi syarat dan ketentuan yang tertera pada voucher.",
      "Nominal yang didapatkan sebesar maksimal ${voucherModel.maximumDiscount?.currencyFormatRp}.",
      "Jika transaksi dibatalkan atau masuk ke pusat resolusi, dana yang kembali ke pembeli akan sesuai dengan nominal pembayaran yang dilakukan.",
      "Ecowave berhak melakukan tindakan yang diperlukan apabila diduga terjadi tindakan kecurangan yang dilakukan oleh pengguna yang melanggra syarat dan ketentuan dan merugikan Ecowave.",
      "Dengan menggunakan voucher ini, pengguna dianggap telah memahami dan meyetujui semua Syarat dan Ketentuan yang berlaku.",
      "Voucher ini tidak dapat digunakan bersamaan dengan voucher lain kecuali diatur lain sebagaimana kebijakan Ecowave.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Syarat dan Ketentuan"),
        shape: const Border(bottom: BorderSide.none),
      ),
      body: ListView(
        children: [
          Image.asset(
            AppImages.voucher,
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
                    const ImageIcon(
                      AppIcons.payment,
                      size: 14.0,
                      color: AppColors.grey500,
                    ),
                    6.0.width,
                    const Text("Min. belanja"),
                    const Spacer(),
                    Text(
                      (voucherModel.minimumPurchase ?? 0).currencyFormatRp,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                  ],
                ),
                if (voucherModel.type == "Diskon Belanja") 8.0.height,
                if (voucherModel.type == "Diskon Belanja")
                  Row(
                    children: [
                      const ImageIcon(
                        AppIcons.payment,
                        size: 14.0,
                        color: AppColors.grey500,
                      ),
                      6.0.width,
                      const Text("Maks. potongan belanja"),
                      const Spacer(),
                      Text(
                        (voucherModel.maximumDiscount ?? 0).currencyFormatRp,
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: voucherModel.type == "Gratis Ongkir"
                      ? termAndConditionFreeShipping.length
                      : termAndConditionDiscount.length,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}. "),
                      Flexible(
                        child: Text(voucherModel.type == "Gratis Ongkir"
                            ? termAndConditionFreeShipping[index]
                            : termAndConditionDiscount[index]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
