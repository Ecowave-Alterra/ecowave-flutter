import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/bloc/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
import 'package:ecowave/features/transaction/view/pages/paid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackedHistoryTransactionPage extends StatelessWidget {
  const PackedHistoryTransactionPage({super.key});

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
            itemCount: state.dataPacked.length,
            itemBuilder: (BuildContext context, int index) {
              final HistoryTransactionModel cPacked = state.dataPacked[index];
              return ProductTransactionWidget(
                statusOrder: cPacked.statusTransaction,
                imageUrl: cPacked.productTransaction[0].productImageUrl,
                colorTextStatusOrder: AppColors.primary500,
                productName: cPacked.productTransaction[0].productName,
                totalProductPrice: cPacked.productTransaction[0].price,
                totalProduct: cPacked.productTransaction[0].qty,
                totalProductOrder: cPacked.productTransaction.length,
                totalProductOrderPrice: cPacked.totalPrice,
                descriptionStatus: "Penjual telah menerima pesanan anda",
                onPressedDetail: () {
                  context.push(
                      PaidTransactionDetailPage(detailTransaction: cPacked));
                },
                onPressedAction: () {},
                buttonName: "Pesanan Diterima",
                colorTextButton: AppColors.primary300,
                colorBackgroundButton: AppColors.primary50,
              );
            });
      } else {
        return const EmptyState();
      }
    });
  }
}
