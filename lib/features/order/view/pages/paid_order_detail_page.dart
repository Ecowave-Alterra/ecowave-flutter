import 'package:ecowave/core.dart';
import 'package:ecowave/features/order/model/checkout_model.dart';
import 'package:flutter/material.dart';

class PaidOrderDetailPage extends StatelessWidget {
  final Checkout orderPaid;

  const PaidOrderDetailPage({super.key, required this.orderPaid});

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
                        const Text("Reguler"),
                        InkWell(
                          onTap: () {
                            // context.push(const LacakPesananPage());
                          },
                          child: const Text(
                            "Lacak Pesanan",
                            style: TextStyle(color: AppColors.primary500),
                          ),
                        ),
                      ],
                    ),
                    6.0.height,
                    const Row(
                      children: [
                        Text("JNE Express"),
                        Text(" : "),
                        Text("251372563213")
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
              Text(orderPaid.person?.name ?? ""),
              6.0.height,
              Text(orderPaid.person?.noTelp ?? ""),
              6.0.height,
              Text(orderPaid.person?.address ?? ""),
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
                  itemCount: orderPaid.order.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final produkBelumByar = orderPaid.order[index];
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
                    orderPaid.delivery.shipping?.currencyFormatRp.toString() ??
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
                    orderPaid.promo.piece?.currencyFormatRp.toString() ?? "",
                  )
                ],
              ),
              28.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${orderPaid.order.length} Produk"),
                  Row(
                    children: [
                      const Text("Total Pesanan : "),
                      Text(
                        orderPaid.totalOrderPrice.currencyFormatRp.toString(),
                        style:
                            const TextStyle(fontWeight: AppFontWeight.semibold),
                      )
                    ],
                  ),
                ],
              ),
              28.0.height,
              const Text("Metode Pembayaran"),
              Text(orderPaid.paymentMethod.methodName ?? ""),
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
