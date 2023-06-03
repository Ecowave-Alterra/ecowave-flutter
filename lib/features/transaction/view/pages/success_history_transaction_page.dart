import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/bloc/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/view/pages/paid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/pages/rating_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessHistoryTransactionPage extends StatelessWidget {
  const SuccessHistoryTransactionPage({super.key});

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
            itemCount: state.dataSuccess.length,
            itemBuilder: (BuildContext context, int index) {
              final cSuccess = state.dataSuccess[index];
              return ProductTransactionWidget(
                statusOrder: cSuccess.statusTransaction,
                imageUrl: cSuccess.productTransaction[0].productImageUrl,
                colorTextStatusOrder: AppColors.primary500,
                productName: cSuccess.productTransaction[0].productName,
                totalProductPrice: cSuccess.productTransaction[0].price,
                totalProduct: cSuccess.productTransaction[0].qty,
                totalProductOrder: cSuccess.productTransaction.length,
                totalProductOrderPrice: cSuccess.totalPrice,
                descriptionStatus:
                    "Silahkan konfirmasi setelah menerima pesanan",
                onPressedDetail: () {
                  context.push(
                      PaidTransactionDetailPage(detailTransaction: cSuccess));
                },
                onPressedAction: () {
                  showConfirmation(
                      title: 'Kamu bakal melepaskan Rp20.000 ke penjual',
                      message: 'Pastikan paket sudah sesuai dan diterima, ya!',
                      nameButtonConfirmation: 'Iya',
                      colorButtonConfirmation: AppColors.primary500,
                      pressNavConfirmation: () {
                        context.pushReplacement(const RatingPage());
                      },
                      context: context,
                      nameButtonUnConfirmation: 'Tidak');
                },
                buttonName: "Pesanan Diterima",
              );
            });
      } else {
        return const EmptyState();
      }
    });
  }
}
