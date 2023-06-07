import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/view/pages/history_transaction_page.dart';
import 'package:flutter/material.dart';

class CancelTransactionPage extends StatelessWidget {
  const CancelTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            47.0.height,
            const Text(
              "Batalkan Pesanan",
              style: TextStyle(fontWeight: AppFontWeight.medium, fontSize: 16),
            ),
            12.0.height,
            Card(
                color: AppColors.grey50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: AppColors.black,
                    textAlign: TextAlign.center,
                    maxLines: 8, //or null
                    decoration: const InputDecoration.collapsed(
                        hintText: "Tuliskan Alasan Kamu disini"),
                  ),
                )),
            26.0.height,
            ElevatedButton(
              onPressed: () {
                showConfirmation(
                    title: 'Seriuss, kamu ingin membatalkan pesanan?',
                    message:
                        'Kami akan membatalkan pesanan kamu dengan permanen.',
                    nameButtonConfirmation: 'Batalkan',
                    colorButtonConfirmation: AppColors.error500,
                    pressNavConfirmation: () {
                      context.pushReplacement(const HistoryTransactionPage());
                    },
                    context: context,
                    nameButtonUnConfirmation: 'Tidak');
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.error500),
              child: const Text(
                "Batalkan Pesanan",
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
