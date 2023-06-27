import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/cancel_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

class UnpaidTransactionDetailPage extends StatelessWidget {
  final Function moveTab;
  final HistoryTransactionModel detailTransaction;

  const UnpaidTransactionDetailPage(
      {super.key, required this.detailTransaction, required this.moveTab});

  @override
  Widget build(BuildContext context) {
    final DateTime transactionTime =
        DateTime.parse(detailTransaction.createdAt);

    final DateTime targetTime = transactionTime.add(const Duration(days: 1));

    final DateTime modifiedTargetTime =
        targetTime.add(const Duration(hours: 7));
    final String tempoTime =
        DateFormat('d MMM y, H:mm a', 'id').format(modifiedTargetTime);

    final int endTime = targetTime.millisecondsSinceEpoch;
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistoryUnpaidTransactionEvent());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan Saya"),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                                    widgetBuilder:
                                        (_, CurrentRemainingTime? time) {
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
                    Text(detailTransaction.address.recipient),
                    6.0.height,
                    Text(detailTransaction.address.phone),
                    6.0.height,
                    Text(detailTransaction.address.address),
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
                        itemCount: detailTransaction.orderDetail.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final OrderDetail product =
                              detailTransaction.orderDetail[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _sizedContainer(
                                  CachedNetworkImage(
                                    imageUrl: product.productImageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                      color: Colors.green,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
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
                                        product.productName,
                                        textAlign: TextAlign.right,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text("x"),
                                          Text(product.qty.toString()),
                                        ],
                                      ),
                                      Text(product
                                          .subTotalPrice.currencyFormatRp
                                          .toString()),
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
                          detailTransaction.totalShippingPrice.currencyFormatRp
                              .toString(),
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
                            detailTransaction.address.note,
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
                          detailTransaction.discount.toString(),
                        )
                      ],
                    ),
                    28.0.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${detailTransaction.orderDetail.length} Produk"),
                        Row(
                          children: [
                            const Text("Total Pesanan : "),
                            Text(
                              detailTransaction.totalPrice.currencyFormatRp
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: AppFontWeight.semibold),
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
                          context.push(CancelTransactionPage(
                            transaction: detailTransaction,
                            moveTab: moveTab,
                          ));
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
                ))));
  }

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 90.0,
      height: 70.0,
      child: Center(child: child),
    );
  }
}
