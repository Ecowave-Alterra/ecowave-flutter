import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
import 'package:ecowave/features/transaction/view/pages/track_delivery_page.dart';
import 'package:flutter/material.dart';

class PaidTransactionDetailPage extends StatelessWidget {
  final HistoryTransactionModel detailTransaction;

  const PaidTransactionDetailPage({super.key, required this.detailTransaction});

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
              24.0.height,
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
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
                    20.0.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(detailTransaction.typeDelivery),
                        InkWell(
                          onTap: () {
                            context.push(const TrackDeliveryPage());
                          },
                          child: const Text(
                            "Lacak Pesanan",
                            style: TextStyle(color: AppColors.primary500),
                          ),
                        ),
                      ],
                    ),
                    6.0.height,
                    Row(
                      children: [
                        Text(detailTransaction.expedition),
                        const Text(" : "),
                        Text(detailTransaction.resiCode)
                      ],
                    )
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
                  itemCount: detailTransaction.productTransaction.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cPaid = detailTransaction.productTransaction[index];
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
                              cPaid.productImageUrl,
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
                                  cPaid.productName,
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("x"),
                                    Text(cPaid.qty.toString()),
                                  ],
                                ),
                                Text(cPaid.price.currencyFormatRp.toString()),
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
            ],
          ),
        ),
      ),
    );
  }
}
