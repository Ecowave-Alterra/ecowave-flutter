import 'package:ecowave/core.dart';
import 'package:ecowave/features/history_pesanan/view/pages/alasan_dibatalkan_page.dart';
import 'package:flutter/material.dart';

class BatalkanPesananPage extends StatelessWidget {
  const BatalkanPesananPage({super.key});

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
            const SizedBox(
              height: 47,
            ),
            const Text(
              "Batalkan Pesanan",
              style: TextStyle(fontWeight: AppFontWeight.medium, fontSize: 16),
            ),
            const SizedBox(
              height: 12,
            ),
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
            const SizedBox(
              height: 26,
            ),
            ElevatedButton(
              onPressed: () {
                showConfirmation(
                    title: 'Seriuss, kamu ingin membatalkan pesanan?',
                    message:
                        'Kami akan membatalkan pesanan kamu dengan permanen.',
                    nameButtonConfirmation: 'Batalkan',
                    colorButtonConfirmation: AppColors.error500,
                    pressNavConfirmation: () {
                      context
                          .pushReplacement(const AlasanDibatalkanBayarPage());
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
