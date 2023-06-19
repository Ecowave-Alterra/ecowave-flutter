import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/packed_detail_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackedHistoryTransactionPage extends StatelessWidget {
  const PackedHistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistoryTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistoryTransactionSuccess) {
        if (state.dataPacked.isEmpty) {
          return const EmptyState();
        } else {
          return ListView.builder(
              itemCount: state.dataPacked.length,
              itemBuilder: (BuildContext context, int index) {
                final HistoryTransactionModel cPacked = state.dataPacked[index];

                return ProductTransactionWidget(
                  statusOrder: cPacked.statusTransaction,
                  imageUrl: cPacked.orderDetail[0].productImageUrl,
                  colorTextStatusOrder: AppColors.primary500,
                  productName: cPacked.orderDetail[0].productName,
                  totalProductPrice: cPacked.orderDetail[0].subTotalPrice,
                  totalProduct: cPacked.orderDetail[0].qty,
                  totalProductOrder: cPacked.orderDetail.length,
                  totalProductOrderPrice: cPacked.totalPrice,
                  descriptionStatus: "Penjual telah menerima pesanan anda",
                  onPressedDetail: () {
                    context.push(PackedDetailPage(detailTransaction: cPacked));
                  },
                  onPressedAction: () {},
                  buttonName: "Pesanan Diterima",
                  colorTextButton: AppColors.primary300,
                  colorBackgroundButton: AppColors.primary50,
                );
              });
        }
      } else {
        return const EmptyState();
      }
    });
  }
}
