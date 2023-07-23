import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:flutter/material.dart';

class FailedTransactionDetailPage extends StatelessWidget {
  final HistoryTransactionModel detailTransaction;

  const FailedTransactionDetailPage(
      {super.key, required this.detailTransaction});

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
                    final cFailed = detailTransaction.orderDetail[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _sizedContainer(
                            CachedNetworkImage(
                              imageUrl: (cFailed.productImageUrl.isNotEmpty)
                                  ? (cFailed.productImageUrl)
                                  : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
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
                                  cFailed.productName,
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("x"),
                                    Text(cFailed.qty.toString()),
                                  ],
                                ),
                                Text(cFailed.subTotalPrice.currencyFormatRp
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
                    detailTransaction.discount.currencyFormatRp.toString(),
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
                  Text(detailTransaction.paymentMethod == ""
                      ? "-"
                      : detailTransaction.paymentMethod ?? ""),
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

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 90.0,
      height: 70.0,
      child: Center(child: child),
    );
  }
}
