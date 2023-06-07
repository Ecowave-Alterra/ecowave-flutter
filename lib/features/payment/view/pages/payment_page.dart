import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/payment_method_model.dart';
import 'package:ecowave/features/payment/model/models/payment_method_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime targetTime = DateTime(2023, 5, 25, 23, 59, 0);
    final int endTime = targetTime.millisecondsSinceEpoch;

    final PaymentMethodModel paymentMethod = PaymentMethodModel(
      name: "OVO",
      iconUrl: "https://i.ibb.co/S32HNjD/no-image.jpg",
      type: PaymentMethodType.eWallet,
      instructions: [
        "Lakukan login pada aplikasi  OVO",
        "Pilih Transfer > masukan no Rekening pembayaran (contoh : 08734343829)",
        "Masukan nominal pembayaran",
        "Masukan pin OVO",
        "Pembayaran Selesai, Simpan notifikasi yang muncul sebagai bukti pembayaran",
      ],
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.primary, vertical: 20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Bayar Dalam"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return const Text(
                          'Waktu telah habis',
                          style: TextStyle(
                            color: AppColors.error600,
                            fontWeight: AppFontWeight.semibold,
                          ),
                        );
                      }

                      final hours = time.hours ?? 0;
                      final minutes = time.min ?? 0;
                      final seconds = time.sec ?? 0;

                      final formattedTime =
                          '$hours jam $minutes menit $seconds detik';

                      return Text(
                        formattedTime,
                        style: const TextStyle(
                          color: AppColors.error600,
                          fontWeight: AppFontWeight.semibold,
                        ),
                      );
                    },
                  ),
                  const Text("Jatuh tempo 19 Mei 2023, 23:59"),
                ],
              ),
            ],
          ),
          12.0.height,
          const Divider(),
          16.0.height,
          Row(
            children: [
              Image.network(
                paymentMethod.iconUrl,
                width: 24.0,
              ),
              6.0.width,
              Text(
                paymentMethod.name,
                style: const TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
            ],
          ),
          16.0.height,
          const Text(
            "No. Rekening",
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: AppFontWeight.medium,
            ),
          ),
          12.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "08734343829",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: AppFontWeight.semibold,
                  color: AppColors.primary500,
                ),
              ),
              InkWell(
                onTap: () {
                  const String phoneNumber = "08734343829";
                  Clipboard.setData(const ClipboardData(text: phoneNumber));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No. Rekening disalin'),
                      duration: Duration(milliseconds: 700),
                    ),
                  );
                },
                child: const Text(
                  "Salin",
                  style: TextStyle(
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ],
          ),
          12.0.height,
          const Divider(),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Pembayaran"),
              InkWell(
                onTap: () {},
                child: Text(
                  89000.currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
              ),
            ],
          ),
          12.0.height,
          const Divider(),
          16.0.height,
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: AppColors.grey300,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Petunjuk Transfer ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
                12.0.height,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: paymentMethod.instructions.length,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index + 1}. "),
                      Flexible(
                        child: Text(paymentMethod.instructions[index]),
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
