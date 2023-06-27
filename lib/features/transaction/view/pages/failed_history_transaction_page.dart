import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/failed_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/pages/reason_canceled_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailedHistoryTransactionPage extends StatelessWidget {
  const FailedHistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistoryFailedTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      // print("state $state");
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      }
      if (state is HistoryTransactionEmpty) {
        return const EmptyState();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(
            errorMessage: state.message,
            onRetry: () {
              context
                  .read<HistoryTransactionBloc>()
                  .add(const GetHistoryFailedTransactionEvent());
            });
      } else if (state is HistoryFailedTransactionSuccess) {
        if (state.dataFailed.isEmpty) {
          return const EmptyState();
        } else {
          return ListView.builder(
              itemCount: state.dataFailed.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // print("Ada data gasih ${state.dataFailed}");
                final HistoryTransactionModel cFailed =
                    state.dataFailed[state.dataFailed.length - 1 - index];
                // print("ada data Failed gak $cFailed");
                return ProductTransactionWidget(
                    statusOrder: cFailed.statusTransaction,
                    imageUrl: cFailed.orderDetail[0].productImageUrl,
                    colorTextStatusOrder: AppColors.primary500,
                    productName: cFailed.orderDetail[0].productName,
                    totalProductPrice: cFailed.orderDetail[0].subTotalPrice,
                    totalProduct: cFailed.orderDetail[0].qty,
                    totalProductOrder: cFailed.orderDetail.length,
                    totalProductOrderPrice: cFailed.totalPrice,
                    descriptionStatus: "Dibatalkan Oleh Anda",
                    onPressedDetail: () {
                      context.push(FailedTransactionDetailPage(
                        detailTransaction: cFailed,
                      ));
                    },
                    onPressedAction: () {
                      context.push(ReasonCanceledPage(
                        reason: cFailed,
                      ));
                    },
                    buttonName: "Alasan Dibatalkan");
              });
        }
      } else {
        return const EmptyState();
      }
    });
  }
}
