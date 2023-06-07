import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrackDeliveryPage extends StatefulWidget {
  final HistoryTransactionModel detailTransaction;

  const TrackDeliveryPage({super.key, required this.detailTransaction});

  @override
  State<TrackDeliveryPage> createState() => _TrackDeliveryPageState();
}

class _TrackDeliveryPageState extends State<TrackDeliveryPage> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lacak Pesanan"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            const Text(
              "Pesanan sedang dalam pengiriman",
              style: TextStyle(fontWeight: AppFontWeight.medium),
            ),
            14.0.height,
            Row(
              children: [
                const ImageIcon(AppIcons.pengiriman),
                const SizedBox(
                  width: 9,
                ),
                Flexible(
                  child: Text(
                      "Estimasi diterima tanggal : ${DateTime.parse(widget.detailTransaction.estimateReceived).toFormattedDateShort()}"),
                )
              ],
            ),
            30.0.height,
            Text(widget.detailTransaction.typeDelivery),
            6.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${widget.detailTransaction.expedition.toString()} : ${widget.detailTransaction.resiCode.toString()}"),
                Row(
                  children: [
                    Tooltip(
                      key: tooltipkey,
                      triggerMode: TooltipTriggerMode.manual,
                      showDuration: const Duration(seconds: 1),
                      message: 'Text Copied',
                    ),
                    InkWell(
                      onTap: () {
                        tooltipkey.currentState?.ensureTooltipVisible();

                        Clipboard.setData(ClipboardData(
                            text: widget.detailTransaction.resiCode));
                      },
                      child: const Text(
                        'Salin',
                        style: TextStyle(color: AppColors.primary400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            32.0.height,
            Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        widget.detailTransaction.trackingExpedition!.length,
                    itemBuilder: (context, index) {
                      final List<TrackingExpedition> reversedList = widget
                          .detailTransaction.trackingExpedition!.reversed
                          .toList();
                      final TrackingExpedition trackingExpedition =
                          reversedList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateTime.parse(trackingExpedition.deliveryDate)
                                  .toFormattedDateShort(),
                              style: TextStyle(
                                  color: index == 0
                                      ? AppColors.black
                                      : AppColors.grey300),
                            ),
                            Container(
                              width: 50,
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Text(
                                  trackingExpedition.description,
                                  style: TextStyle(
                                      color: index == 0
                                          ? AppColors.black
                                          : AppColors.grey300),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
