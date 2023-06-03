import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/bloc/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
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
    context.read<HistoryTransactionBloc>().add(GetHistoryTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistoryTransactionSuccess) {
        return ListView.builder(
            itemCount: state.dataFailed.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // print("Ada data gasih ${state.dataFailed}");
              final HistoryTransactionModel cFailed = state.dataFailed[index];
              // print("ada data Failed gak $cFailed");
              return ProductTransactionWidget(
                  statusOrder: cFailed.statusTransaction,
                  imageUrl: cFailed.productTransaction[0].productImageUrl,
                  colorTextStatusOrder: AppColors.error500,
                  productName: cFailed.productTransaction[0].productName,
                  totalProductPrice: cFailed.productTransaction[0].price,
                  totalProduct: cFailed.productTransaction[0].qty,
                  totalProductOrder: cFailed.productTransaction.length,
                  totalProductOrderPrice: cFailed.totalPrice,
                  descriptionStatus: "Dibatalkan Oleh Anda",
                  onPressedDetail: () {
                    context.push(FailedTransactionDetailPage(
                      detailTransaction: cFailed,
                    ));
                  },
                  onPressedAction: () {
                    context.push(const ReasonCanceledPage());
                  },
                  buttonName: "Alasan Dibatalkan");
            });
      } else {
        return const EmptyState();
      }
    });
  }
}
