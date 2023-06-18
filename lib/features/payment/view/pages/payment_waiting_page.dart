import 'package:ecowave/core.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentWaitingPage extends StatelessWidget {
  final int totalPayment;
  const PaymentWaitingPage({super.key, required this.totalPayment});

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
                    text: totalPayment.currencyFormatRp,
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
                  TextSpan(
                    text: DateTime.now()
                        .add(const Duration(days: 1))
                        .toFormattedDate(),
                    style: const TextStyle(
                      fontWeight: AppFontWeight.semibold,
                      fontSize: 12,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ". \nLihat Pesanan Saya untuk informasi lebih lanjut.",
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
                    onPressed: () {
                      context.popToRoot();
                      context.read<HomeBloc>().add(const OnBottomNavTap(1));
                    },
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
