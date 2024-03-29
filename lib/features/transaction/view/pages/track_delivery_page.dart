import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/tracking_delivery/tracking_delivery_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/model/models/tracking_delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TrackDeliveryPage extends StatefulWidget {
  final HistoryTransactionModel detailTransaction;

  const TrackDeliveryPage({super.key, required this.detailTransaction});

  @override
  State<TrackDeliveryPage> createState() => _TrackDeliveryPageState();
}

class _TrackDeliveryPageState extends State<TrackDeliveryPage> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  void initState() {
    context.read<TrackingDeliveryBloc>().add(GetTracingDeliveryEvent(
        resi:
            widget.detailTransaction.receiptNumber ?? "No Resi Belum Tersedia",
        cou: widget.detailTransaction.expeditionName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lacak Pesanan"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        "Estimasi diterima : ${widget.detailTransaction.estimationDay} hari"),
                  )
                ],
              ),
              30.0.height,
              const Text("REGULER"),
              6.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(widget.detailTransaction.expeditionName
                          .toUpperCase()),
                      const Text(" : "),
                      Text(
                        widget.detailTransaction.receiptNumber == ''
                            ? ' : No Resi Belum Tersedia'
                            : widget.detailTransaction.receiptNumber ??
                                " : No Resi Belum Tersedia",
                      )
                    ],
                  ),
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
                              text: widget.detailTransaction.receiptNumber ??
                                  "No Resi belum tersedia"));
                        },
                        child: const Text(
                          'Salin',
                          style: TextStyle(color: AppColors.primary500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              32.0.height,
              BlocBuilder<TrackingDeliveryBloc, TrackingDeliveryState>(
                builder: (context, state) {
                  if (state is TrackingDeliveryLoading) {
                    return const EcoLoading();
                  } else if (state is TrackingDeliveryEmpty) {
                    return const Center(
                      child: Text("Belum ada proses pengiriman"),
                    );
                  } else if (state is TrackingDeliveryFailed) {
                    return EcoError(
                        errorMessage: state.message, onRetry: () {});
                  } else if (state is TrackingDeliverySuccess) {
                    if (state.dataTracking.isEmpty) {
                      return const Center(
                        child: Text("Belum ada proses pengiriman"),
                      );
                    } else {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.dataTracking.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final TrackingDeliveryModel trackingDelivery =
                                state.dataTracking[index];

                            final String deliveryDate = DateFormat(
                                    'd MMM y, H:mm a', 'id')
                                .format(DateTime.parse(trackingDelivery.date));
                            return Container(
                              margin: const EdgeInsets.only(bottom: 28),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    deliveryDate,
                                    style: TextStyle(
                                        color: index == 0
                                            ? AppColors.primary500
                                            : AppColors.grey300),
                                  ),
                                  Container(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        trackingDelivery.desc,
                                        style: TextStyle(
                                            color: index == 0
                                                ? AppColors.primary500
                                                : AppColors.grey300),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
