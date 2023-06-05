import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
import 'package:ecowave/features/transaction/view/pages/cancel_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

class UnpaidTransactionDetailPage extends StatelessWidget {
  final HistoryTransactionModel detailTransaction;

  const UnpaidTransactionDetailPage(
      {super.key, required this.detailTransaction});

  @override
  Widget build(BuildContext context) {
    final DateTime transactionTime =
        DateTime.parse(detailTransaction.createdAt);

    final DateTime targetTime = transactionTime.add(const Duration(days: 1));
    final String tempoTime =
        DateFormat('d MMM y, H:mm a', 'id').format(targetTime);

    final int endTime = targetTime.millisecondsSinceEpoch;

    // print("INi trnsaction Time $transactionTime");
    // print("INi target Time $targetTime");
    // print("INi tempo Time $tempoTime");
    // print("INi end Time $endTime");

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
                                // print("ini timeeeee $time");
                                // print("ini endTime $endTime");

                                if (time == null) {
                                  return const Text(
                                    'Waktu telah habis',
                                    style: TextStyle(
                                      color: AppColors.error600,
                                      fontWeight: AppFontWeight.semibold,
                                    ),
                                  );
                                }
                                final int hours = time.hours ?? 0;
                                final int minutes = time.min ?? 0;
                                final int seconds = time.sec ?? 0;
                                final String formattedTime =
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
                            Text("Jatuh tempo $tempoTime"),
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
              Text(detailTransaction.recipient),
              6.0.height,
              Text(detailTransaction.phone),
              6.0.height,
              Text(detailTransaction.address),
              Container(
                margin: const EdgeInsets.only(bottom: 16, top: 32),
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
                  itemCount: detailTransaction.productTransaction.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cUnpaid = detailTransaction.productTransaction[index];
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
                              cUnpaid.productImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  cUnpaid.productName,
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("x"),
                                    Text(cUnpaid.qty.toString()),
                                  ],
                                ),
                                Text(cUnpaid.price.currencyFormatRp.toString()),
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
                    detailTransaction.shipping.currencyFormatRp.toString(),
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Catatan Untuk Kurir"),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      detailTransaction.note,
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Promo yang Digunakan"),
                  Text(
                    detailTransaction.voucher.currencyFormatRp.toString(),
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${detailTransaction.productTransaction.length} Produk"),
                  Row(
                    children: [
                      const Text("Total Pesanan : "),
                      Text(
                        detailTransaction.totalPrice.currencyFormatRp
                            .toString(),
                        style:
                            const TextStyle(fontWeight: AppFontWeight.semibold),
                      )
                    ],
                  ),
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Metode Pembayaran"),
                  Text(detailTransaction.paymentMethod),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    context.push(const CancelTransactionPage());
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
