import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class ReasonCanceledPage extends StatelessWidget {
  const ReasonCanceledPage({super.key});

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
              22.0.height,
              const Text(
                "Pembatalan Berhasil",
                style:
                    TextStyle(fontWeight: AppFontWeight.medium, fontSize: 16),
              ),
              8.0.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pada"),
                  Text(
                    "24 Apr 2023 12.48",
                  ),
                ],
              ),
              28.0.height,
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
              8.0.height,
              const Divider(),
              16.0.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diminta Pada"),
                  Text(
                    "24 Apr 2023 12.48",
                  )
                ],
              ),
              28.0.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diminta Oleh"),
                  Text(
                    "Pembeli",
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Alasan"),
                  Container(
                    width: 140,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: const Text(
                        "Melakukan Pemesanan Double",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              28.0.height,
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
