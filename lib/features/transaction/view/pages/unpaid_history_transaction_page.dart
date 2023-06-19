import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/view/pages/payment_page.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/unpaid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnpaidHistoryTransactionPage extends StatefulWidget {
  final Function moveTab;
  const UnpaidHistoryTransactionPage({super.key, required this.moveTab});

  @override
  State<UnpaidHistoryTransactionPage> createState() =>
      _UnpaidHistoryTransactionPageState();
}

class _UnpaidHistoryTransactionPageState
    extends State<UnpaidHistoryTransactionPage> {
  @override
  void initState() {
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistoryTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      // print("state $state");
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistoryTransactionSuccess) {
        if (state.dataUnpaid.isEmpty) {
          return const EmptyState();
        } else {
          return ListView.builder(
              itemCount: state.dataUnpaid.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final HistoryTransactionModel cUnpaid = state.dataUnpaid[index];

                // if (DateTime.now()
                //         .difference(DateTime.parse(cUnpaid.createdAt))
                //         .inDays >=
                //     1) {
                //   context
                //       .read<HistoryTransactionBloc>()
                //       .add(AddCancelTransactionEvent(cUnpaid.transactionId));
                // }
                return ProductTransactionWidget(
                    statusOrder: cUnpaid.statusTransaction,
                    imageUrl: cUnpaid.orderDetail[0].productImageUrl,
                    colorTextStatusOrder: AppColors.error500,
                    productName: cUnpaid.orderDetail[0].productName,
                    totalProductPrice: cUnpaid.orderDetail[0].subTotalPrice,
                    totalProduct: cUnpaid.orderDetail[0].qty,
                    totalProductOrder: cUnpaid.orderDetail.length,
                    totalProductOrderPrice: cUnpaid.totalPrice,
                    descriptionStatus:
                        "Silahkan melakukan pembayaran agar pesanan segera diproses",
                    onPressedDetail: () {
                      context.push(UnpaidTransactionDetailPage(
                        moveTab: widget.moveTab,
                        detailTransaction: cUnpaid,
                      ));
                    },
                    onPressedAction: () {
                      context.push(PaymentPage(
                        paymentId: cUnpaid.transactionId,
                        paymentUrl: cUnpaid.paymentUrl,
                      ));
                    },
                    buttonName: "Bayar Sekarang");
              });
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
