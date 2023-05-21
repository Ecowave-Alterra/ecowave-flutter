import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class AlasanDibatalkanBayarPage extends StatelessWidget {
  const AlasanDibatalkanBayarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              const Text(
                "Pembatalan Berhasil",
                style:
                    TextStyle(fontWeight: AppFontWeight.medium, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pada"),
                  Text(
                    "24 Apr 2023 12.48",
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    height: 70,
                    width: 90,
                    child: Image.asset(
                      "assets/images/productShop2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Totebag Tas belanja serbaguna"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("x"),
                            Text("1"),
                          ],
                        ),
                        Text("15.000"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diminta Pada"),
                  Text(
                    "24 Apr 2023 12.48",
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diminta Oleh"),
                  Text(
                    "Pembeli",
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Alasan"),
                  const Spacer(),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: const Text(
                          "Melakukan Pemesaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanan Double"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Metode Pembayaran"), Text("Belum dibayar")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
