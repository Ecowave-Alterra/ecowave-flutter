import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class PaymentWaitingPage extends StatelessWidget {
  const PaymentWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.loadingPembayaran,
              width: 220.0,
            ),
            32.0.height,
            const Text(
              "Menunggu Pembayaran",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: AppFontWeight.semibold,
              ),
            ),
            16.0.height,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Mohon bayar sebesar ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: 89000.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: AppFontWeight.semibold,
                      fontSize: 12,
                    ),
                  ),
                  const TextSpan(
                    text: " sebelum ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const TextSpan(
                    text: "dd/mm/yy.",
                    style: TextStyle(
                      fontWeight: AppFontWeight.semibold,
                      fontSize: 12,
                    ),
                  ),
                  const TextSpan(
                    text: " \nLihat Pesanan Saya untuk informasi lebih lanjut.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            32.0.height,
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: EcoFormButton(
                    label: "Beranda",
                    onPressed: () => context.popToRoot(),
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primary500,
                    border: Border.all(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
                16.0.width,
                Flexible(
                  flex: 1,
                  child: EcoFormButton(
                    label: "Pesanan Saya",
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primary500,
                    border: Border.all(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
