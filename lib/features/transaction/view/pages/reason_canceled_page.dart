import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReasonCanceledPage extends StatelessWidget {
  final HistoryTransactionModel reason;
  const ReasonCanceledPage({super.key, required this.reason});

  @override
  Widget build(BuildContext context) {
    final DateTime orderTime =
        DateTime.parse(reason.createdAt).add(const Duration(hours: 7));

    final String orderTimeId =
        DateFormat('d MMM y, H:mm a', 'id').format(orderTime);

    final DateTime cancelTime =
        DateTime.parse(reason.updatedAt).add(const Duration(hours: 7));

    final String cancelTimeId =
        DateFormat('d MMM y, H:mm a', 'id').format(cancelTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alasan Dibatalkan"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pada"),
                  Text(cancelTimeId),
                ],
              ),
              28.0.height,
              ListView.builder(
                itemCount: reason.orderDetail.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final OrderDetail product = reason.orderDetail[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sizedContainer(
                          CachedNetworkImage(
                            imageUrl: product.productImageUrl,
                            imageBuilder: (context, imageProvider) => Container(
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(product.productName),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("x"),
                                  Text(product.qty.toString()),
                                ],
                              ),
                              Text(product.subTotalPrice.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              8.0.height,
              const Divider(),
              16.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Diminta Pada"),
                  Text(orderTimeId),
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
                      child: Text(
                        reason.canceledReason,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              28.0.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Status Pembayaran"), Text("Belum dibayar")],
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

  formatDateMinutes(String date) {
    String dateString = date;
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd MMM yyyy HH:mm:ss');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
