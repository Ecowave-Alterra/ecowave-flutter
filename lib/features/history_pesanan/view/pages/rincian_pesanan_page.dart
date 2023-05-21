import 'package:ecowave/core.dart';
import 'package:ecowave/features/history_pesanan/view/pages/batalkan_pesanan_page.dart';
import 'package:ecowave/features/history_pesanan/view/pages/lacak_pesanan_page.dart';
import 'package:flutter/material.dart';

class RincianPesananPage extends StatelessWidget {
  const RincianPesananPage({super.key});

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
                height: 24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bayar dalam"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "23 Jam 59 Menit 59 Detik",
                        style: TextStyle(
                            color: AppColors.error600,
                            fontWeight: AppFontWeight.semibold),
                      ),
                      Row(
                        children: [
                          Text("Jatuh tempo "),
                          Text("24 April 2023, 13:08"),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              const Row(
                children: [
                  ImageIcon(
                    AppIcons.pengiriman,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Informasi Pengiriman",
                    style: TextStyle(
                        fontWeight: AppFontWeight.medium, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Reguler"),
                  InkWell(
                    onTap: () {
                      context.push(const LacakPesananPage());
                    },
                    child: const Text(
                      "Lacak Pesanan",
                      style: TextStyle(color: AppColors.primary500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                children: [
                  Text("JNE Express"),
                  Text(" : "),
                  Text("251372563213")
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  ImageIcon(
                    AppIcons.alamat,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Alamat Pengiriman"),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Text("Shinta Rachma Shintia"),
              const SizedBox(
                height: 6,
              ),
              const Text("(+62) 81123456789"),
              const SizedBox(
                height: 6,
              ),
              const Text("Jl Asia Afrika  No 123 Kota Bandung 40526"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: const Row(
                  children: [
                    ImageIcon(AppIcons.shopPesanan),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Eco Shop"),
                  ],
                ),
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
                  Text("Ongkos Kirim"),
                  Text(
                    "Rp.5.000",
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Promo yang Digunakan"),
                  Text(
                    "-",
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1 Produk"),
                  Row(
                    children: [
                      Text("Total Pesanan : "),
                      Text(
                        "Rp.20.000",
                        style: TextStyle(fontWeight: AppFontWeight.semibold),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Text("Metode Pembayaran"),
              const Text("Ovo"),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    context.push(const BatalkanPesananPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error500),
                  child: const Text(
                    "Batalkan Pesanan",
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
