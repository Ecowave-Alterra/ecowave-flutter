import 'package:ecowave/core.dart';
import 'package:ecowave/features/order/model/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class UnpaidOrderDetailPage extends StatelessWidget {
  final Checkout orderUnpaid;

  const UnpaidOrderDetailPage({super.key, required this.orderUnpaid});

  @override
  Widget build(BuildContext context) {
    final DateTime targetTime = DateTime(2023, 5, 27, 23, 59, 0);
    final int endTime = targetTime.millisecondsSinceEpoch;
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
              24.0.height,
              Container(
                decoration: const BoxDecoration(),
                child: Column(
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
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
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
              14.0.height,
              Text(orderUnpaid.person?.name ?? ""),
              6.0.height,
              Text(orderUnpaid.person?.noTelp ?? ""),
              6.0.height,
              Text(orderUnpaid.person?.address ?? ""),
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
              const Divider(),
              ListView.builder(
                  itemCount: orderUnpaid.order.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final produkBelumByar = orderUnpaid.order[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            height: 70,
                            width: 90,
                            child: Image.network(
                              produkBelumByar.product.imageUrl ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(produkBelumByar.product.productName ?? ""),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("x"),
                                    Text(produkBelumByar.totalProduct
                                        .toString()),
                                  ],
                                ),
                                Text(produkBelumByar
                                        .totalProductPrice?.currencyFormatRp
                                        .toString() ??
                                    ""),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              8.0.height,
              const Divider(),
              16.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ongkos Kirim"),
                  Text(
                    orderUnpaid.delivery.shipping?.currencyFormatRp
                            .toString() ??
                        "",
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Promo yang Digunakan"),
                  Text(
                    orderUnpaid.promo.piece?.currencyFormatRp.toString() ?? "",
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${orderUnpaid.order.length} Produk"),
                  Row(
                    children: [
                      const Text("Total Pesanan : "),
                      Text(
                        orderUnpaid.totalOrderPrice.currencyFormatRp.toString(),
                        style:
                            const TextStyle(fontWeight: AppFontWeight.semibold),
                      )
                    ],
                  ),
                ],
              ),
              28.0.height,
              const Text("Metode Pembayaran"),
              Text(orderUnpaid.paymentMethod.methodName ?? ""),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    // context.push(const BatalkanPesananPage());
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
